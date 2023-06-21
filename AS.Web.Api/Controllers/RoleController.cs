using AS.Business.Interfaces;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using Microsoft.AspNetCore.Mvc;

namespace AS.Web.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class RoleController : ControllerBase
    {

        private IRoleService _roleManager;
        public RoleController(IRoleService roleManager)
        {
            _roleManager = roleManager;
        }

        
       // [HttpGet(Name = "GetAll")]
        public async Task<ActionResult<Core.IResult>> List()
        {

            var roleList = await _roleManager.BaseGetAll();
                  
          return  new SuccessDataResult<ListModel<RoleDto>>(roleList);
           
        }



        [HttpGet("{id}")]
        public async Task<ActionResult<Core.IResult>> GetById( Guid Id)
        {


            ListModel<PermissionModel> model = new ListModel<PermissionModel>();    
            try
            {
             model = await _roleManager.Get(Id);

                return new SuccessDataResult<ListModel<PermissionModel>>(model);

            }
            catch (Exception ex)
            {
                return new ErrorResult(ex.Message);

            }

        }

        [HttpPost]
        public async Task<ActionResult<Core.IResult>> Add([FromBody] RoleDto roleDto)
        {


            RoleDto model = new RoleDto();     
            try
            {
                model = await _roleManager.BaseInsert(roleDto);

             return   new SuccessDataResult<RoleDto>(model);              

            }
            catch (Exception ex)
            {
                        return new ErrorResult(ex.Message);              

            }
       
        }



        [HttpPost]
        public async Task<ActionResult<Core.IResult>> Update([FromBody] RoleDto roleDto)
        {

               try
            {
               var model = await _roleManager.BaseUpdate(roleDto);

                return new SuccessDataResult<RoleDto>(model);
            }
            catch (Exception ex)
            {  
                return new ErrorResult(ex.Message);
            }

         
        }


        [HttpPost]
        public IActionResult Delete([FromBody] Guid Id)
        {

            try
            {
                _roleManager.BaseDelete(Id);
            }
            catch (Exception ex)
            {

                return Ok();

            }


            // var roleList = _roleManager.Insert(role);

            return Ok(true);
        }
    }
}
