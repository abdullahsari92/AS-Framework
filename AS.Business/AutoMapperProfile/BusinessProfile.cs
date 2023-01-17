using AS.Data.Entity;
using AS.Entities.Dtos;
using AutoMapper;

namespace AS.Business.AutoMapperProfile
{
    public class BusinessProfile : Profile
    {
        public BusinessProfile()
        {
            CreateMap<User, UserDto>().ReverseMap();
            
        }
    }
}
