using AS.Entities.Base;
using System;

namespace AS.Entities.Entity
{
    public class Student : BaseEntity
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public string FatherName { get; set; }
        public string MotherName { get; set; }
        public int IdentityNo { get; set; } // tckimlik
        public string PlaceOfBirth { get; set; }
        public string Phone { get; set; }
        public DateTime DateOfBirth { get; set; }
        public Char Gender { get; set; } //'E:Erkek - K:Kadin',
        public Guid DepartmentId { get; set; }
        public Department Department { get; set; }
        public Guid UserId { get; set; }
        public User User { get; set; }

        //aday_no varchar(12) DEFAULT NULL COMMENT '2 karakter yil + 2 karakter birim_id + 3 karakter kurum_id + 5 karakter sira numarasi', 


    }

}
