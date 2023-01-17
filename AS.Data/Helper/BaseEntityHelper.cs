using AS.Entities.Base;

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
            var activeIdentity = CoreSettings.ActiveIdentity;

            Item.CreationTime = DateTime.Now;
            Item.CreatedById = activeIdentity.UserId;


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
            var activeIdentity = CoreSettings.ActiveIdentity;

            Item.CreationTime = DateTime.Now;
            Item.CreatedById = activeIdentity.UserId;
            Item.DurumId = EnumKayitDurum.Olusturuldu.GetHashCode();


            return Item;
        }


    }
}
