package cellphoneshop.model;

// Generated Dec 10, 2013 11:05:38 PM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * Vaitro generated by hbm2java
 */
public class Vaitro implements java.io.Serializable {

	private Short maVaiTro;
	private String tenVaiTro;
	private Set nguoidungs = new HashSet(0);

	public Vaitro() {
	}

	public Vaitro(String tenVaiTro) {
		this.tenVaiTro = tenVaiTro;
	}

	public Vaitro(String tenVaiTro, Set nguoidungs) {
		this.tenVaiTro = tenVaiTro;
		this.nguoidungs = nguoidungs;
	}

	public Short getMaVaiTro() {
		return this.maVaiTro;
	}

	public void setMaVaiTro(Short maVaiTro) {
		this.maVaiTro = maVaiTro;
	}

	public String getTenVaiTro() {
		return this.tenVaiTro;
	}

	public void setTenVaiTro(String tenVaiTro) {
		this.tenVaiTro = tenVaiTro;
	}

	public Set getNguoidungs() {
		return this.nguoidungs;
	}

	public void setNguoidungs(Set nguoidungs) {
		this.nguoidungs = nguoidungs;
	}

}