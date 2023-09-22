﻿using AS.Core.ValueObjects;
using AS.Entities.Base;
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


            CreateMap<LanguageDto, Language>()
               .ForMember(x => x.CreatedById, opt => opt.Ignore())
               .ForMember(x => x.CreationTime, opt => opt.Ignore())
               .ForMember(x => x.CreatedBy, opt => opt.Ignore())
                .ReverseMap();

            CreateMap<PermissionDto, Permission>()
             .ForMember(x => x.CreatedById, opt => opt.Ignore())
             .ForMember(x => x.CreationTime, opt => opt.Ignore())
             .ForMember(x => x.CreatedBy, opt => opt.Ignore())
              .ReverseMap();

            CreateMap<RoleDto, Role>()
         .ForMember(x => x.CreatedById, opt => opt.Ignore())
         .ForMember(x => x.CreationTime, opt => opt.Ignore())
         .ForMember(x => x.CreatedBy, opt => opt.Ignore())
          .ReverseMap();

          //  .ForMember(x => x.UniqueId, opt => opt.MapFrom(p => $"{p.StoreId}_{p.SkuId}")).ReverseMap();


            CreateMap<Permission, PermissionDto>()
                  .ForMember(x => x.CreatedByFullName, opt => opt.MapFrom(p => $"{p.CreatedBy.FirstName} {p.CreatedBy.LastName}"))
                  .ReverseMap();

           // CreateMap<Language, LanguageDto >().ReverseMap();

            CreateMap<Menu, MenuDto>().ReverseMap();


        }
    }
}
