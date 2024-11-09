using BackendTp.Data.Models;
using BackendTp.Data.Models.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Repositories
{
    public interface IPeliculaRepository
    {
        List<Pelicula> GetAll();
        List<Pelicula>? GetByFilters(string? titulo, string? genero);
        bool Delete(int id);

        bool Update(PeliculaDao peliculaDao, int id);

        Pelicula? GetById(int id);

        bool Create(PeliculaDao pelicula);
    }
}
