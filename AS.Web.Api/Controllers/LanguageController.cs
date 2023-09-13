using AS.Business.Interfaces;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using Microsoft.AspNetCore.Mvc;

namespace AS.Web.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class LanguageController : ControllerBase
    {

        private ILanguageService _LanguageManager;
        public LanguageController(ILanguageService LanguageManager)
        {
            _LanguageManager = LanguageManager;
        }

        
        [HttpGet]
        public async Task<ActionResult<Core.IResult>> List()
        {

            var LanguageList = await _LanguageManager.GetLLanguageDefination();
                  
          return  new SuccessDataResult<ListModel<LanguageDto>>(LanguageList);
           
        }


        [HttpPost]
        public async Task<ActionResult<Core.IResult>> Add([FromBody] LanguageDto  languageDto)
        {


            LanguageDto  model = new LanguageDto();     
            try
            {
                model = await _LanguageManager.BaseInsert(languageDto);

             return   new SuccessDataResult<LanguageDto>(model);              

            }
            catch (Exception ex)
            {
                return new ErrorResult(ex.Message);             

            }
       
        }

        [HttpPost]
        public async Task<ActionResult<Core.IResult>> AddAll([FromBody] List<LanguageDto > LanguageList)
        {


            LanguageDto  model = new LanguageDto ();
            try
            {
                var success = _LanguageManager.InsertAll(LanguageList);

                return new SuccessDataResult<bool>(true);

            }
            catch (Exception ex)
            {
                return new ErrorResult(ex.Message);

            }

        }


        [HttpPost]
        public async Task<ActionResult<Core.IResult>> Update([FromBody] LanguageDto  LanguageDto)
        {

               try
            {
               var model = await _LanguageManager.BaseUpdate(LanguageDto);

                return new SuccessDataResult<LanguageDto >(model);
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
                _LanguageManager.BaseDelete(Id);
            }
            catch (Exception ex)
            {

                return Ok();

            }


            // var LanguageList = _LanguageManager.Insert(Language);

            return Ok(true);
        }
    }
}
