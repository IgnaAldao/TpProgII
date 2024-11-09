using BackendTp.Data.Models;
using BackendTp.Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Services
{
    public class FuncionService : IFuncionService
    {
        private readonly IFuncionRepository _funcionRepository;
        public FuncionService(IFuncionRepository funcionRepository)
        {
            _funcionRepository = funcionRepository;
        }

        public List<Funcione>? GetFuncionesByPeliuclaId(int id)
        {
            return _funcionRepository.GetByIdPelicula(id);
        }

        public List<Promocione>? GetPromociones()
        {
            return _funcionRepository.GetPromociones();
        }
    }
}
