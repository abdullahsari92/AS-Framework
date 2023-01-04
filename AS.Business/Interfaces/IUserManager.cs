using System.Linq.Expressions;
using AS.Entities.DataEntities;

namespace AS.Business.Interfaces
{
    public interface IUserManager
    {
        List<User> GetAll();
        User GetById(int id);
        List<RoleUserLine> GetRoleUser(int userId);
       // IEnumerable<User> GetByFilter(UserFiltre filtre);
        User Insert(User user);
        void Update(User user);
        void Delete(int id);



    }
}
