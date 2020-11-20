using EFCore.WebAPI.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EFCore.WebAPI.Data
{
    public class HeroiContext : DbContext
    {
        // dando contexto nas minhas models
        public DbSet<Heroi> Heroi { get; set; }
        public DbSet<Arma> Arma { get; set; }
        public DbSet<Batalha> Batalha { get; set; }
        public DbSet<HeroiBatalha> HeroisBatalhas { get; set; }
        public DbSet<IdentidadeSecreta> identidade{ get; set; }

        //Fazendo a string de conexão pro MySQL
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=HeroiApp;Data Source=betin");
        }

        //mostrando pro banco de dados a chave composta
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<HeroiBatalha>(entity =>
            {
                // a chave composta é o id da batalha e o id do heroi
                // assim n tenho a mesma batalha com o mesmo heroi repetidas vezes
                entity.HasKey(e => new {e.BatalhaId, e.HeroiId });
            });
        }
    }
}
