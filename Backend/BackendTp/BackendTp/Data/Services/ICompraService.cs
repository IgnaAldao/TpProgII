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
    public interface ICompraService
    {
        List<FormasPago>? GetFormasPago();
        bool CreateCompra(CompraDao compra);
    }
}
