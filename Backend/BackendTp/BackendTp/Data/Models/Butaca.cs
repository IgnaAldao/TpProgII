﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace BackendTp.Data.Models;

public partial class Butaca
{
    public int IdButaca { get; set; }

    public int? IdSala { get; set; }

    public int NumeroButaca { get; set; }

    public int Fila { get; set; }

    public virtual ICollection<Entrada> Entrada { get; set; } = new List<Entrada>();

    public virtual Sala IdSalaNavigation { get; set; }

    public virtual ICollection<Reserva> Reservas { get; set; } = new List<Reserva>();

    public virtual ICollection<Ticket> Tickets { get; set; } = new List<Ticket>();
}