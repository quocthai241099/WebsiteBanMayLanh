using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLMayLanh.Models;
using System.IO;
using PagedList;
using PagedList.Mvc;
namespace QLMayLanh.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        DataClasses1DataContext db = new DataClasses1DataContext();
     
        public ActionResult Index()
        {
            if (Session["TaiKhoanAdmin"] == null)
            {
                return RedirectToAction("DangNhap");
                
            }
            return View();
        }
        
        [HttpGet]
        public ActionResult DangNhap()
        {

            Session["TaiKhoan"] = null;
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {
            bool flag = true;
            var tendn = collection["user"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                flag = false;
                ViewData["Loi1"] = "Bạn chưa nhập tên đăng nhập";
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                flag = false;
                ViewData["Loi2"] = "Bạn chưa nhập mật khẩu";
            }
            if (flag == true)
            {
                Admin ad = db.Admins.SingleOrDefault(n => n.TaiKhoan == tendn && n.MatKhau == matkhau);
                if (ad != null)
                {
                    Session["TaiKhoanAdmin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                
            }
            return View();
        }
        public ActionResult SanPham(int ?page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 5;
            return View(db.SanPhams.ToList().OrderBy(n=>n.MaSP).ToPagedList(pageNumber,pageSize));
        }
        [HttpGet]
        public ActionResult Create()
        {
            if (Session["TaiKhoanAdmin"] == null)
            {
                return RedirectToAction("DangNhap");

            }
            ViewBag.MaTH = new SelectList(db.ThuongHieus.ToList().OrderBy(n => n.TenTH), "MaTH", "TenTH");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(SanPham sp, HttpPostedFileBase fileupload)
        {
            ViewBag.MaTH = new SelectList(db.ThuongHieus.ToList().OrderBy(n => n.TenTH), "MaTH", "TenTH");
            
            if (fileupload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn hình ảnh sản phẩm";
                return View();
            }

            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileupload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Assets/images"), fileName);
                    if (System.IO.File.Exists(path))
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    else
                        fileupload.SaveAs(path);
                    sp.HinhAnhSP = fileName;
                    db.SanPhams.InsertOnSubmit(sp);
                    db.SubmitChanges();
                }
                return RedirectToAction("SanPham");
            }
            
        }
        public ActionResult Details(int id)
        {
            if (Session["TaiKhoanAdmin"] == null)
            {
                return RedirectToAction("DangNhap");

            }
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;

            }
            return View(sp);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            if (Session["TaiKhoanAdmin"] == null)
            {
                return RedirectToAction("DangNhap");

            }
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }
        [HttpPost, ActionName("Delete")]
        public ActionResult XacNhanXoa(int id)
        {
            if (Session["TaiKhoanAdmin"] == null)
            {
                return RedirectToAction("DangNhap");

            }
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            ViewBag.MaSP = sp.MaSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.SanPhams.DeleteOnSubmit(sp);
            db.SubmitChanges();
            return RedirectToAction("SanPham");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            SanPham sp=db.SanPhams.SingleOrDefault(n=>n.MaSP==id);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaTH = new SelectList(db.ThuongHieus.ToList().OrderBy(n => n.TenTH), "MaTH", "TenTH",sp.MaSP);
            return View(sp);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(SanPham sp, HttpPostedFileBase fileupload)
        {
            ViewBag.MaTH = new SelectList(db.ThuongHieus.ToList().OrderBy(n => n.TenTH), "MaTH", "TenTH");

            if (fileupload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn hình ảnh sản phẩm";
                return View();
            }

            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileupload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Assets/images"), fileName);
                    if (System.IO.File.Exists(path))
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    else
                        fileupload.SaveAs(path);
                    sp.HinhAnhSP = fileName;
                    UpdateModel(sp);
                    db.SubmitChanges();
                }
                return RedirectToAction("SanPham");
            }

        }
        public ActionResult ThuongHieu()
        {
            if (Session["TaiKhoanAdmin"] == null)
            {
                return RedirectToAction("DangNhap");

            }
            return View(db.ThuongHieus.ToList());
        }
        [HttpGet]
        public ActionResult CreateTH()
        {
            if (Session["TaiKhoanAdmin"] == null)
            {
                return RedirectToAction("DangNhap");

            }  
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateTH(ThuongHieu th, HttpPostedFileBase fileupload)
        {
            

            if (fileupload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn hình ảnh thương hiệu";
                return View();
            }

            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileupload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Assets/images"), fileName);
                    if (System.IO.File.Exists(path))
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    else
                        fileupload.SaveAs(path);
                    th.HinhAnh = fileName;
                    db.ThuongHieus.InsertOnSubmit(th);
                    db.SubmitChanges();
                }
                return RedirectToAction("ThuongHieu");
            }

        }
        public ActionResult DetailsTH(int id)
        {
            if (Session["TaiKhoanAdmin"] == null)
            {
                return RedirectToAction("DangNhap");

            }
            ThuongHieu th = db.ThuongHieus.SingleOrDefault(n => n.MaTH == id);
            ViewBag.MaTH = th.MaTH;
            if (th == null)
            {
                Response.StatusCode = 404;
                return null;

            }
            return View(th);
        }
        [HttpGet]
        public ActionResult DeleteTH(int id)
        {
            if (Session["TaiKhoanAdmin"] == null)
            {
                return RedirectToAction("DangNhap");

            }
            
            ThuongHieu th = db.ThuongHieus.SingleOrDefault(n => n.MaTH == id);
            ViewBag.MaTH = th.MaTH;
            if (th == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(th);
            
        }
        [HttpPost, ActionName("DeleteTH")]
        public ActionResult XacNhanXoaTH(int id)
        {
            if (Session["TaiKhoanAdmin"] == null)
            {
                return RedirectToAction("DangNhap");

            }
            ThuongHieu th = db.ThuongHieus.SingleOrDefault(n => n.MaTH == id);
            ViewBag.MaTH = th.MaTH;
            if (th == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.ThuongHieus.DeleteOnSubmit(th);
            db.SubmitChanges();
            return RedirectToAction("ThuongHieu");
        }
        [HttpGet]
        public ActionResult EditTH(int id)
        {
            ThuongHieu th = db.ThuongHieus.SingleOrDefault(n => n.MaTH == id);
            if (th == null)
            {
                Response.StatusCode = 404;
                return null;
            }
           
            return View(th);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditTH(ThuongHieu th, HttpPostedFileBase fileupload)
        {
           

            if (fileupload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn hình ảnh thương hiệu";
                return View();
            }

            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileupload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Assets/images"), fileName);
                    if (System.IO.File.Exists(path))
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    else
                        fileupload.SaveAs(path);
                    th.HinhAnh = fileName;
                    UpdateModel(th);
                    db.SubmitChanges();
                }
                return RedirectToAction("ThuongHieu");
            }

        }
        
    }
}
