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
    public class ClienteService : IClienteService
    {

        private readonly IClienteRepository _clienteRepository;
        public ClienteService(IClienteRepository clienteRepository)
        {
            _clienteRepository = clienteRepository;
        }

        public Cliente? GetById(int id)
        {
            return _clienteRepository.GetCliente(id);
        }

        public void Update(int id, ClienteDao cliente)
        {
            _clienteRepository.UpdateCliente(id, cliente);
        }
    }
}
