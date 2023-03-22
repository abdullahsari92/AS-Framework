using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Helpers;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AutoMapper;
using AutoMapper.QueryableExtensions;

namespace AS.Business
{
    public class PermissionManager : IPermissionService
    {
        private readonly IRepository<Permission> _permissionRepository;


        private readonly IRepository<RoleUserLine> _repositoryRoleUser;
        private readonly IMapper _mapper;

        //   private readonly IValidationManager<PermissionDto> _userValidator;
        //private readonly IBirimService _birimService;

        public PermissionManager( IRepository<RoleUserLine> repositoryRoleUser, IMapper mapper, IRepository<Permission> repositoryPermission)
        {
            _repositoryRoleUser = repositoryRoleUser;
            _mapper = mapper;
            _permissionRepository = repositoryPermission;
            // _userValidator = userValidator;
        }

        public List<PermissionDto> GetAll()
        {
            return null;

           // return _permissionRepository.GetAll().ProjectTo<PermissionDto>(_mapper.ConfigurationProvider).ToList() ?? new List<PermissionDto>();
        }

        public PermissionDto GetById(Guid id)
        {
            return null;
            //var permission =  _permissionRepository.GetAll().FirstOrDefault(x => x.Id == id) ?? new Permission();

            //    return  _mapper.Map(permission, new PermissionDto());
        }
               

        public bool Insert(PermissionDto permissionDto)
        {
            //   _userValidator.Validate(user);

            if (_permissionRepository.IsExist(x => x.Id == permissionDto.Id))
                throw new Exception("Bu user daha önce eklenmiþtir.");


           var permission = _mapper.Map(permissionDto, new Permission());

            permission = BaseEntityHelper.SetBaseEntitiy(permission);

            permission.Id = new Guid();

            return true;

        }

        public void Update(PermissionDto permissionDto)
        {
              

             var permission = _permissionRepository.Get(p=>p.Id ==permissionDto.Id);

            permission = _mapper.Map(permissionDto, permission);
         
             _permissionRepository.Update(permission);
        }

        public void Delete(Guid id)
        {

            _permissionRepository.Delete(id);
        }

    }

}
