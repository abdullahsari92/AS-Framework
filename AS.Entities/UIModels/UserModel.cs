using AS.Entities.BaseEntities;
using AS.Entities.DataEntities;

namespace AS.Entities.UIModels
{
    public class UserModel
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DisplayName => FirstName + " " + LastName;
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }


    }
}
