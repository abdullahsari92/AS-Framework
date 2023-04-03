using System.Linq.Expressions;
using AS.Core;
using AS.Core.ValueObjects;
using AS.Entities.Base;
using AS.Entities.Dtos;
using AS.Entities.Entity;

namespace AS.Business.Interfaces
{
    public interface IBaseService<TEntity, TMapTo>
      where TEntity : class, IEntity, new()
      where TMapTo : class, IDto, new()
    {
            
        /// <summary>
        /// Filtreleme yaparak birden çok satýr içeren liste modelini döndürür.
        /// </summary>
        /// <param name="filterModel">Filtreleme Ýçin Sýnýf</param>
        /// <returns>T türünden liste modeli</returns>
        Task<ListModel<TMapTo>> BaseGetAll();

        /// <summary>
        /// ID parametresi alarak tek satýr içeren detay modelini döndürür.
        /// </summary>
        /// <param name="id">ID parametresi</para m>
        /// <returns></returns>
        Task<TMapTo> BaseGetById(Guid id);

        /// <summary>
        /// Ekleme iþlemini yaparak sonucu modelle döndürür.
        /// </summary>
        /// <param name="addModel"></param>
        /// <returns>Ekleme iþlemi sonucu oluþan model</returns>
        Task<TMapTo> BaseInsert(TMapTo model);

        /// <summary>
        /// Güncelleme iþlemini yaparak sonucu modelle döndürür.
        /// </summary>
        /// <param name="model"></param>
        /// <returns>Güncelleme iþlemi sonucu oluþan model</returns>
        void BaseUpdate(TMapTo model);

        /// <summary>
        /// ID parametresi alarak silme iþlemini yapar.
        /// </summary>
        /// <param name="id">ID parametresi</param>
        void BaseDelete(Guid id);


    }
}
