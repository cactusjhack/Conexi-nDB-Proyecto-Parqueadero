using lib_aplicaciones.Entidades;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib_aplicaciones.Interfaces
{
    public interface IConexion
    {
        string? StringConexion { get; set; }
        public DbSet<Sedes>? Sedes { get; set; }
        public DbSet<Cargos>? Cargos { get; set; }
        public DbSet<Tarifas>? Tarifas { get; set; }
    }
}
