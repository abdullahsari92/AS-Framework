using AS.Core;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;

namespace AS.Business.Interfaces
{
    public interface ILanguageService: IBaseService<Language,LanguageDto >
    {

        Task<bool> InsertAll(List<LanguageDto > model);

        Task<ListModel<LanguageDto >> GetLLanguageDefination();

    }
}
