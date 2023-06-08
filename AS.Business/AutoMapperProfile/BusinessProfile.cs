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
            CreateMap<UserDto, User>()
                .ForMember(x => x.CreatedById, opt => opt.Ignore())
                .ForMember(x => x.CreationTime, opt => opt.Ignore())
                .ForMember(x => x.CreatedBy, opt => opt.Ignore())

                 .ReverseMap();
            CreateMap<Permission, PermissionDto>().ReverseMap();

            CreateMap<Language, LanguageDto >().ReverseMap();

            CreateMap<Menu, MenuDto>().ReverseMap();


        }
    }
}
