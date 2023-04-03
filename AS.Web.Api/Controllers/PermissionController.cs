using AS.Business.Interfaces;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using Microsoft.AspNetCore.Mvc;

namespace AS.Web.Api.Controllers
{
    [Route("api/[controller]/")]
    [ApiController]
    public class PermissionController : ControllerBase
    {

        private IPermissionService _permissionService;
        public PermissionController(IPermissionService permissionManager)
        {
            _permissionService = permissionManager;
        }

        
       // [HttpGet(Name = "GetAll")]
        public IActionResult GetAll()
        {

            
            var permissionList = _permissionService.BaseGetAll();


            return Ok(permissionList);
        }


        [HttpPost]
        public IActionResult Add([FromBody] PermissionDto permissionDto)
        {
                
            try
            {
                 _permissionService.BaseInsert(permissionDto);
            }
            catch (Exception ex)
            {
                 return Ok(new ErrorResult(ex.Message));

            }

            return Ok(new SuccessResult("İşlem Başaralı"));
        }



        [HttpPost]
        public IActionResult Update([FromBody] PermissionDto permissionDto)
        {
      
            try
            {
                _permissionService.BaseUpdate(permissionDto);
            }
            catch (Exception ex)
            {

                return Ok(new ErrorResult(ex.Message));

            }



            return Ok(new SuccessResult("İşlem Başaralı"));
        }


        [HttpPost]
        public IActionResult Delete([FromBody] Guid Id)
        {

            try
            {
                _permissionService.BaseDelete(Id);
            }
            catch (Exception ex)
            {

                return Ok(new ErrorResult(ex.Message));

            }

            return Ok(true);
        }
    }
}
