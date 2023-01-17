using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Helpers;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AutoMapper;
using AutoMapper.QueryableExtensions;

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

        public List<UserDto> GetAll()
        {
            return _repositoryUser.GetAll().ProjectTo<UserDto>(_mapper.ConfigurationProvider).ToList() ?? new List<UserDto>();
        }

        public User GetById(int id)
        {
            return _repositoryUser.GetAll().FirstOrDefault(x => x.Id == id);
        }

        public List<RoleUserLine> GetRoleUser(int userId)
        {
            return _repositoryRoleUser.GetAll().Where(x => x.Id == userId).ToList();
        }


        public User Insert(UserDto userDto)
        {
            //   _userValidator.Validate(user);

            if (_repositoryUser.IsExist(x => x.Username == userDto.Username))
                throw new Exception("Bu user daha �nce eklenmi�tir.");

            user = BaseEntityHelper.SetBaseEntitiy(user);

            return new User();

            //return _repositoryUser.Insert(user);
        }

        public void Update(User user)
        {

        }

        public void Delete(int id)
        {
            var User = GetById(id);

            _repositoryUser.Delete(User);
        }

    }

}
