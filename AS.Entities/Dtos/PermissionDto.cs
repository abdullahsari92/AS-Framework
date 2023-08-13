using AS.Entities.Base;

namespace AS.Entities.Dtos
{
    public class PermissionDto:Dto
    {
                   
        public string Name { get; set; }
        public string? Description { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }

        public int? Sayi { get; set; }

        public bool Checked { get; set; }


    }
}
