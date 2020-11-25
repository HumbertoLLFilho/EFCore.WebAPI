using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EFCore.Dominio;
using EFCore.repo;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EFCore.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HeroiController : ControllerBase
    {
        private readonly HeroiContext _context;

        public HeroiController(HeroiContext context)
        {
            _context = context;
        }
        // GET: api/Heroi
        [HttpGet]
        public ActionResult Get()
        {
            try
            {
                return Ok(new Heroi());
            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex}");
            }
        }

        // GET: api/Heroi/5
        [HttpGet("{id}", Name = "GetHeroi")]
        public ActionResult Get(int id)
        {
            return Ok("value");
        }

        // POST: api/Heroi
        [HttpPost]
        public ActionResult Post(int id,Heroi model)
        {
            try
            {
                //var heroi = new Heroi
                //{
                //    Nome = "Homem de Ferro",
                //    Armas = new List<Arma>
                //    {
                //        new Arma {Nome = "Mark III"},
                //        new Arma {Nome = "Mark V"}
                //    }
                //};

                _context.Herois.Update(model);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex}");
            }
        }

        // PUT: api/Heroi/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, Heroi model)
        {
            try
            {
                if (_context.Herois.AsNoTracking().FirstOrDefault(h => h.Id == id) != null)
                {
                    _context.Herois.Update(model);
                    _context.SaveChanges();

                    return Ok("Deu certo !!!!");
                }
                return Ok("Não Encontrei :(");

            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex}");
            }
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}