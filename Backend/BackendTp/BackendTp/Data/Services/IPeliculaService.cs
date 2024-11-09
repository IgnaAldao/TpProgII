using BackendTp.Data.Models;
using BackendTp.Data.Models.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Services
{
    public interface IPeliculaService
    {
        List<Pelicula> GetPeliculas();
        List<Pelicula>? GetPeliculasByFilters(string? titulo, string? genero);
        bool DeletePelicula(int id);
        bool UpdatePelicula(PeliculaDao pelicula, int id);
        Pelicula? GetPeliculaById(int id);
        bool CreatePelicula(PeliculaDao pelicula);
    }
}
