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

            
            var permissionList = _permissionService.GetAll();


            return Ok(permissionList);
        }


        [HttpPost]
        public IActionResult Add([FromBody] PermissionDto permissionDto)
        {
                
            try
            {
                 _permissionService.Insert(permissionDto);
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
                _permissionService.Update(permissionDto);
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
                _permissionService.Delete(Id);
            }
            catch (Exception ex)
            {

                return Ok(new ErrorResult(ex.Message));

            }

            return Ok(true);
        }
    }
}
