using System.Linq.Expressions;
using AS.Core;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;

namespace AS.Business.Interfaces
{
    public interface IUserService: IBaseService<User,UserDto>
    {
        Task<List<Role>> GetRoleUser(Guid userId);



        /// <summary>
        /// Filtreleme yaparak birden �ok sat�r i�eren liste modelini d�nd�r�r.
        /// </summary>
        /// <param name="filterModel">Filtreleme ��in S�n�f</param>
        /// <returns>UserDto t�r�nden liste modeli</returns>
        Task<ListModel<UserDto>> GetAll();

        /// <summary>
        /// ID parametresi alarak tek sat�r i�eren detay modelini d�nd�r�r.
        /// </summary>
        /// <param name="id">ID parametresi</param>
        /// <returns></returns>
        Task<UserDto> GetById(Guid id);

        /// <summary>
        /// Ekleme i�lemini yaparak sonucu modelle d�nd�r�r.
        /// </summary>
        /// <param name="addModel"></param>
        /// <returns>Ekleme i�lemi sonucu olu�an model</returns>
        Task<UserDto> Insert(UserDto model);

        /// <summary>
        /// G�ncelleme i�lemini yaparak sonucu modelle d�nd�r�r.
        /// </summary>
        /// <param name="model"></param>
        /// <returns>G�ncelleme i�lemi sonucu olu�an model</returns>
        void Update(UserDto model);

        /// <summary>
        /// ID parametresi alarak silme i�lemini yapar.
        /// </summary>
        /// <param name="id">ID parametresi</param>
        void Delete(Guid id);

    }
}
