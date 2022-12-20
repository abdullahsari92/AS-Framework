using System;

namespace AS.Data
{
    public interface IDbContext : IDisposable
    {
        int SaveChanges();
    }
}
