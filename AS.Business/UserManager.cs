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
    public class UserManager : IUserService
    {
        private readonly IRepository<User> _repositoryUser;

        private readonly IRepository<RoleUserLine> _repositoryRoleUser;
        private readonly IMapper _mapper;

        //   private readonly IValidationManager<User> _userValidator;
        //private readonly IBirimService _birimService;

        public UserManager(IRepository<User> repositoryUser, IRepository<RoleUserLine> repositoryRoleUser, IMapper mapper)
        {
            _repositoryRoleUser = repositoryRoleUser;
            _mapper = mapper;
            _repositoryUser = repositoryUser;
            // _userValidator = userValidator;
        }

        public async Task<ListModel<UserDto>> GetAll()
        {

           //var FirstOrDefault =  _repositoryUser.GetAll().FirstOrDefault(p => p.LastName == "dag33");

           //var LastOrDefault =  _repositoryUser.GetAll().SingleOrDefault(p => p.LastName == "daddd");


            var listModel =  new ListModel<UserDto>();
            var users = await _repositoryUser.GetAll();
            listModel.Items = await users.ProjectTo<UserDto>(_mapper.ConfigurationProvider).ToListAsync();

        
            return listModel;
        }

        public async Task<UserDto> GetById(Guid id)
        {
            return null;
           // return await _repositoryUser.GetAll().ProjectTo<UserDto>(_mapper.ConfigurationProvider).FirstOrDefaultAsync(x => x.Id == id) ?? new UserDto(); 
        }

        public List<RoleUserLine> GetRoleUser(Guid userId)
        {
            //return _repositoryRoleUser.GetAll().Where(x => x.Id == userId).ToList();

            return null;
                
        }


        public async Task<UserDto> Insert(UserDto userDto)
        {
            //   _userValidator.Validate(user);

            if (_repositoryUser.IsExist(x => x.Username == userDto.Username))
                throw new Exception("Bu user daha önce eklenmiþtir.");


           var user = _mapper.Map(userDto, new User());

            user = BaseEntityHelper.SetBaseEntitiy(user);

            user.CreatedBy = new User() { Id=user.Id };
            user.UpdatedBy = new User() { Id = user.Id };

            // user.Id = new Guid();
            //  user.IsApproved = 1;
            


            return _mapper.Map(await _repositoryUser.InsertAsync(user), new UserDto());

        }

        public void Update(UserDto userDto)
        {
              

             var user = _repositoryUser.Get(p=>p.Id ==userDto.Id);

            user = _mapper.Map(userDto, user);
         
             _repositoryUser.Update(user);
        }

        public void Delete(Guid id)
        {      
            _repositoryUser.Delete(id);
        }
 

    }

}
