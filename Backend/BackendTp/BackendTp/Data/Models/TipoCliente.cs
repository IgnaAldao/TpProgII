﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace BackendTp.Data.Models;

public partial class TipoCliente
{
    public int IdTipoCliente { get; set; }

    public string Descripcion { get; set; }

    [JsonIgnore]
    public virtual ICollection<Cliente> Clientes { get; set; } = new List<Cliente>();
}