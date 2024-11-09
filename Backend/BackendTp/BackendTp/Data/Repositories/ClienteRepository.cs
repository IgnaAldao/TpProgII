using BackendTp.Data.Models;
using BackendTp.Data.Models.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Repositories
{
    public class ClienteRepository : IClienteRepository
    {
        private readonly CINE_2024_BDContext _context;
        public ClienteRepository(CINE_2024_BDContext context)
        {
            _context = context;
        }
        public Cliente? GetCliente(int id)
        {
            return _context.Clientes.FirstOrDefault(x => x.IdCliente == id);
        }

        public void UpdateCliente(int id, ClienteDao clienteDao)
        {
            var cliente = _context.Clientes.Find(id);
            if (cliente != null )
            {
                cliente.Nombre = clienteDao.Nombre;
                cliente.Apellido = clienteDao.Apellido;
                cliente.Telefono = clienteDao.Telefono;
                cliente.Email = clienteDao.Email;
            }
            _context.SaveChanges();
        }
    }
}
