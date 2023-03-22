using System.Linq.Expressions;
using AS.Core;
using AS.Entities.Dtos;
using AS.Entities.Entity;

namespace AS.Business.Interfaces
{
    public interface IUserService: ICrudService<UserDto>
    {
        //List<UserDto> GetAll();
       // User GetById(Guid id);
        List<RoleUserLine> GetRoleUser(Guid userId);
       // IEnumerable<User> GetByFilter(UserFiltre filtre);
      //  User Insert(UserDto userDto);
        //void Update(UserDto user);
       // void Delete(Guid id);



    }
}
