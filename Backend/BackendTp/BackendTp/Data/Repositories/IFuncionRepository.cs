using BackendTp.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Repositories
{
    public interface IFuncionRepository
    {
        List<Funcione>? GetByIdPelicula(int id);
        List<Promocione>? GetPromociones();
    }
}
