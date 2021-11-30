using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using PruebaFabioOchoa.Models;
using System.Data.Entity;


namespace PruebaFabioOchoa.Controllers
{
    public class personalController : Controller
    {
        private dbpersonalEntities dbPersonal = new dbpersonalEntities();

        // GET: personal
        public async Task<ActionResult> Index()
        {
            var listPersonal = dbPersonal.tbl_personal.Include(t => t.tbl_profesion).Include(t => t.tbl_vehiculos);
            return View(await listPersonal.ToListAsync());
        }

        // GET: personal/Details/5
        public async Task<ActionResult> Details(int id)
        {
            var personal = await dbPersonal.tbl_personal.FindAsync(id);
            return View(personal);
        }

        // GET: personal/Create
        public ActionResult Create()
        {
            ViewBag.ID_PROFESION = new SelectList(dbPersonal.tbl_profesion, "ID_PROFESION", "PROFESION");
            ViewBag.ID_VEHICULO = new SelectList(dbPersonal.tbl_vehiculos, "ID_VEHICULO", "VEHICULO");
            return View();
        }

        // POST: personal/Create
        [HttpPost]
        public async Task<ActionResult> Create(tbl_personal nuevaPersona)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    dbPersonal.tbl_personal.Add(nuevaPersona);
                    await dbPersonal.SaveChangesAsync();
                }

                return RedirectToAction("Index");
            }
            catch
            {
                ViewBag.ID_PROFESION = new SelectList(dbPersonal.tbl_profesion, "ID_PROFESION", "PROFESION");
                ViewBag.ID_VEHICULO = new SelectList(dbPersonal.tbl_vehiculos, "ID_VEHICULO", "VEHICULO");
                return View(nuevaPersona);
            }
        }

        // GET: personal/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var persona = await dbPersonal.tbl_personal.FindAsync(id);

            if (persona == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_PROFESION = new SelectList(dbPersonal.tbl_profesion, "ID_PROFESION", "PROFESION");
            ViewBag.ID_VEHICULO = new SelectList(dbPersonal.tbl_vehiculos, "ID_VEHICULO", "VEHICULO");
            return View(persona);
        }

        // POST: personal/Edit/5
        [HttpPost]
        public async Task<ActionResult> Edit(int id, tbl_personal personalModificado)
        {
            try
            {
                dbPersonal.Entry(personalModificado).State = EntityState.Modified;
                await dbPersonal.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            catch
            {
                ViewBag.ID_PROFESION = new SelectList(dbPersonal.tbl_profesion, "ID_PROFESION", "PROFESION");
                ViewBag.ID_VEHICULO = new SelectList(dbPersonal.tbl_vehiculos, "ID_VEHICULO", "VEHICULO");
                return View(personalModificado);
            }
        }

        // GET: personal/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            var persona = await dbPersonal.tbl_personal.FindAsync(id);
            if (persona is null)
            {
                return HttpNotFound($"No se encuentra el ID {id} en la base de datos par eliminar.");
            }
            return View(persona);
        }

        // POST: personal/Delete/5
        [HttpPost, ActionName("Delete")]
        public async Task<ActionResult> DeleteConfirm(int id)
        {
            try
            {
                tbl_personal personaEliminar = await dbPersonal.tbl_personal.FindAsync(id);
                if (personaEliminar is null)
                {
                    return HttpNotFound();
                }

                dbPersonal.tbl_personal.Remove(personaEliminar);
                await dbPersonal.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            catch
            {
                return View(id);
            }
        }
    }
}
