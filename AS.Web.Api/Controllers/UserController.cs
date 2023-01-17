using AS.Business.Interfaces;
using AS.Entities.Dtos;
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
        

            var deger = _userManager.Insert(userDto);

           // var userList = _userManager.Insert(user);

            return Ok(deger);
        }

    }
}
