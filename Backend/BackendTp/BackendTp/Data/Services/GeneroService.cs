using BackendTp.Data.Models;
using BackendTp.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Services
{
    public class GeneroService : IGeneroService
    {
        private readonly IGeneroRepository _repository;
        public GeneroService(IGeneroRepository generoRepository)
        {
            _repository = generoRepository;
        }

        public List<Clasificacione> GetAllClasificaciones()
        {
            return _repository.GetAllClasificaciones();
        }

        public List<Genero> GetAllGeneros()
        {
            return _repository.GetAll();
        }
    }
}
