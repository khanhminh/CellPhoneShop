package cellphoneshop.model;
// Generated Jan 10, 2010 7:19:00 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * SanPham generated by hbm2java
 */
public class SanPham  implements java.io.Serializable {


     private Integer maSp;
     private NhaSanXuat nhaSanXuat;
     private LoaiSanPham loaiSanPham;
     private String tenSp;
     private String gioiThieu;
     private Integer gia;
     private Integer soThangBaoHanh;
     private String hinhDaiDien;
     private Integer soLuongHienCo;
     private Integer tongSoLuong;
     private Date ngayNhap;
     private Float diemDanhGiaTb;
     private Set ctDonHangs = new HashSet(0);
     private Set danhSachMongMuons = new HashSet(0);
     private Set ctSanPhams = new HashSet(0);
     private Set khuyenMais = new HashSet(0);
     private Set binhLuans = new HashSet(0);
     private Set danhGias = new HashSet(0);

    public SanPham() {
    }

	
    public SanPham(LoaiSanPham loaiSanPham, String tenSp) {
        this.loaiSanPham = loaiSanPham;
        this.tenSp = tenSp;
    }
    public SanPham(NhaSanXuat nhaSanXuat, LoaiSanPham loaiSanPham, String tenSp, String gioiThieu, Integer gia, Integer soThangBaoHanh, String hinhDaiDien, Integer soLuongHienCo, Integer tongSoLuong, Date ngayNhap, Float diemDanhGiaTb, Set ctDonHangs, Set danhSachMongMuons, Set ctSanPhams, Set khuyenMais, Set binhLuans, Set danhGias) {
       this.nhaSanXuat = nhaSanXuat;
       this.loaiSanPham = loaiSanPham;
       this.tenSp = tenSp;
       this.gioiThieu = gioiThieu;
       this.gia = gia;
       this.soThangBaoHanh = soThangBaoHanh;
       this.hinhDaiDien = hinhDaiDien;
       this.soLuongHienCo = soLuongHienCo;
       this.tongSoLuong = tongSoLuong;
       this.ngayNhap = ngayNhap;
       this.diemDanhGiaTb = diemDanhGiaTb;
       this.ctDonHangs = ctDonHangs;
       this.danhSachMongMuons = danhSachMongMuons;
       this.ctSanPhams = ctSanPhams;
       this.khuyenMais = khuyenMais;
       this.binhLuans = binhLuans;
       this.danhGias = danhGias;
    }
   
    public Integer getMaSp() {
        return this.maSp;
    }
    
    public void setMaSp(Integer maSp) {
        this.maSp = maSp;
    }
    public NhaSanXuat getNhaSanXuat() {
        return this.nhaSanXuat;
    }
    
    public void setNhaSanXuat(NhaSanXuat nhaSanXuat) {
        this.nhaSanXuat = nhaSanXuat;
    }
    public LoaiSanPham getLoaiSanPham() {
        return this.loaiSanPham;
    }
    
    public void setLoaiSanPham(LoaiSanPham loaiSanPham) {
        this.loaiSanPham = loaiSanPham;
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
    public Integer getSoThangBaoHanh() {
        return this.soThangBaoHanh;
    }
    
    public void setSoThangBaoHanh(Integer soThangBaoHanh) {
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
    public Set getCtDonHangs() {
        return this.ctDonHangs;
    }
    
    public void setCtDonHangs(Set ctDonHangs) {
        this.ctDonHangs = ctDonHangs;
    }
    public Set getDanhSachMongMuons() {
        return this.danhSachMongMuons;
    }
    
    public void setDanhSachMongMuons(Set danhSachMongMuons) {
        this.danhSachMongMuons = danhSachMongMuons;
    }
    public Set getCtSanPhams() {
        return this.ctSanPhams;
    }
    
    public void setCtSanPhams(Set ctSanPhams) {
        this.ctSanPhams = ctSanPhams;
    }
    public Set getKhuyenMais() {
        return this.khuyenMais;
    }
    
    public void setKhuyenMais(Set khuyenMais) {
        this.khuyenMais = khuyenMais;
    }
    public Set getBinhLuans() {
        return this.binhLuans;
    }
    
    public void setBinhLuans(Set binhLuans) {
        this.binhLuans = binhLuans;
    }
    public Set getDanhGias() {
        return this.danhGias;
    }
    
    public void setDanhGias(Set danhGias) {
        this.danhGias = danhGias;
    }




}

