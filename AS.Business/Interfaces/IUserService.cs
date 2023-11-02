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
        /// Filtreleme yaparak birden çok satýr içeren liste modelini döndürür.
        /// </summary>
        /// <param name="filterModel">Filtreleme Ýçin Sýnýf</param>
        /// <returns>UserDto türünden liste modeli</returns>
        Task<ListModel<UserDto>> GetAll();

        /// <summary>
        /// ID parametresi alarak tek satýr içeren detay modelini döndürür.
        /// </summary>
        /// <param name="id">ID parametresi</param>
        /// <returns></returns>
        Task<UserDto> GetById(Guid id);

        /// <summary>
        /// Ekleme iþlemini yaparak sonucu modelle döndürür.
        /// </summary>
        /// <param name="addModel"></param>
        /// <returns>Ekleme iþlemi sonucu oluþan model</returns>
        Task<UserDto> Insert(UserDto model);

        /// <summary>
        /// Güncelleme iþlemini yaparak sonucu modelle döndürür.
        /// </summary>
        /// <param name="model"></param>
        /// <returns>Güncelleme iþlemi sonucu oluþan model</returns>
        void Update(UserDto model);

        /// <summary>
        /// ID parametresi alarak silme iþlemini yapar.
        /// </summary>
        /// <param name="id">ID parametresi</param>
        void Delete(Guid id);

    }
}
