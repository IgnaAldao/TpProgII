﻿using BackendTp.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Services
{
    public interface IGeneroService
    {
        List<Genero> GetAllGeneros();
        List<Clasificacione> GetAllClasificaciones();
    }
}
