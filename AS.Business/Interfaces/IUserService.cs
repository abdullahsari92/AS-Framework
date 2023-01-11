using System.Linq.Expressions;
using AS.Entities.DataEntities;
using AS.Entities.UIModels;

namespace AS.Business.Interfaces
{
    public interface IUserService
    {
        List<UserModel> GetAll();
        User GetById(int id);
        List<RoleUserLine> GetRoleUser(int userId);
       // IEnumerable<User> GetByFilter(UserFiltre filtre);
        User Insert(UserModel user);
        void Update(User user);
        void Delete(int id);



    }
}
