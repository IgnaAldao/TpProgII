using BackendTp.Data.Models;
using BackendTp.Data.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApplicationTPProgII.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FuncionController : ControllerBase
    {
        private readonly IFuncionService _funcionService;
        public FuncionController(IFuncionService funcionService)
        {
            _funcionService = funcionService;
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            try
            {
                List<Funcione>? funciones = _funcionService.GetFuncionesByPeliuclaId(id);
                if (funciones != null)
                    return Ok(funciones);
                return NotFound("No hay funciones para esa pelicula.");
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }

        [HttpGet]
        public IActionResult GetPromociones()
        {
            try
            {
                List<Promocione>? promociones = _funcionService.GetPromociones();
                if (promociones != null)
                    return Ok(promociones);
                return NotFound("No hay promociones seco.");
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }
    }
}
