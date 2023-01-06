using AS.Business.Interfaces;
using AS.Core;
using AS.Entities.DataEntities;

namespace AS.Business
{
    public class UserManager : IUserService
    {
        private readonly IRepository<User> _repositoryUser;

        private readonly IRepository<RoleUserLine> _repositoryRoleUser;
        //   private readonly IValidationManager<User> _userValidator;
        //private readonly IBirimService _birimService;

        public UserManager(IRepository<User> repositoryUser, IRepository<RoleUserLine> repositoryRoleUser)
        {
            _repositoryRoleUser = repositoryRoleUser;
            _repositoryUser = repositoryUser;
            // _userValidator = userValidator;
        }

        public List<User> GetAll()
        {
            return _repositoryUser.GetAll().ToList();
        }

        public User GetById(int id)
        {
            return _repositoryUser.GetAll().FirstOrDefault(x => x.Id == id);
        }

        public List<RoleUserLine> GetRoleUser(int userId)
        {
            return _repositoryRoleUser.GetAll().Where(x => x.Id == userId).ToList();
        }


        public User Insert(User user)
        {
            //   _userValidator.Validate(user);

            if (_repositoryUser.IsExist(x => x.Username == user.Username))
                throw new Exception("Bu user daha önce eklenmiþtir.");

            //user = BaseEntityHelper.SetBaseEntitiy(user);


            return _repositoryUser.Insert(user);
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
