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
    public class RoleManager : BaseManager<Role,RoleDto>,IRoleService
    {

        private IRepository<Permission> _permissionRepository;
        private IRepository<RolePermissionLine> _rolePermissionRepository;


        public RoleManager(IRepository<Role> repositoryRole, IMapper mapper, IRepository<Permission> permissionRepository) : base(repositoryRole, mapper)
        {
            _permissionRepository = permissionRepository;
        }

        public async Task<ListModel<PermissionDto>> Get(Guid roleId)
        {

         // var rolePermissionList =  _rolePermissionRepository.GetAll().Include(p => p.Role).Where(p=>p.Role.Id == roleId);


            var listModel = new ListModel<PermissionDto>();

            var query = await _permissionRepository.GetAll();

            var dto = query.GroupBy(p => p.ControllerName).ToList();

            return listModel;
        }
    }
}


