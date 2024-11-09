using BackendTp.Data.Models.Daos;
using BackendTp.Data.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApplicationTPProgII.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompraController : ControllerBase
    {
        private readonly ICompraService _compraService;
        public CompraController(ICompraService compraService)
        {
            _compraService = compraService;
        }

        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                var formasP = _compraService.GetFormasPago();
                if (formasP != null)
                    return Ok(formasP);
                return NotFound("No hay formas de pago");
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }

        [HttpPost]
        public IActionResult Post([FromBody] CompraDao compra)
        {
            try
            {
                if (_compraService.CreateCompra(compra))
                {
                    return Ok("Compra registrada!!");
                }
                return BadRequest("Error al cargar la compra..");
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }
    }
}
