﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PruebaFabioOchoa.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class dbpersonalEntities : DbContext
    {
        public dbpersonalEntities()
            : base("name=dbpersonalEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tbl_personal> tbl_personal { get; set; }
        public virtual DbSet<tbl_profesion> tbl_profesion { get; set; }
        public virtual DbSet<tbl_vehiculos> tbl_vehiculos { get; set; }
    }
}