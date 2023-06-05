using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Helpers;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;

namespace AS.Business
{
    public class MenuManager : BaseManager<Menu,MenuDto>,IMenuService
    {
     
        public MenuManager(IRepository<Menu> repositoryMenu,IMapper mapper):base(repositoryMenu,mapper)
        {
          
        }
              

    }

}
