package cellphoneshop.service;

import java.util.List;

import cellphoneshop.model.Sanpham;

public interface SanPhamService {
	/**
	 * Them san pham moi
	 */
	void insertSanPham(Sanpham sp);
	
	/**
	 * Lay thong tin san pham theo Id
	 */
	Sanpham getSanPhamTheoId(Long maSp);
	
	void updateSanPham(Sanpham sp);
	
	/**
	 * Lay danh sach san pham moi trong tuan co phan trang.
	 */
	List<Sanpham> getListSanPhamMoiTrongTuan(int ketQuaDauTien, int soKetQuaToiDa);
	
	/**
	 * Dem so luong tat ca san pham moi them trong tuan.
	 */
	int demSoSanPhamMoiTrongTuan();
	
	/**
	 * Tim kiem san pham theo ten. Xem them {@link #demSoSanPhamKhiTimKiemTheoTen(String)}
	 */
	List<Sanpham> timKiemSanPhamTheoTen(String tuKhoa, int kqDauTien, int soKqToiDa);
	
	/**
	 * Dem tat ca ket qua tim kiem theo ten.
	 */
	long demSoSanPhamKhiTimKiemTheoTen(String tuKhoa);
}