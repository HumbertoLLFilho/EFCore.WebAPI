using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EFCore.Dominio
{
    public class Arma
    {
        //Criando a arma
        public int Id { get; set; }
        public String Nome { get; set; }

        //Id do heroi que usa ela
        public Heroi Heroi { get; set; }
        public int HeroiId { get; set; }
    }
}
