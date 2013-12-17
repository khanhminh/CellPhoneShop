package cellphoneshop.model;
// Generated Jan 10, 2010 7:19:00 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TrangThaiDonHang generated by hbm2java
 */
public class TrangThaiDonHang  implements java.io.Serializable {


     private Integer maTrangThai;
     private String tenTrangThai;
     private Set donHangs = new HashSet(0);

    public TrangThaiDonHang() {
    }

	
    public TrangThaiDonHang(String tenTrangThai) {
        this.tenTrangThai = tenTrangThai;
    }
    public TrangThaiDonHang(String tenTrangThai, Set donHangs) {
       this.tenTrangThai = tenTrangThai;
       this.donHangs = donHangs;
    }
   
    public Integer getMaTrangThai() {
        return this.maTrangThai;
    }
    
    public void setMaTrangThai(Integer maTrangThai) {
        this.maTrangThai = maTrangThai;
    }
    public String getTenTrangThai() {
        return this.tenTrangThai;
    }
    
    public void setTenTrangThai(String tenTrangThai) {
        this.tenTrangThai = tenTrangThai;
    }
    public Set getDonHangs() {
        return this.donHangs;
    }
    
    public void setDonHangs(Set donHangs) {
        this.donHangs = donHangs;
    }




}


