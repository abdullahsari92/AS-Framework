using AS.Business.Interfaces;
using AS.Entities.Dtos;
using AS.Entities.Entity;

namespace AS.Business
{
    public interface IStudentService: IBaseService<Student, StudentDto>
    {

        Task<StudentDto> Insert(StudentDto studentDto);

    }
}