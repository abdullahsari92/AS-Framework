using AS.Entities.Dtos;

namespace AS.Entities.Entity
{
    public class PermissionModel 
    {

        public PermissionModel()
        {

            Value = new List<PermissionDto>();

        }

        public string Key { get; set; }


        public List<PermissionDto> Value { get; set; }

  

}

}
