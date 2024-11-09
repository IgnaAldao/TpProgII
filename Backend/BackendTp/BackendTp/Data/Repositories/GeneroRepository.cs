using BackendTp.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Repositories
{
    public class GeneroRepository : IGeneroRepository
    {
        private readonly CINE_2024_BDContext _context;
        public GeneroRepository(CINE_2024_BDContext context)
        {
            _context = context;
        }
        public List<Genero> GetAll()
        {
            return _context.Generos.ToList();
        }

        public List<Clasificacione> GetAllClasificaciones()
        {
            return _context.Clasificaciones.ToList();
        }
    }
}
