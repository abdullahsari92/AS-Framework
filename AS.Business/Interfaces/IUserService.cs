using System.Linq.Expressions;
using AS.Entities.Dtos;
using AS.Entities.Entity;

namespace AS.Business.Interfaces
{
    public interface IUserService
    {
        List<UserDto> GetAll();
        User GetById(Guid id);
        List<RoleUserLine> GetRoleUser(Guid userId);
       // IEnumerable<User> GetByFilter(UserFiltre filtre);
        User Insert(UserDto userDto);
        void Update(UserDto user);
        void Delete(Guid id);



    }
}
