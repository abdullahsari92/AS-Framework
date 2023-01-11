using AS.Entities.DataEntities;
using AS.Entities.UIModels;
using AutoMapper;

namespace AS.Business.AutoMapperProfile
{
    public class BusinessProfile : Profile
    {
        public BusinessProfile()
        {
            CreateMap<User, UserModel>().ReverseMap();
            
        }
    }
}
