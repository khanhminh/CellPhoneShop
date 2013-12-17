package cellphoneshop.model;
// Generated Jan 10, 2010 7:19:00 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * BinhLuan generated by hbm2java
 */
public class BinhLuan  implements java.io.Serializable {


     private Integer maBinhLuan;
     private SanPham sanPham;
     private NguoiDung nguoiDung;
     private String loiBinh;
     private Date ngayBinhLuan;

    public BinhLuan() {
    }

    public BinhLuan(SanPham sanPham, NguoiDung nguoiDung, String loiBinh, Date ngayBinhLuan) {
       this.sanPham = sanPham;
       this.nguoiDung = nguoiDung;
       this.loiBinh = loiBinh;
       this.ngayBinhLuan = ngayBinhLuan;
    }
   
    public Integer getMaBinhLuan() {
        return this.maBinhLuan;
    }
    
    public void setMaBinhLuan(Integer maBinhLuan) {
        this.maBinhLuan = maBinhLuan;
    }
    public SanPham getSanPham() {
        return this.sanPham;
    }
    
    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }
    public NguoiDung getNguoiDung() {
        return this.nguoiDung;
    }
    
    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }
    public String getLoiBinh() {
        return this.loiBinh;
    }
    
    public void setLoiBinh(String loiBinh) {
        this.loiBinh = loiBinh;
    }
    public Date getNgayBinhLuan() {
        return this.ngayBinhLuan;
    }
    
    public void setNgayBinhLuan(Date ngayBinhLuan) {
        this.ngayBinhLuan = ngayBinhLuan;
    }




}


