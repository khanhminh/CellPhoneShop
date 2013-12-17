package cellphoneshop.model;
// Generated Jan 10, 2010 7:19:00 AM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * NhaSanXuat generated by hbm2java
 */
public class NhaSanXuat  implements java.io.Serializable {


     private Integer maNhaSx;
     private String tenNhaSx;
     private String logo;
     private Set sanPhams = new HashSet(0);

    public NhaSanXuat() {
    }

	
    public NhaSanXuat(String tenNhaSx) {
        this.tenNhaSx = tenNhaSx;
    }
    public NhaSanXuat(String tenNhaSx, String logo, Set sanPhams) {
       this.tenNhaSx = tenNhaSx;
       this.logo = logo;
       this.sanPhams = sanPhams;
    }
   
    public Integer getMaNhaSx() {
        return this.maNhaSx;
    }
    
    public void setMaNhaSx(Integer maNhaSx) {
        this.maNhaSx = maNhaSx;
    }
    public String getTenNhaSx() {
        return this.tenNhaSx;
    }
    
    public void setTenNhaSx(String tenNhaSx) {
        this.tenNhaSx = tenNhaSx;
    }
    public String getLogo() {
        return this.logo;
    }
    
    public void setLogo(String logo) {
        this.logo = logo;
    }
    public Set getSanPhams() {
        return this.sanPhams;
    }
    
    public void setSanPhams(Set sanPhams) {
        this.sanPhams = sanPhams;
    }




}

