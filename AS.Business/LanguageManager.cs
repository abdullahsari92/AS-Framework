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
    public class LanguageManager : BaseManager<Language,LanguageDto>,ILanguageService
    {
     
        public LanguageManager(IRepository<Language> repositoryRole,IMapper mapper):base(repositoryRole,mapper)
        {
          
        }



        public async Task<bool> InsertAll(List<LanguageDto> model)
        {

            var  list = new List<Language>();
            foreach (LanguageDto  lang in model) {

                var language = _mapper.Map(lang,new Language());

                language = BaseEntityHelper.SetBaseEntitiy(language);

                language.Id = Guid.NewGuid();
                language.IsApproved = true;
                   

                if(!_repository.IsExist(p => p.Keyword == language.Keyword))
                {
                    list.Add(language);

                }

            }

             _repository.InsertRange(list);

            return true;
        }


        public async Task<ListModel<LanguageDto>> GetLLanguageDefination()
        {

            var listModel = new ListModel<LanguageDto>();

            var query = await _repository.GetAll();

            listModel.Items = query.Select(p => new LanguageDto 
            {
                Keyword = p.Keyword ??"",
                Tr = p.Tr ??"",
                En = p.En,
                De = p.De,
                Es = p.Es,
                Fr = p.Fr,
                Id = p.Id,
            }).ToList();


            return listModel;
        }


    }

}
