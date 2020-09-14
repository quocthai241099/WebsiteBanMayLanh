using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLMayLanh.Models
{

    public class GioHang
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        public int iMaSP { set; get; }
        public string sTenSP { set; get; }
        public string sHinhAnh { set; get; }
        public Double dDonGia { set; get; }
        public int iSoLuong { set; get; }
        public Double dThanhTien
        {
            get { return iSoLuong * dDonGia; }
        }
        public GioHang(int MaSP)
        {
            iMaSP = MaSP;
            SanPham sp = db.SanPhams.Single(n => n.MaSP == iMaSP);
            sTenSP = sp.TenSP;
            sHinhAnh = sp.HinhAnhSP;
            dDonGia = double.Parse(sp.GiaBan.ToString());
            iSoLuong = 1;
        }
    }
}