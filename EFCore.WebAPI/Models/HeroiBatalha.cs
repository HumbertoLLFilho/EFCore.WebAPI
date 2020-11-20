using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EFCore.WebAPI.Models
{
    public class HeroiBatalha
    {
        //chamando o id do heroi
        public int HeroiId { get; set; }
        public Heroi Heroi { get; set; }

        //chamando o id da batalha
        public int BatalhaId { get; set; }
        public Batalha Batalha { get; set; }



    }
}
