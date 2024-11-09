using BackendTp.Data.Models;
using BackendTp.Data.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApplicationTPProgII.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GeneroController : ControllerBase
    {
        private readonly IGeneroService _generoService;
        public GeneroController(IGeneroService generoService)
        {
            _generoService = generoService;
        }

        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                List<Genero> generos = _generoService.GetAllGeneros();
                return Ok(generos);
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }

        [HttpGet("/clasificaciones")]
        public IActionResult GetClasificaciones()
        {
            try
            {
                List<Clasificacione> clasificaciones = _generoService.GetAllClasificaciones();
                return Ok(clasificaciones);
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }
    }
}
