package cellphoneshop.model;

// Generated Dec 10, 2013 9:58:31 PM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Danhsachmongmuon generated by hbm2java
 */
public class Danhsachmongmuon implements java.io.Serializable {

	private Integer maDsmongMuon;
	private Nguoidung nguoidung;
	private Date ngayTao;
	private Set sanphams = new HashSet(0);

	public Danhsachmongmuon() {
	}

	public Danhsachmongmuon(Nguoidung nguoidung) {
		this.nguoidung = nguoidung;
	}

	public Danhsachmongmuon(Nguoidung nguoidung, Date ngayTao, Set sanphams) {
		this.nguoidung = nguoidung;
		this.ngayTao = ngayTao;
		this.sanphams = sanphams;
	}

	public Integer getMaDsmongMuon() {
		return this.maDsmongMuon;
	}

	public void setMaDsmongMuon(Integer maDsmongMuon) {
		this.maDsmongMuon = maDsmongMuon;
	}

	public Nguoidung getNguoidung() {
		return this.nguoidung;
	}

	public void setNguoidung(Nguoidung nguoidung) {
		this.nguoidung = nguoidung;
	}

	public Date getNgayTao() {
		return this.ngayTao;
	}

	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}

	public Set getSanphams() {
		return this.sanphams;
	}

	public void setSanphams(Set sanphams) {
		this.sanphams = sanphams;
	}

}
