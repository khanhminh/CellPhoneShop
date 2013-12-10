package cellphoneshop.model;

// Generated Dec 10, 2013 11:05:38 PM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Sanpham generated by hbm2java
 */
public class Sanpham implements java.io.Serializable {

	private Long maSp;
	private Nhasanxuat nhasanxuat;
	private Loaisanpham loaisanpham;
	private String tenSp;
	private String gioiThieu;
	private Integer gia;
	private Short soThangBaoHanh;
	private String hinhDaiDien;
	private Integer soLuongHienCo;
	private Integer tongSoLuong;
	private Date ngayNhap;
	private Float diemDanhGiaTb;
	private Set khuyenmais = new HashSet(0);
	private Set danhsachmongmuons = new HashSet(0);
	private Set ctdonhangs = new HashSet(0);
	private Set ctsanphams = new HashSet(0);
	private Set khuyenmais_1 = new HashSet(0);
	private Set binhluans = new HashSet(0);
	private Set danhgias = new HashSet(0);

	public Sanpham() {
	}

	public Sanpham(Loaisanpham loaisanpham, String tenSp) {
		this.loaisanpham = loaisanpham;
		this.tenSp = tenSp;
	}

	public Sanpham(Nhasanxuat nhasanxuat, Loaisanpham loaisanpham,
			String tenSp, String gioiThieu, Integer gia, Short soThangBaoHanh,
			String hinhDaiDien, Integer soLuongHienCo, Integer tongSoLuong,
			Date ngayNhap, Float diemDanhGiaTb, Set khuyenmais,
			Set danhsachmongmuons, Set ctdonhangs, Set ctsanphams,
			Set khuyenmais_1, Set binhluans, Set danhgias) {
		this.nhasanxuat = nhasanxuat;
		this.loaisanpham = loaisanpham;
		this.tenSp = tenSp;
		this.gioiThieu = gioiThieu;
		this.gia = gia;
		this.soThangBaoHanh = soThangBaoHanh;
		this.hinhDaiDien = hinhDaiDien;
		this.soLuongHienCo = soLuongHienCo;
		this.tongSoLuong = tongSoLuong;
		this.ngayNhap = ngayNhap;
		this.diemDanhGiaTb = diemDanhGiaTb;
		this.khuyenmais = khuyenmais;
		this.danhsachmongmuons = danhsachmongmuons;
		this.ctdonhangs = ctdonhangs;
		this.ctsanphams = ctsanphams;
		this.khuyenmais_1 = khuyenmais_1;
		this.binhluans = binhluans;
		this.danhgias = danhgias;
	}

	public Long getMaSp() {
		return this.maSp;
	}

	public void setMaSp(Long maSp) {
		this.maSp = maSp;
	}

	public Nhasanxuat getNhasanxuat() {
		return this.nhasanxuat;
	}

	public void setNhasanxuat(Nhasanxuat nhasanxuat) {
		this.nhasanxuat = nhasanxuat;
	}

	public Loaisanpham getLoaisanpham() {
		return this.loaisanpham;
	}

	public void setLoaisanpham(Loaisanpham loaisanpham) {
		this.loaisanpham = loaisanpham;
	}

	public String getTenSp() {
		return this.tenSp;
	}

	public void setTenSp(String tenSp) {
		this.tenSp = tenSp;
	}

	public String getGioiThieu() {
		return this.gioiThieu;
	}

	public void setGioiThieu(String gioiThieu) {
		this.gioiThieu = gioiThieu;
	}

	public Integer getGia() {
		return this.gia;
	}

	public void setGia(Integer gia) {
		this.gia = gia;
	}

	public Short getSoThangBaoHanh() {
		return this.soThangBaoHanh;
	}

	public void setSoThangBaoHanh(Short soThangBaoHanh) {
		this.soThangBaoHanh = soThangBaoHanh;
	}

	public String getHinhDaiDien() {
		return this.hinhDaiDien;
	}

	public void setHinhDaiDien(String hinhDaiDien) {
		this.hinhDaiDien = hinhDaiDien;
	}

	public Integer getSoLuongHienCo() {
		return this.soLuongHienCo;
	}

	public void setSoLuongHienCo(Integer soLuongHienCo) {
		this.soLuongHienCo = soLuongHienCo;
	}

	public Integer getTongSoLuong() {
		return this.tongSoLuong;
	}

	public void setTongSoLuong(Integer tongSoLuong) {
		this.tongSoLuong = tongSoLuong;
	}

	public Date getNgayNhap() {
		return this.ngayNhap;
	}

	public void setNgayNhap(Date ngayNhap) {
		this.ngayNhap = ngayNhap;
	}

	public Float getDiemDanhGiaTb() {
		return this.diemDanhGiaTb;
	}

	public void setDiemDanhGiaTb(Float diemDanhGiaTb) {
		this.diemDanhGiaTb = diemDanhGiaTb;
	}

	public Set getKhuyenmais() {
		return this.khuyenmais;
	}

	public void setKhuyenmais(Set khuyenmais) {
		this.khuyenmais = khuyenmais;
	}

	public Set getDanhsachmongmuons() {
		return this.danhsachmongmuons;
	}

	public void setDanhsachmongmuons(Set danhsachmongmuons) {
		this.danhsachmongmuons = danhsachmongmuons;
	}

	public Set getCtdonhangs() {
		return this.ctdonhangs;
	}

	public void setCtdonhangs(Set ctdonhangs) {
		this.ctdonhangs = ctdonhangs;
	}

	public Set getCtsanphams() {
		return this.ctsanphams;
	}

	public void setCtsanphams(Set ctsanphams) {
		this.ctsanphams = ctsanphams;
	}

	public Set getKhuyenmais_1() {
		return this.khuyenmais_1;
	}

	public void setKhuyenmais_1(Set khuyenmais_1) {
		this.khuyenmais_1 = khuyenmais_1;
	}

	public Set getBinhluans() {
		return this.binhluans;
	}

	public void setBinhluans(Set binhluans) {
		this.binhluans = binhluans;
	}

	public Set getDanhgias() {
		return this.danhgias;
	}

	public void setDanhgias(Set danhgias) {
		this.danhgias = danhgias;
	}

}
