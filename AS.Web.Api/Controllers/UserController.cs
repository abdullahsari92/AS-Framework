using AS.Business.Interfaces;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AS.Web.Api.Attributes;
using Microsoft.AspNetCore.Mvc;

namespace AS.Web.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ASAuthorize]
    public class UserController : ControllerBase
    {

        private IUserService _userManager;
        public UserController(IUserService userManager)
        {
            _userManager = userManager;
        }

        
        [HttpGet]
        public async Task<ActionResult<Core.IResult>> List()
        {

            var userListbase = await _userManager.BaseGetAll();

            var userList = await _userManager.GetAll();


          return  new SuccessDataResult<ListModel<UserDto>>(userListbase);
           
        }



        [HttpGet("{id}")]
        public async Task<ActionResult<Core.IResult>> GetById(Guid Id)
        {
            try
            {
               var model = await _userManager.GetById(Id);

                return new SuccessDataResult<UserDto>(model);

            }
            catch (Exception ex)
            {
                return new ErrorResult(ex.Message);

            }

        }

        [HttpPost]
        public async Task<ActionResult<Core.IResult>> Add([FromBody] UserDto userDto)
        {


            UserDto model = new UserDto();     
            try
            {
                model = await _userManager.BaseInsert(userDto);

             return   new SuccessDataResult<UserDto>(model);              

            }
            catch (Exception ex)
            {
                        return new ErrorResult(ex.Message);              

            }
       
        }



        [HttpPost]
        public async Task<ActionResult<Core.IResult>> Update([FromBody] UserDto userDto)
        {

               try
            {
                UserDto model = new UserDto();

                _userManager.Update(userDto);

                return new SuccessDataResult<UserDto>(model);
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
                _userManager.Delete(Id);
            }
            catch (Exception ex)
            {

                return Ok();

            }


            // var userList = _userManager.Insert(user);

            return Ok(true);
        }
    }
}
