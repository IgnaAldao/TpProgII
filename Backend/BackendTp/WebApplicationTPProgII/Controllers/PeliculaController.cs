using BackendTp.Data.Models;
using BackendTp.Data.Models.Daos;
using BackendTp.Data.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApplicationTPProgII.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PeliculaController : ControllerBase
    {
        private readonly IPeliculaService _peliculaService;
        public PeliculaController(IPeliculaService peliculaService)
        {
            _peliculaService = peliculaService;
        }

        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                // Obtener las películas y seleccionar solo los campos necesarios
                var peliculas = _peliculaService.GetPeliculas()
                    .Select(p => new
                    {
                        p.IdPelicula,
                        p.Titulo,
                        Genero = p.IdGeneroNavigation?.Descripcion,  // Asumimos que 'Nombre' es el campo del género
                        p.Duracion,
                        Clasificacion = p.IdClasificacionNavigation?.Descripcion  // Asumimos que 'Nombre' es el campo de la clasificación
                    }).ToList();

                return Ok(peliculas);
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }

        [HttpGet("by-filters")]
        public IActionResult GetByFilters([FromQuery] string? titulo, [FromQuery] string? genero)
        {
            try
            {
                var peliculas = _peliculaService.GetPeliculasByFilters(titulo, genero)
                    .Select(p => new
                    {
                        p.IdPelicula,
                        p.Titulo,
                        Genero = p.IdGeneroNavigation?.Descripcion,  // Asumimos que 'Nombre' es el campo del género
                        p.Duracion,
                        Clasificacion = p.IdClasificacionNavigation?.Descripcion  // Asumimos que 'Nombre' es el campo de la clasificación
                    }).ToList();

                return Ok(peliculas);
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            try
            {
                if (_peliculaService.DeletePelicula(id))
                {
                    return Ok("Pelicula Eliminada");
                }
                return BadRequest("Pelicula no encontrada");
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }

        [HttpPut("{id}")]
        public IActionResult Put([FromBody] PeliculaDao pelicula, int id)
        {
            Console.WriteLine($"Datos recibidos: Titulo: {pelicula.Titulo}, idGenero: {pelicula.IdGenero}, idClasificacion: {pelicula.IdClasificacion}, Duracion: {pelicula.Duracion}");
            try
            {
                if (_peliculaService.UpdatePelicula(pelicula, id))
                {
                    return Ok("Pelicula modificada!!");
                }
                return BadRequest("Pelicula no encontrada");
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            try
            {
                Pelicula? pelicula = _peliculaService.GetPeliculaById(id);
                if(pelicula != null)
                {
                    return Ok(pelicula);
                }
                return BadRequest("No se encontro la pelicula!!");
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }

        [HttpPost]
        public IActionResult Post([FromBody] PeliculaDao pelicula)
        {
            try
            {
                if (_peliculaService.CreatePelicula(pelicula))
                {
                    return Ok("Pelicula registrada!!");
                }
                return BadRequest("Error al cargar la pelicula..");
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno, intente nuevamente.");
            }
        }
    }
}
