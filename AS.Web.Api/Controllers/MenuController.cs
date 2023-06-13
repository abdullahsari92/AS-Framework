using AS.Business;
using AS.Business.Interfaces;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using Microsoft.AspNetCore.Mvc;

namespace AS.Web.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class MenuController : ControllerBase
    {

        private IMenuService _menuManager;
        public MenuController(IMenuService menuManager)
        {
            _menuManager = menuManager;
        }

        
       // [HttpGet(Name = "GetAll")]
        public async Task<ActionResult<Core.IResult>> List()
        {

            var menuList = await _menuManager.BaseGetAll();
                  
          return  new SuccessDataResult<ListModel<MenuDto>>(menuList);
           
        }


        [HttpPost]
        public async Task<ActionResult<Core.IResult>> Add([FromBody] MenuDto menuDto)
        {


            MenuDto model = new MenuDto();     
            try
            {
                model = await _menuManager.BaseInsert(menuDto);

             return   new SuccessDataResult<MenuDto>(model);              

            }
            catch (Exception ex)
            {
                        return new ErrorResult(ex.Message);              

            }
       
        }



        [HttpPost]
        public async Task<ActionResult<Core.IResult>> Update([FromBody] MenuDto menuDto)
        {

               try
            {
               var model = await _menuManager.BaseUpdate(menuDto);

                return new SuccessDataResult<MenuDto>(model);
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
                _menuManager.BaseDelete(Id);
            }
            catch (Exception ex)
            {

                return Ok();

            }


            // var menuList = _menuManager.Insert(menu);

            return Ok(true);
        }
    }
}
