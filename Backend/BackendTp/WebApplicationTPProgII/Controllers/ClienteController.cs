using BackendTp.Data.Models.Daos;
using BackendTp.Data.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApplicationTPProgII.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClienteController : ControllerBase
    {
        private readonly IClienteService _clienteService;
        public ClienteController(IClienteService clienteService)
        {
            _clienteService = clienteService;
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            try
            {
                var cliente = _clienteService.GetById(id);
                if (cliente != null)
                    return Ok(cliente);
                return NotFound("El cliente no existe.");
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }

        [HttpPut("{id}")]
        public IActionResult Update(int id, [FromBody] ClienteDao clienteDao)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest("Datos incorrectos!!");
                }

                var clienteExistente = _clienteService.GetById(id);
                if (clienteExistente == null)
                {
                    return NotFound("El cliente no existe.");
                }

                _clienteService.Update(id, clienteDao);

                return Ok("Cliente actualizado!!");
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intentalo nuevamente");
            }
        }
    }
}
