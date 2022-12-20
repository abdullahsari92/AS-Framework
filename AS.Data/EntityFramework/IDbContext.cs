using System;

namespace AS.Data.EntityFramework
{
    public interface IDbContext : IDisposable
    {
        int SaveChanges();
    }
}
