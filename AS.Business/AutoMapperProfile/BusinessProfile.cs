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

            CreateMap<User, IdName>()
        .ForMember(x => x.Name, opt => opt.MapFrom(x => x.DisplayName))
        .ForMember(x => x.Id, opt => opt.MapFrom(x => x.Id))
        .ReverseMap();
            CreateMap<User, UserDto>().ForMember(x => x.CreatedBy, opt => opt.MapFrom(t => t.CreatedBy))
                .ReverseMap();
            CreateMap<Permission, PermissionDto>().ReverseMap();

        }
    }
}
