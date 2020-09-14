using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLMayLanh.Models;
namespace QLMayLanh.Controllers
{
    public class NguoiDungController : Controller
    {
        //
        // GET: /NguoiDung/
        DataClasses1DataContext db = new DataClasses1DataContext();
        public ActionResult Index()
        {
            Session["TaiKhoanAdmin"] = null;
            return View();
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            Session["TaiKhoan"] = null;
            
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(FormCollection collection, KhachHang kh)
        {
            
            bool flag = true;
            var hoten = collection["HoTen"];
            var tendn = collection["TenDN"];
            var matkhau = collection["MatKhau"];
            var nhaplaimk = collection["NhapLaiMK"];
            var email = collection["Email"];
            var dienthoai = collection["DienThoai"];
            var diachi = collection["DiaChi"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["NgaySinh"]);
            if (String.IsNullOrEmpty(hoten))
            {
                flag = false;
                ViewData["Loi1"] = "Họ tên không được rỗng";
            }
            if (String.IsNullOrEmpty(tendn))
            {
                flag = false;
                ViewData["Loi2"] = "Tên đăng nhập không được rỗng";
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                flag = false;
                ViewData["Loi3"] = "Chưa nhập mật khẩu";
            }
            if (String.IsNullOrEmpty(nhaplaimk))
            {
                flag = false;
                ViewData["Loi4"] = "Phải nhập lại mật khẩu";
            }
            if (String.IsNullOrEmpty(email))
            {
                flag = false;
                ViewData["Loi5"] = "Bạn chưa nhập email";
            }
            if (String.IsNullOrEmpty(dienthoai))
            {
                flag = false;
                ViewData["Loi6"] = "Bạn chưa nhập số điện thoại";
            }
            if (String.IsNullOrEmpty(diachi))
            {
                flag = false;
                ViewData["Loi7"] = "Bạn chưa nhập địa chỉ";
                
            }
            if(flag==true)
            {
                kh.HoTen = hoten;
                kh.TaiKhoan = tendn;
                kh.MatKhau = matkhau;
                kh.Email = email;
                kh.DienThoai = dienthoai;
                kh.DiaChi = diachi;
                kh.NgaySinh = DateTime.Parse(ngaysinh);
                db.KhachHangs.InsertOnSubmit(kh);
                db.SubmitChanges();
               
                return RedirectToAction("DangNhap");
            }
            return this.DangKy();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        public ActionResult DangNhap(FormCollection collection)
        {
            bool flag = true;
            var tendn = collection["TenDN"];
            var matkhau = collection["MatKhau"];
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
                KhachHang kh = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == tendn && n.MatKhau == matkhau);
                if (kh != null)
                {
                    
                    Session["TaiKhoan"] = kh;
                    return RedirectToAction("Index", "MayLanh");
                }
                else
                    ViewBag.Thongbao = "Sai tên đăng nhập hoặc mật khẩu";
            }
            return View();

        }
    }
}
