using AS.Entities.BaseEntities;

namespace AS.Entities.DataEntities
{
    public class User : BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DisplayName => FirstName + " " + LastName;
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }

    }
}
