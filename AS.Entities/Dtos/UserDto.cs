namespace AS.Entities.Dtos
{
    public class UserDto
    {
        public Guid Id { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DisplayName => FirstName + " " + LastName;
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }




    }
}
