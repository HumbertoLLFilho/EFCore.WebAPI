using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EFCore.Dominio
{
    public class Heroi
    {
        //criando o heroi
        public int Id { get; set; }
        public String Nome { get; set; }

        //Adicionando o nome real dele
        public IdentidadeSecreta Identidade { get; set; }

        //Adicionando a/as arma/armas do heroi
        public List<Arma> Armas { get; set; }

        //colocando o heroi na lista de batalhas 
        public List<HeroiBatalha> HeroisBatalhas { get; set; }
    }
}
