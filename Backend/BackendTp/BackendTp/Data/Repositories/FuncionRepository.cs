using BackendTp.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Repositories
{
    public class FuncionRepository : IFuncionRepository
    {
        private readonly CINE_2024_BDContext _context;
        public FuncionRepository(CINE_2024_BDContext context)
        {
            _context = context;
        }
        public List<Funcione>? GetByIdPelicula(int id)
        {
            List<Funcione> funciones = _context.Funciones.Where(f => f.IdPelicula == id).ToList();
            return funciones;
        }

        public List<Promocione>? GetPromociones()
        {
            return _context.Promociones.ToList();
        }
    }
}
