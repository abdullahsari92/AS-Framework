using AS.Entities.Base;
using AS.Entities.Entity;

namespace AS.Core.Helpers
{
    public static class BaseEntityHelper
    {


        public static User getUser()
        {



            return new User()
            {
                Id = new Guid("3FA85F64-5717-4562-B3FC-2C963F66AFA6"),
                Email = "abdullahsari@gmail.com",
                FirstName = "abdullah",
                LastName = "dsarı",
                Password="sfs",
                Username= "sfsf"
            };


        }

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

            Item.CreatedBy = getUser();
            Item.UpdatedBy = getUser();

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

            Item.CreatedBy = getUser();
            Item.UpdatedBy = getUser();

            return Item;
        }


    }
}
