using AS.Business.Interfaces;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AS.Entities.Models;
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


        [HttpGet]
        public async Task<ActionResult<Core.IResult>> List()
        {

            var roleList = await _roleManager.BaseGetAll();

            return new SuccessDataResult<ListModel<RoleDto>>(roleList);

        }



        [HttpGet("{id}")]
        public async Task<ActionResult<Core.IResult>> GetById(Guid Id)
        {

            RoleDetailModel model  = new RoleDetailModel();

            //ListModel<PermissionModel> model = new ListModel<PermissionModel>();
            try
            {
                model = await _roleManager.Get(Id);

                return new SuccessDataResult<RoleDetailModel>(model);

            }
            catch (Exception ex)
            {
                return new ErrorResult(ex.Message);

            }

        }

        [HttpPost]
        public async Task<ActionResult<Core.IResult>> Add([FromBody] RoleDto RoleDto)
        {

            try
            {
                // roleAddModel.PermissionModel = await _roleManager.RolePermissionAdd(roleAddModel);

                 RoleDto = await _roleManager.BaseInsert(RoleDto);

                return new SuccessDataResult<RoleDto>(RoleDto);

            }
            catch (Exception ex)
            {
                return new ErrorResult(ex.Message);

            }

        }



        [HttpPost]
        public async Task<ActionResult<Core.IResult>> Update([FromBody] RoleDetailModel roleUpdateModel)
        {

            try
            {
                roleUpdateModel.PermissionList = await _roleManager.RolePermissionAdd(roleUpdateModel);

                roleUpdateModel.RoleDto = await _roleManager.BaseUpdate(roleUpdateModel.RoleDto);

                return new SuccessDataResult<RoleDetailModel>(roleUpdateModel);
            }
            catch (Exception ex)
            {
                return new ErrorResult(ex.Message);
            }


        }

        [HttpDelete("{id}")]
        public IActionResult Delete(Guid Id)
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
