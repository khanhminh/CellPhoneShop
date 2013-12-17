package cellphoneshop.model;
// Generated Jan 10, 2010 7:19:00 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * DanhSachMongMuon generated by hbm2java
 */
public class DanhSachMongMuon  implements java.io.Serializable {


     private Integer maDsmongMuon;
     private NguoiDung nguoiDung;
     private Date ngayTao;
     private Set sanPhams = new HashSet(0);

    public DanhSachMongMuon() {
    }

	
    public DanhSachMongMuon(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }
    public DanhSachMongMuon(NguoiDung nguoiDung, Date ngayTao, Set sanPhams) {
       this.nguoiDung = nguoiDung;
       this.ngayTao = ngayTao;
       this.sanPhams = sanPhams;
    }
   
    public Integer getMaDsmongMuon() {
        return this.maDsmongMuon;
    }
    
    public void setMaDsmongMuon(Integer maDsmongMuon) {
        this.maDsmongMuon = maDsmongMuon;
    }
    public NguoiDung getNguoiDung() {
        return this.nguoiDung;
    }
    
    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }
    public Date getNgayTao() {
        return this.ngayTao;
    }
    
    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }
    public Set getSanPhams() {
        return this.sanPhams;
    }
    
    public void setSanPhams(Set sanPhams) {
        this.sanPhams = sanPhams;
    }




}


