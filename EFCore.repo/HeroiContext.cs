using EFCore.Dominio;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EFCore.repo
{
    public class HeroiContext : DbContext
    {
        //recebe do midleware a conexao
        public HeroiContext(DbContextOptions<HeroiContext> options) : base(options){ }

        // dando contexto nas minhas models
        public DbSet<Heroi> Herois { get; set; }
        public DbSet<Arma> Armas { get; set; }
        public DbSet<Batalha> Batalhas { get; set; }
        public DbSet<HeroiBatalha> HeroisBatalhas { get; set; }
        public DbSet<IdentidadeSecreta> identidade{ get; set; }

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
