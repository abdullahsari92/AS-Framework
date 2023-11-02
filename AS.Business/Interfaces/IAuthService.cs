using AS.Business.Interfaces;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AS.Entities.Models;
using System.Security.Claims;

namespace AS.Business
{
    public interface IAuthService
    {
        Task<AuthModel> Login(LoginModel model);

        Task<List<Claim>> GetClaims(LoginModel model);

    }
}