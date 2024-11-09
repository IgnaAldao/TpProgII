using BackendTp.Data.Models;
using BackendTp.Data.Models.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Repositories
{
    public class CompraRepository : ICompraRepository
    {
        private readonly CINE_2024_BDContext _context;
        public CompraRepository(CINE_2024_BDContext context)
        {
            _context = context;
        }

        public bool Create(CompraDao compraDao)
        {
            Compra compra = new Compra()
            {
                FechaCompra = compraDao.FechaCompra,
                MontoTotal = compraDao.MontoTotal,
                IdCliente = compraDao.IdCliente,
                IdFormaPago = compraDao.IdFormaPago
            };
            _context.Compras.Add(compra);
            return _context.SaveChanges() > 0;
        }

        public List<FormasPago>? GetFormasPagos()
        {
            return _context.FormasPagos.ToList();
        }
    }
}
