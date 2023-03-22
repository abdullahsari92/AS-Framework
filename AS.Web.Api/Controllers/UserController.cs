using AS.Business.Interfaces;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using Microsoft.AspNetCore.Mvc;

namespace AS.Web.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class UserController : ControllerBase
    {

        private IUserService _userManager;
        public UserController(IUserService userManager)
        {
            _userManager = userManager;
        }

        
       // [HttpGet(Name = "GetAll")]
        public async Task<ActionResult<Core.IResult>> GetAll()
        {

            
            var userList = await _userManager.GetAll();


          return  new SuccessDataResult<ListModel<UserDto>>(userList);
           
        }


        [HttpPost]
        public async Task<IActionResult> Add([FromBody] UserDto userDto)
        {


            UserDto deger = new UserDto();     
            try
            {
                deger = await _userManager.Insert(userDto);
            }
            catch (Exception ex)
            {
                 return Ok(deger);

            }

            return Ok(deger);
        }



        [HttpPost]
        public async Task<IActionResult> Update([FromBody] UserDto userDto)
        {
      
            User deger = new User();
            try
            {
                 _userManager.Update(userDto);
            }
            catch (Exception ex)
            {

                return Ok(deger);

            }


            // var userList = _userManager.Insert(user);

            return Ok(deger);
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
