﻿using BackendTp.Data.Models;
using BackendTp.Data.Models.Daos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Repositories
{
    public interface ICompraRepository
    {
        bool Create(CompraDao compra);
        List<FormasPago>? GetFormasPagos();
    }
}