using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Models.Daos
{
    public class CompraDao
    {
        public DateTime FechaCompra { get; set; }

        public decimal MontoTotal { get; set; }

        public int? IdCliente { get; set; }

        public int? IdFormaPago { get; set; }
    }
}
