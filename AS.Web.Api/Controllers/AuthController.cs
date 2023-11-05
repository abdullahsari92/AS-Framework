using AS.Business;
using AS.Core.Security;
using AS.Core.ValueObjects;
using AS.Entities.Entity;
using AS.Entities.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace AS.Web.Api.Controllers;


[Route("api/[controller]/[action]")]
[ApiController]
public class AuthController : ControllerBase
{
    private readonly IAuthService _authService;
    private readonly JwtSettings _jwtSettings;
    public AuthController(IAuthService authService, IOptions<JwtSettings> jwtSettings)
    {
        _authService = authService;
        _jwtSettings = jwtSettings.Value;
    }

    [HttpPost]
    public async Task<ActionResult<Core.IResult>> Login([FromBody] LoginModel model)
    {
        try
        {
            //var claims = await _authService.GetClaims(model);

            //GenerateJwt(claims);


            AuthModel authModel = await _authService.Login(model);
            // await _userManager.SetAuthenticationTokenAsync(user, "Adfnet", userId, token);
            return new SuccessDataResult<AuthModel>(authModel, "Success");
        }
        catch (Exception e)
        {
                return new ErrorResult(e.Message);
        }
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
