using BackendTp.Data.Models;
using BackendTp.Data.Models.Daos;
using BackendTp.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Services
{
    public class PeliculaService : IPeliculaService
    {
        private readonly IPeliculaRepository _repository;
        public PeliculaService(IPeliculaRepository peliculaRepository)
        {
            _repository = peliculaRepository;
        }

        public bool CreatePelicula(PeliculaDao pelicula)
        {
            return _repository.Create(pelicula);
        }

        public bool DeletePelicula(int id)
        {
            return _repository.Delete(id);
        }

        public Pelicula? GetPeliculaById(int id)
        {
            return _repository.GetById(id);
        }

        public List<Pelicula> GetPeliculas()
        {
            return _repository.GetAll();
        }

        public List<Pelicula>? GetPeliculasByFilters(string? titulo, string? genero)
        {
            return _repository.GetByFilters(titulo, genero);
        }

        public bool UpdatePelicula(PeliculaDao pelicula, int id)
        {
            return _repository.Update(pelicula, id);
        }
    }
}
