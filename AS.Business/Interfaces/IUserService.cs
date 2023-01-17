using System.Linq.Expressions;
using AS.Data.Entity;
using AS.Entities.Dtos;

namespace AS.Business.Interfaces
{
    public interface IUserService
    {
        List<UserDto> GetAll();
        User GetById(int id);
        List<RoleUserLine> GetRoleUser(int userId);
       // IEnumerable<User> GetByFilter(UserFiltre filtre);
        User Insert(UserDto userDto);
        void Update(User user);
        void Delete(int id);



    }
}
