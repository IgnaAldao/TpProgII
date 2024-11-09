using BackendTp.Data.Models;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

[ApiController]
[Route("[controller]")]
public class AuthController : ControllerBase
{
    private readonly CINE_2024_BDContext _context; 
    private readonly JwtSettings _jwtSettings;

    public AuthController(CINE_2024_BDContext context, IOptions<JwtSettings> jwtSettings)
    {
        _context = context;
        _jwtSettings = jwtSettings.Value;
    }

    [HttpPost("login")]
    public IActionResult Login([FromBody] ClientLoginRequest request)
    {
        var user = _context.Clientes
           .Include(c => c.IdTipoClienteNavigation)
           .SingleOrDefault(c => c.Email == request.Email && c.Contrasena == request.Password);
        if (user == null)
        {
            return Unauthorized();
        }

        var tokenHandler = new JwtSecurityTokenHandler();
        var key = Encoding.ASCII.GetBytes(_jwtSettings.Secret);
        Console.WriteLine(user.IdTipoCliente);
        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity(new []
            {
                new Claim(ClaimTypes.Name, user.Email),
                new Claim("idCliente", user.IdCliente.ToString())
            }),
            Expires = DateTime.UtcNow.AddHours(2),
            Issuer = _jwtSettings.Issuer,
            Audience = _jwtSettings.Audience,
            SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
        };


        var token = tokenHandler.CreateToken(tokenDescriptor);

        return Ok(new
        {
            Token = tokenHandler.WriteToken(token),
            clienteId = user.IdCliente,
            rol = user.IdTipoClienteNavigation.Descripcion
        });
    }


}
