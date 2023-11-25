using AS.Business;
using AS.Business.Interfaces;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AS.Entities.Models;
using AS.Entities.Simple;
using AS.Web.Api.Attributes;
using Microsoft.AspNetCore.Mvc;

namespace AS.Web.Api.Controllers
{
    [ASAuthorize]
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class StudentController : ControllerBase
    {

        private IStudentService _studentService;
        public StudentController(IStudentService studentService)
        {
            _studentService = studentService;
        }


        [HttpGet]
        public async Task<ActionResult<Core.IResult>> List()
        {

            var studentList = await _studentService.BaseGetAll();

            return new SuccessDataResult<ListModel<StudentDto>>(studentList);

        }



        [HttpGet("{id}")]
        public async Task<ActionResult<Core.IResult>> GetById(Guid Id)
        {

           // StudentDetailModel model  = new StudentDetailModel();

            //ListModel<PermissionModel> model = new ListModel<PermissionModel>();
            try
            {
                //   model = await _studentService.Get(Id);

                // return new SuccessDataResult<StudentDetailModel>(model);
                return null;

            }
            catch (Exception ex)
            {
                return new ErrorResult(ex.Message);

            }

        }

        [HttpPost]
        public async Task<ActionResult<Core.IResult>> Add([FromBody] StudentDto StudentDto)
        {

            try
            {
                // studentAddModel.PermissionModel = await _studentService.StudentPermissionAdd(studentAddModel);

                 StudentDto = await _studentService.Insert(StudentDto);

                return new SuccessDataResult<StudentDto>(StudentDto);

            }
            catch (Exception ex)
            {
                return new ErrorResult(ex.Message);

            }

        }



        [HttpPost]
        public async Task<ActionResult<Core.IResult>> Update([FromBody] RoleDetailModel studentUpdateModel)
        {

            try
            {

              //  studentUpdateModel.StudentDto = await _studentService.BaseUpdate(studentUpdateModel.StudentDto);

                return new SuccessDataResult<RoleDetailModel>(studentUpdateModel);
            }
            catch (Exception ex)
            {
                return new ErrorResult(ex.Message);
            }


        }

        [HttpGet]
        public async Task<ActionResult<Core.IResult>> SelectOption()
        {

            var studentList = await _studentService.BaseGetSelectOptions();

            return new SuccessDataResult<List<NameValue>>(studentList);

        }

        [HttpDelete("{id}")]
        public IActionResult Delete(Guid Id)
        {

            try
            {
                _studentService.BaseDelete(Id);
            }
            catch (Exception ex)
            {

                return Ok();

            }


            // var studentList = _studentService.Insert(student);

            return Ok(true);
        }
    }
}
