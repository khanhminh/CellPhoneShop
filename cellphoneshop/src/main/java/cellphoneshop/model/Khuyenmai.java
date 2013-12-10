package cellphoneshop.model;

// Generated Dec 10, 2013 9:58:31 PM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Khuyenmai generated by hbm2java
 */
public class Khuyenmai implements java.io.Serializable {

	private Integer maKm;
	private String tieuDe;
	private String moTa;
	private Float phanTramGiamGia;
	private Date ngayBatDau;
	private Date ngayKetThuc;
	private Set sanphams = new HashSet(0);
	private Set sanphams_1 = new HashSet(0);

	public Khuyenmai() {
	}

	public Khuyenmai(String tieuDe, String moTa, Float phanTramGiamGia,
			Date ngayBatDau, Date ngayKetThuc, Set sanphams, Set sanphams_1) {
		this.tieuDe = tieuDe;
		this.moTa = moTa;
		this.phanTramGiamGia = phanTramGiamGia;
		this.ngayBatDau = ngayBatDau;
		this.ngayKetThuc = ngayKetThuc;
		this.sanphams = sanphams;
		this.sanphams_1 = sanphams_1;
	}

	public Integer getMaKm() {
		return this.maKm;
	}

	public void setMaKm(Integer maKm) {
		this.maKm = maKm;
	}

	public String getTieuDe() {
		return this.tieuDe;
	}

	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}

	public String getMoTa() {
		return this.moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public Float getPhanTramGiamGia() {
		return this.phanTramGiamGia;
	}

	public void setPhanTramGiamGia(Float phanTramGiamGia) {
		this.phanTramGiamGia = phanTramGiamGia;
	}

	public Date getNgayBatDau() {
		return this.ngayBatDau;
	}

	public void setNgayBatDau(Date ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}

	public Date getNgayKetThuc() {
		return this.ngayKetThuc;
	}

	public void setNgayKetThuc(Date ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}

	public Set getSanphams() {
		return this.sanphams;
	}

	public void setSanphams(Set sanphams) {
		this.sanphams = sanphams;
	}

	public Set getSanphams_1() {
		return this.sanphams_1;
	}

	public void setSanphams_1(Set sanphams_1) {
		this.sanphams_1 = sanphams_1;
	}

}
