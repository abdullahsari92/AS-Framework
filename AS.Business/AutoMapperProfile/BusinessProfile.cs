using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AutoMapper;

namespace AS.Business.AutoMapperProfile
{
    public class BusinessProfile : Profile
    {
        public BusinessProfile()
        {

    
            CreateMap<User, UserDto>().ReverseMap();
            CreateMap<Permission, PermissionDto>().ReverseMap();

        }
    }
}
