package cellphoneshop.model;

// Generated Dec 10, 2013 11:05:38 PM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * Nhasanxuat generated by hbm2java
 */
public class Nhasanxuat implements java.io.Serializable {

	private Short maNhaSx;
	private String tenNhaSx;
	private String logo;
	private Set sanphams = new HashSet(0);

	public Nhasanxuat() {
	}

	public Nhasanxuat(String tenNhaSx) {
		this.tenNhaSx = tenNhaSx;
	}

	public Nhasanxuat(String tenNhaSx, String logo, Set sanphams) {
		this.tenNhaSx = tenNhaSx;
		this.logo = logo;
		this.sanphams = sanphams;
	}

	public Short getMaNhaSx() {
		return this.maNhaSx;
	}

	public void setMaNhaSx(Short maNhaSx) {
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

	public Set getSanphams() {
		return this.sanphams;
	}

	public void setSanphams(Set sanphams) {
		this.sanphams = sanphams;
	}

}