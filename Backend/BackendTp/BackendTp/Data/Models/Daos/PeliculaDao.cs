using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Models.Daos
{
    public class PeliculaDao
    {
        public string Titulo { get; set; }

        public int? IdGenero { get; set; }

        public int Duracion { get; set; }

        public int? IdClasificacion { get; set; }
    }
}
