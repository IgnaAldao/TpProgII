﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace BackendTp.Data.Models;

public partial class TipoSala
{
    public int IdTipoSala { get; set; }

    public string Descripcion { get; set; }

    public virtual ICollection<Sala> Salas { get; set; } = new List<Sala>();
}