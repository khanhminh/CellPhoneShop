package cellphoneshop.model;
// Generated Jan 10, 2010 7:19:00 AM by Hibernate Tools 3.2.1.GA



/**
 * HinhAnhSp generated by hbm2java
 */
public class HinhAnhSp  implements java.io.Serializable {


     private Integer maHinhAnh;
     private CtSanPham ctSanPham;
     private String duongDan;
     private int stt;

    public HinhAnhSp() {
    }

    public HinhAnhSp(CtSanPham ctSanPham, String duongDan, int stt) {
       this.ctSanPham = ctSanPham;
       this.duongDan = duongDan;
       this.stt = stt;
    }
   
    public Integer getMaHinhAnh() {
        return this.maHinhAnh;
    }
    
    public void setMaHinhAnh(Integer maHinhAnh) {
        this.maHinhAnh = maHinhAnh;
    }
    public CtSanPham getCtSanPham() {
        return this.ctSanPham;
    }
    
    public void setCtSanPham(CtSanPham ctSanPham) {
        this.ctSanPham = ctSanPham;
    }
    public String getDuongDan() {
        return this.duongDan;
    }
    
    public void setDuongDan(String duongDan) {
        this.duongDan = duongDan;
    }
    public int getStt() {
        return this.stt;
    }
    
    public void setStt(int stt) {
        this.stt = stt;
    }




}


