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

        public async Task<ListModel<PermissionModel>> Get(Guid roleId)
        {

          //var rolePermissionList =  _rolePermissionRepository.GetAll().ContinueWith(p => p.).Where(p=>p.Role.Id == roleId);


            var listModel = new List<IGrouping<string, Permission>> ();

            var query = await _permissionRepository.GetAll();

            var permissionModelList = new ListModel<PermissionModel>() { Items = new List<PermissionModel> {       
            } };


            var deger = query.Select(p => p.ControllerName).Distinct().ToList();
            foreach (var item in query.Select(p=>p.ControllerName).Distinct().ToList())
            {
                var permissionModel = new PermissionModel();
                permissionModel.Key = item.ToString();

                foreach (var subItem in query.Where(p=>p.ControllerName ==item.ToString()))
                {
                    var aa = _mapper.Map(subItem, new PermissionDto());
                    permissionModel.Value.Add(aa);
                }

              //  if(permissionModelList.Any(p=>p.))
                permissionModelList.Items.Add(permissionModel);
                
            }
                      


          //var aa =  query.GroupBy(p => p.ControllerName).Select(p => new PermissionModel
          //  {
          //      Key = p.Key,
          //      Value = p as List<PermissionDto>
          //  }
          //    ).ToList();

          //  listModel = await query.ProjectTo<PermissionDto>().GroupBy(p => p.ControllerName).ToList();

            return permissionModelList;
        }
    }
}


