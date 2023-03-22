using System.Linq.Expressions;
using AS.Entities.Dtos;
using AS.Entities.Entity;

namespace AS.Business.Interfaces
{
    public interface IPermissionService
    {
        List<PermissionDto> GetAll();
        PermissionDto GetById(Guid id);  
        bool Insert(PermissionDto permissionDto);
        void Update(PermissionDto permissionDto);
        void Delete(Guid id);



    }
}
