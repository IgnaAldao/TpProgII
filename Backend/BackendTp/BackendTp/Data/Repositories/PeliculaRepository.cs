using BackendTp.Data.Models;
using BackendTp.Data.Models.Daos;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackendTp.Data.Repositories
{
    public class PeliculaRepository : IPeliculaRepository
    {
        private readonly CINE_2024_BDContext _context;
        public PeliculaRepository(CINE_2024_BDContext context)
        {
            _context = context;
        }

        public bool Create(PeliculaDao peliculaDao)
        {
            Pelicula pelicula = new Pelicula()
            {
                Titulo = peliculaDao.Titulo,
                Duracion = peliculaDao.Duracion,
                IdClasificacion = peliculaDao.IdClasificacion,
                IdGenero = peliculaDao.IdGenero
            };
            _context.Peliculas.Add(pelicula);
            return _context.SaveChanges() > 0;
        }

        public bool Delete(int id)
        {
            bool aux = false;
            Pelicula? peliculaExistente = _context.Peliculas.Find(id);
            if (peliculaExistente != null)
            {
                _context.Remove(peliculaExistente);
                _context.SaveChanges();
                aux = true;
            }
            return aux;
        }

        public List<Pelicula> GetAll()
        {
            var peliculas = _context.Peliculas
                 .Include(p => p.IdGeneroNavigation)  
                 .Include(p => p.IdClasificacionNavigation) 
                 .ToList();

            return peliculas;
        }

        public List<Pelicula> GetByFilters(string? titulo, string? genero)
        {
            List<Pelicula>? peliculas = _context.Peliculas
                 .Include(p => p.IdGeneroNavigation)  
                 .Include(p => p.IdClasificacionNavigation) 
                 .ToList();

            if (!string.IsNullOrEmpty(titulo))
            {
                peliculas = peliculas.Where(p => p.Titulo.Contains(titulo, StringComparison.OrdinalIgnoreCase)).ToList();
            }

            if (!string.IsNullOrEmpty(genero))
            {
                peliculas = peliculas.Where(p => p.IdGeneroNavigation.Descripcion.Contains(genero, StringComparison.OrdinalIgnoreCase)).ToList();
            }

            return peliculas;
        }

        public Pelicula? GetById(int id)
        {
           return  _context.Peliculas.FirstOrDefault(p => p.IdPelicula == id);
        }

        public bool Update(PeliculaDao peliculaDao, int id)
        {
            bool aux = false;
            Pelicula? pelicula = _context.Peliculas.FirstOrDefault(p => p.IdPelicula == id);
            if (pelicula != null)
            {
                pelicula.Titulo = peliculaDao.Titulo;
                pelicula.IdGenero = peliculaDao.IdGenero;
                pelicula.Duracion = peliculaDao.Duracion;
                pelicula.IdClasificacion = peliculaDao.IdClasificacion;
                _context.SaveChanges();
                aux = true;
            }
            return aux;
        }
    }
}
