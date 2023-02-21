using AS.Business.Interfaces;
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

        
        [HttpGet(Name = "GetAll")]
        public IActionResult GetAll()
        {

            
            var userList = _userManager.GetAll();


            return Ok(userList);
        }


        [HttpPost(Name = "Add")]
        public IActionResult Add([FromBody] UserDto userDto)
        {
            //var user = new User()
            //{
            //    FirstName = "abdullah",
            //    LastName = "sarı",
            //    Email = "abdullahsari92@gmail.com",
            //    CreationTime = DateTime.Now,
            //    UpdateTime = DateTime.Now,
            //    IsApproved = true,
            //    Password = "abcd12",
            //    Username = "abdullah.sari"

            //};
            User deger = new User();     
            try
            {
                deger = _userManager.Insert(userDto);
            }
            catch (Exception ex)
            {

                return Ok(deger);

            }


            // var userList = _userManager.Insert(user);

            return Ok(deger);
        }



        [HttpPost(Name = "Update")]
        public IActionResult Update([FromBody] UserDto userDto)
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
    }
}
