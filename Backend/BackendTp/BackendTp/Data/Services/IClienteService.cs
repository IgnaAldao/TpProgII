using BackendTp.Data.Models;
using BackendTp.Data.Models.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Services
{
    public interface IClienteService
    {
        Cliente? GetById(int id);
        void Update(int id, ClienteDao cliente);
    }
}
