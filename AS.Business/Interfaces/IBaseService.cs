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
        /// Filtreleme yaparak birden �ok sat�r i�eren liste modelini d�nd�r�r.
        /// </summary>
        /// <param name="filterModel">Filtreleme ��in S�n�f</param>
        /// <returns>T t�r�nden liste modeli</returns>
        Task<ListModel<TMapTo>> BaseGetAll();

        /// <summary>
        /// ID parametresi alarak tek sat�r i�eren detay modelini d�nd�r�r.
        /// </summary>
        /// <param name="id">ID parametresi</para m>
        /// <returns></returns>
        Task<TMapTo> BaseGetById(Guid id);

        /// <summary>
        /// Ekleme i�lemini yaparak sonucu modelle d�nd�r�r.
        /// </summary>
        /// <param name="addModel"></param>
        /// <returns>Ekleme i�lemi sonucu olu�an model</returns>
        Task<TMapTo> BaseInsert(TMapTo model);

        /// <summary>
        /// G�ncelleme i�lemini yaparak sonucu modelle d�nd�r�r.
        /// </summary>
        /// <param name="model"></param>
        /// <returns>G�ncelleme i�lemi sonucu olu�an model</returns>
        Task<TMapTo> BaseUpdate(TMapTo model);

        /// <summary>
        /// ID parametresi alarak silme i�lemini yapar.
        /// </summary>
        /// <param name="id">ID parametresi</param>
        void BaseDelete(Guid id);


    }
}

