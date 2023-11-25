using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Helpers;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;

namespace AS.Business
{
    public class UserManager :BaseManager<User,UserDto>, IUserService
    {
       public readonly IRepository<RoleUserLine> _roleUserLineRepository;

        public UserManager(IRepository<User> repositoryUser, IMapper mapper, IRepository<RoleUserLine> roleUserLine) : base(repositoryUser, mapper)
        {
            _roleUserLineRepository = roleUserLine;
        }

        public async Task<ListModel<UserDto>> GetAll()
        {
         
            var listModel =  new ListModel<UserDto>();
            var users = await _repository.GetAll();

            var dd = users.Include(p => p.Student).ToList();

            listModel.Items = await users.Include(p=>p.Student).ProjectTo<UserDto>(_mapper.ConfigurationProvider).ToListAsync();


                
            return  listModel;
        }
    
        public async Task<UserDto> GetById(Guid id)
        {
            var userQuery = await _repository.GetAll();

            var user = userQuery.Include(p => p.RoleUserLines).FirstOrDefault(p => p.Id == id);

            var userDto = _mapper.Map(user, new UserDto());

            userDto.RoleIds = user.RoleUserLines.Select(p => p.RoleId.ToString().ToUpper()).ToList();

            return userDto;
        }

        public async Task<List<Role>> GetRoleUser(Guid userId)
        {
            var roleLine = await _roleUserLineRepository.GetAll(x => x.User.Id == userId);

            var roles = await roleLine.Select(m => m.Role).ToListAsync();
            ;
            return roles;
        }


        public async Task<UserDto> Insert(UserDto userDto)
        {
            if (_repository.IsExist(x => x.Username == userDto.Username))
                throw new Exception("Bu user daha önce eklenmiþtir.");


          var user = _mapper.Map(userDto, new User());
                 
            user = BaseEntityHelper.SetBaseEntitiy(user);

             user.Id = Guid.NewGuid();
             user.IsApproved = true;
            
            return _mapper.Map(await _repository.InsertAsync(user), new UserDto());
        }

        public async void Update(UserDto userDto)
        {
              
            var user = _repository.Get(p=>p.Id ==userDto.Id);

            user = _mapper.Map(userDto, user);         
             _repository.Update(user);


            if(userDto.RoleIds.Count() >0)
            {
                List<RoleUserLine> lineList = new();

                #region tüm roller siliniyor           
                    var userLineRole = await  _roleUserLineRepository.GetAll(p => p.UserId == userDto.Id);
                    _roleUserLineRepository.DeleteRange(userLineRole);
                #endregion

                foreach (var item in userDto.RoleIds)
                {
                   var roleLine = new RoleUserLine()
                        {
                            UserId = userDto.Id,
                            RoleId = new Guid(item),
                            Id = Guid.NewGuid(),
                             IsApproved = true
                    };
                    roleLine = BaseEntityHelper.SetBaseEntitiy(roleLine);
                    lineList.Add(roleLine);
                }
                _roleUserLineRepository.InsertRange(lineList);
            }
        }

        public void Delete(Guid id)
        {      
            _repository.Delete(id);
        }
 

    }

}
