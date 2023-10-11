using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Helpers;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AS.Entities.Enums;
using AS.Entities.Models;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;

namespace AS.Business
{
    public class RoleManager : BaseManager<Role,RoleDto>,IRoleService
    {

        private IRepository<Permission> _permissionRepository;
        private IRepository<RolePermissionLine> _rolePermissionRepository;


        public RoleManager(IRepository<Role> repositoryRole, IMapper mapper, IRepository<Permission> permissionRepository, IRepository<RolePermissionLine> rolePermissionRepository) : base(repositoryRole, mapper)
        {
            _permissionRepository = permissionRepository;
            _rolePermissionRepository = rolePermissionRepository;
        }


        public async Task<RoleDetailModel> Get(Guid roleId)
        {
            GetPermissionClaims(roleId);


            var rolePermissionList = await _rolePermissionRepository.GetAll();

            var userPermission = rolePermissionList.Include(p=>p.Role).Where(p => p.Role.Id == roleId).Select(p => p.Permission);

            RoleDetailModel model = new RoleDetailModel();

            model.RoleDto = await BaseGetById(roleId);

            var listModel = new List<IGrouping<string, Permission>>();

            var query = await _permissionRepository.GetAll();

            var permissionModelList = new List<PermissionModel>() {};



            var controllerList = query.Select(p => p.ControllerName).Distinct().ToList();
            foreach (var item in controllerList)
            {
                var permissionModel = new PermissionModel();
                permissionModel.ControllerName = item.ToString();

                foreach (var value in Enum.GetValues(typeof(CRUDActionType)))
                {
                    var permissionCrudSelected = new PermissionCrudSelected();
                    permissionCrudSelected.CRUDActionType  = (int)value;

                    foreach (var subItem in userPermission.Where(p => p.ControllerName == item.ToString()))
                    {
                        permissionModel.Checked = true;
                       if(permissionCrudSelected.CRUDActionType == subItem.CRUDActionType)
                        {
                            permissionCrudSelected.Checked = true;
                        }
                    }
                    permissionModel.ControllerCrudList.Add(permissionCrudSelected);
                }

                permissionModelList.Add(permissionModel);

            }

            model.PermissionList = permissionModelList;


            return model;
        }


        public async Task<string> GetPermissionClaims(Guid roleId)
        {

            var rolePermissionList = await _rolePermissionRepository.GetAll();

            var userPermission = rolePermissionList.Include(p => p.Role).Where(p => p.Role.Id == roleId).Select(p => p.Permission);

            string claims = "";

            foreach (var item in userPermission)
            {
                var permissionModel = new PermissionModel();

                claims += item.ControllerName +"." + Enum.GetName(typeof(CRUDActionType), item.CRUDActionType);
                claims += ","; 
            }

            return claims;
        }


        public async Task<List<PermissionModel>> RolePermissionAdd(RoleDetailModel roleAddModel)
        {
            var query = await _permissionRepository.GetAll();


            var sonuc =await  RolePermissionDelete(roleAddModel.RoleDto.Id);

            if (sonuc)
            {

                foreach (var item in roleAddModel.PermissionList.Where(p=>p.Checked))
                {
                    var CRUDActionTypeList = item.ControllerCrudList.Where(s => s.Checked).Select(m => m.CRUDActionType);

                    var controllerPermissionList = await query.Where(p => p.ControllerName == item.ControllerName && CRUDActionTypeList.Contains(p.CRUDActionType)).ToListAsync();

                    foreach (var controllerPermission in controllerPermissionList)
                    {
                        var rolePermissionLine = new RolePermissionLine()
                        {
                            PermissionId = controllerPermission.Id,
                            RoleId = roleAddModel.RoleDto.Id
                        };

                        rolePermissionLine = BaseEntityHelper.SetBaseEntitiy(rolePermissionLine);

                        _rolePermissionRepository.Insert(rolePermissionLine);
                    }
                }
            }

            return roleAddModel.PermissionList;
        }

        public async Task<bool> RolePermissionDelete(Guid roleId)
        {

           var query = await _rolePermissionRepository.GetAll();
            foreach (var item in query.Where(p=>p.RoleId == roleId).ToList())
            {

                _rolePermissionRepository.DeleteAsync(item,true);

            }
           bool  sonuc = await _rolePermissionRepository.SaveChangesAsync() != 0;




            return sonuc;
        }

        public async Task<List<PermissionModel>> RolePermissionUpdate(RoleDetailModel roleAddModel)
        {
            _rolePermissionRepository.Delete(roleAddModel.RoleDto.Id);


            RolePermissionAdd(roleAddModel);

            return roleAddModel.PermissionList;
        }


        public async Task<ListModel<PermissionModel>> GetEski(Guid roleId)
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
                permissionModel.ControllerName = item.ToString();

                foreach (var subItem in query.Where(p=>p.ControllerName ==item.ToString()))
                {
                    var aa = _mapper.Map(subItem, new PermissionDto());
                   // permissionModel.Value.Add(aa);
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


