package cellphoneshop.model;
// Generated Jan 10, 2010 7:19:00 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * VaiTro generated by hbm2java
 */
public class VaiTro  implements java.io.Serializable {


     private Integer maVaiTro;
     private String tenVaiTro;
     private Set nguoiDungs = new HashSet(0);

    public VaiTro() {
    }

	
    public VaiTro(String tenVaiTro) {
        this.tenVaiTro = tenVaiTro;
    }
    public VaiTro(String tenVaiTro, Set nguoiDungs) {
       this.tenVaiTro = tenVaiTro;
       this.nguoiDungs = nguoiDungs;
    }
   
    public Integer getMaVaiTro() {
        return this.maVaiTro;
    }
    
    public void setMaVaiTro(Integer maVaiTro) {
        this.maVaiTro = maVaiTro;
    }
    public String getTenVaiTro() {
        return this.tenVaiTro;
    }
    
    public void setTenVaiTro(String tenVaiTro) {
        this.tenVaiTro = tenVaiTro;
    }
    public Set getNguoiDungs() {
        return this.nguoiDungs;
    }
    
    public void setNguoiDungs(Set nguoiDungs) {
        this.nguoiDungs = nguoiDungs;
    }




}


