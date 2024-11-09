﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace BackendTp.Data.Models;

public partial class Pelicula
{
    public int IdPelicula { get; set; }

    public string Titulo { get; set; }

    public int? IdGenero { get; set; }

    public int Duracion { get; set; }

    public int? IdClasificacion { get; set; }

    public virtual ICollection<Comprobante> Comprobantes { get; set; } = new List<Comprobante>();

    public virtual ICollection<Funcione> Funciones { get; set; } = new List<Funcione>();

    public virtual Clasificacione IdClasificacionNavigation { get; set; }

    public virtual Genero IdGeneroNavigation { get; set; }

    public virtual ICollection<Ticket> Tickets { get; set; } = new List<Ticket>();
}