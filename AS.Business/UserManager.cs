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
      //  public readonly IRepository<User> _repository;

      
    
        //   private readonly IValidationManager<User> _userValidator;
        //private readonly IBirimService _birimService;

        public UserManager(IRepository<User> repositoryUser, IMapper mapper):base(repositoryUser, mapper)
        {
       
          //  _repository = repositoryUser;
           
        }

        public async Task<ListModel<UserDto>> GetAll()
        {
         
            var listModel =  new ListModel<UserDto>();
            var users = await _repository.GetAll();
           
            listModel.Items = await users.ProjectTo<UserDto>(_mapper.ConfigurationProvider).ToListAsync();


                
            return  listModel;
        }
    
        public async Task<UserDto> GetById(Guid id)
        {

            var user = await _repository.GetAsync(p => p.Id == id);

            var userDto = _mapper.Map(user, new UserDto());

            return userDto;
        }

        public List<RoleUserLine> GetRoleUser(Guid userId)
        {
            //return _repositoryRoleUser.GetAll().Where(x => x.Id == userId).ToList();

            return null;
                
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

        public void Update(UserDto userDto)
        {
              
            var user = _repository.Get(p=>p.Id ==userDto.Id);

            user = _mapper.Map(userDto, user);         
             _repository.Update(user);
        }

        public void Delete(Guid id)
        {      
            _repository.Delete(id);
        }
 

    }

}
