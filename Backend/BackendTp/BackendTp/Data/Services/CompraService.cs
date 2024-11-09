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
    public class CompraService : ICompraService
    {
        private readonly ICompraRepository _compraRepository;
        public CompraService(ICompraRepository compraRepository)
        {
            _compraRepository = compraRepository;
        }

        public bool CreateCompra(CompraDao compraDao)
        {
            return _compraRepository.Create(compraDao);
        }

        public List<FormasPago>? GetFormasPago()
        {
            return _compraRepository.GetFormasPagos();
        }
    }
}
