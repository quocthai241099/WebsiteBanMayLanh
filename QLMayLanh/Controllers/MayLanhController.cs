using QLMayLanh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLMayLanh.Controllers
{
    public class MayLanhController : Controller
    {
        //
        // GET: /MayLanh/
        DataClasses1DataContext db = new DataClasses1DataContext();
        private List<SanPham> LaySP(int count)
        {
            return db.SanPhams.OrderByDescending(a => a.GiaBan).Take(count).ToList();
        }
        public ActionResult Index()
        {
            var sp = LaySP(6);
            return View(sp);
        }
        public ActionResult ThuongHieu()
        {
            var thuonghieu = from th in db.ThuongHieus select th;
            return PartialView(thuonghieu);
        }
        public ActionResult SPTheoThuongHieu(int id)
        {
            var sp = from maylanh in db.SanPhams where maylanh.MaTH == id select maylanh;
            return View(sp);
        }
        public ActionResult Details(int id)
        {
            var sp = from ml in db.SanPhams where ml.MaSP == id select ml;
            return View(sp.Single());
        }
        
    }
}
