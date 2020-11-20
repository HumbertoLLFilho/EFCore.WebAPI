using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EFCore.WebAPI.Models
{
    public class IdentidadeSecreta
    {
        //criando uma identidade secreta
        public int Id { get; set; }
        public int NomeReal { get; set; }

        //mostrando de qual heroi ela pertence
        public int HeroiId { get; set; }
        public Heroi Heroi { get; set; }
    }
}
