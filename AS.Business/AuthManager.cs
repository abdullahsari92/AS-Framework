using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Helpers;
using AS.Core.Security;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AS.Entities.Models;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Core.Utilities.Security.Hashing;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace AS.Business
{
    public class AuthManager : IAuthService
    {
          public readonly IUserService _userService;
        protected readonly IRepository<User> _repositoryUser;
        private readonly UserManager<UserClient> _userManager;
        private IMapper _mapper;
        private readonly JwtSettings _jwtSettings;

        private readonly IRoleService _roleService;
        public AuthManager(IUserService userService = null, IRepository<User> repositoryUser = null
           , UserManager<UserClient> userManager = null, IMapper mapper = null, IOptions<JwtSettings> jwtSettings = null, IRoleService roleService = null)
        {
            _userService = userService;
            _repositoryUser = repositoryUser;
            _userManager = userManager;
            _mapper = mapper;
            _jwtSettings = jwtSettings.Value;
            _roleService = roleService;
        }

        public async Task<AuthModel> Login(LoginModel model)
        {
            var query = await _repositoryUser.GetAll();

            var user = query.FirstOrDefault(p => p.Email == model.Email);


            if (user == null)
            {
                throw new Exception();
            }

            // Þifresi yanlýþ ise
            if (HashingHelper.VerifyPasswordHash(model.Password)!= user.Password.Trim())
            {
                throw new Exception("password uygun deðil");
            }


            if (!user.IsApproved)
            {
                throw new Exception();
            }
            var claims = await GetClaims(model);
               var token =  await GenerateJwt(claims);
            var userRoles = claims.Where(x => x.Type == ClaimTypes.Role).FirstOrDefault().Value; //þimdilik tek role olarak hesaplandý

           
            var getPermissionClaims = await _roleService.GetPermissionClaims(new Guid(userRoles));

            AuthModel authModel = new()
            {
                 Claims = getPermissionClaims,
                 Token = token,
                 Email = user.Email,
                 FullName = user.FirstName + " "+ user.LastName,
            };


            //claims.AddRange(roleClaims);

            return authModel;

        }

        public async Task<List<Claim>> GetClaims(LoginModel model)
        {
            var query = await _repositoryUser.GetAll();

            var user = query.Include(m => m.RoleUserLines).ThenInclude(r=>r.Role).FirstOrDefault(p => p.Email == model.Email);


            if (user == null)
            {
                throw new Exception();
            }

            List<Claim> claims = new()
                {
                    new(ClaimTypes.NameIdentifier, user.Id.ToString()),
                    new(ClaimTypes.Email, user.Email)
            };

            //var roleClaims = (await _userManager.GetRolesAsync(userClient)).Select(r => new Claim(ClaimTypes.Role, r));

            var roles = user.RoleUserLines.Select(m => m.Role).ToList();

            foreach (var role in roles)
            {
                claims.Add(new Claim(ClaimTypes.Role, role.Id.ToString()));
            }

            //claims.AddRange(roleClaims);

            return claims;
        }

        private async Task<string> GenerateJwt(List<Claim> claims)
        {
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_jwtSettings.SecretKey));

            var token = new JwtSecurityToken(
            _jwtSettings.ValidIssuer,
            _jwtSettings.ValidAudience,
                claims,
                expires: DateTime.Now.AddMinutes(Convert.ToDouble(_jwtSettings.ExpirationInMinutes)),
                signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha256)
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

    }

}
