using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EFCore.Dominio
{
    public class Batalha
    {
        //criando a batalha
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Descricao { get; set; }

        //Anotando a data em que a batlha ocorreu
        public DateTime DtInicio { get; set; }
        public DateTime DtFim { get; set; }

        //Adicionando a batalha na lista composta
        public List<HeroiBatalha> HeroisBatalhas { get; set; }
    }
}
