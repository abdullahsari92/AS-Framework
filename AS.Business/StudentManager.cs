using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Helpers;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;

namespace AS.Business
{
    public class StudentManager : BaseManager<Student,StudentDto>, IStudentService
    {

        private IUserService _userService;

        public StudentManager(IRepository<Student> repository, IMapper mapper, IUserService userService) : base(repository, mapper)
        {
            _userService = userService;
        }

        public async Task<StudentDto> Insert(StudentDto studentDto)
        {

            UserDto user = new UserDto
            {
                Username = studentDto.Username,
                Email = studentDto.Email,
                FirstName = studentDto.Name,
                LastName = studentDto.Surname,
                Password = "CqeNRfwHT4AwqN35lsgBtT2ooueUIUnmpWBD3E7u31k=", // isimBaþharfi + tcKimlik+ soyisim  gibi otamatik passwordd oluþturulacak
            };
            user = await _userService.Insert(user);

            studentDto.UserId = user.Id;
            studentDto =  await BaseInsert(studentDto);

            return studentDto;
        }

    }

}
