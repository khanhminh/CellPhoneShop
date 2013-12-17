package cellphoneshop.model;
// Generated Jan 10, 2010 7:19:00 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * LoaiNguoiDung generated by hbm2java
 */
public class LoaiNguoiDung  implements java.io.Serializable {


     private Integer maLoaiNd;
     private String tenLoaiNd;
     private Set nguoiDungs = new HashSet(0);

    public LoaiNguoiDung() {
    }

	
    public LoaiNguoiDung(String tenLoaiNd) {
        this.tenLoaiNd = tenLoaiNd;
    }
    public LoaiNguoiDung(String tenLoaiNd, Set nguoiDungs) {
       this.tenLoaiNd = tenLoaiNd;
       this.nguoiDungs = nguoiDungs;
    }
   
    public Integer getMaLoaiNd() {
        return this.maLoaiNd;
    }
    
    public void setMaLoaiNd(Integer maLoaiNd) {
        this.maLoaiNd = maLoaiNd;
    }
    public String getTenLoaiNd() {
        return this.tenLoaiNd;
    }
    
    public void setTenLoaiNd(String tenLoaiNd) {
        this.tenLoaiNd = tenLoaiNd;
    }
    public Set getNguoiDungs() {
        return this.nguoiDungs;
    }
    
    public void setNguoiDungs(Set nguoiDungs) {
        this.nguoiDungs = nguoiDungs;
    }




}

