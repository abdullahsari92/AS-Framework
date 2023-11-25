using AS.Entities.Base;
using AS.Entities.Entity;

namespace AS.Entities.Dtos
{
    public class StudentDto: Dto
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public string FatherName { get; set; }
        public string MotherName { get; set; }
        public int TCIdentityNo { get; set; } // tckimlik
        public string PlaceOfBirth { get; set; }
        public string Phone { get; set; }
        public DateTime DateOfBirth { get; set; }
        public Char Gender { get; set; } //'E:Erkek - K:Kadin',
        public Guid UserId { get; set; }
        // public User? User { get; set; }

        public string Username { get; set; }
        public string? Password { get; set; }
        public string Email { get; set; }


    }
}
