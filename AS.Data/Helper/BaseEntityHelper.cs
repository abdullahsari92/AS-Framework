using AS.Entities.Base;
using AS.Entities.Entity;

namespace AS.Core.Helpers
{
    public static class BaseEntityHelper
    {

        /// <summary>
        /// Entitleri ekleme işlemi yaparken ekleyen,güncelleyen kişi ve tarihlerini set ediyor.
        /// </summary>
        /// <typeparam name="T">Beklenilen entity tipi</typeparam>
        /// <param name="Item"></param>
        /// <returns></returns>
        public static T SetBaseEntitiyNoExten<T>(T Item) where T : BaseEntity, new()
        {
            //TODO:Bakılacak
            //var activeIdentity = CoreSettings.ActiveIdentity;
            //Item.CreatedById = activeIdentity.UserId;

            Item.CreatedBy = new User() { Id = 21 };
            Item.UpdatedBy = new User() { Id = 23 };

            Item.CreationTime = DateTime.Now;
            Item.UpdateTime = DateTime.Now;


            return Item;
        }

        /// <summary>
        /// Entitleri ekleme işlemi yaparken ekleyen,güncelleyen kişi ve tarihlerini set ediyor.
        /// </summary>
        /// <typeparam name="T">Beklenilen entity tipi</typeparam>
        /// <param name="Item"></param>
        /// <returns></returns>
        public static T SetBaseEntitiy<T>(this T Item) where T : BaseEntity, new()
        {
            //TODO:Bakılacak
            //var activeIdentity = CoreSettings.ActiveIdentity;

            Item.CreationTime = DateTime.Now;
            Item.UpdateTime = DateTime.Now;


            Item.CreatedBy = new User() { Id = 23 };
            Item.UpdatedBy = new User() { Id = 23 };


            return Item;
        }


    }
}
