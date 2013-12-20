package cellphoneshop.dao;
import java.util.Date;
import java.util.List;

import cellphoneshop.model.ProductFilter;
import cellphoneshop.model.SanPham;

public interface SanPhamDAO {
	void insertSanPham(SanPham sp);
	SanPham getSanPhamTheoId(Integer maSp);
	SanPham getSanPhamCungChiTietTheoId(Integer maSp);
	void updateSanPham(SanPham sp);
	
	/**
	 * Lay danh sach san pham co ngay nhap truoc mot ngay nao do co phan trang.
	 * Xem them ham dem tat ca so san pham co the {@link #demSoSanPhamMoi(Date)}
	 * @param ngayBatDau Ngày bat dau dem.
	 * @param ketQuaDauTien So thu tu cua san pham dau tien trong CSDL.
	 * @param soKetQua So ket qua toi da tra ve.
	 */
	List<SanPham> getListSanPhamTheoNgayNhap(Date ngayBatDau, int ketQuaDauTien, int soKetQuaToiDa);
	
	
	/**
	 * Lay danh sach san pham co theo loai co phan trang
	 * @param maloai ma loai san pham muon lay
	 * @param positionStart Vi tri bat dau trong danh sach ket qua muon lay ra
	 * @param amount So luong san pham muon lay ra tu vi tri bat dau
	 * @param qualification Tieu chua sap xep( theo ten, theo ten, hoac theo gia) - value = "name" or "price"
	 * @param sortStyle Kieu sap xep( tang dan, giam dan) - 1: tang dan, 0 - giam dan
	 * 
	 */
	List<SanPham> getListSanPhamTheoLoai(Integer maloai, Integer positionStart, Integer amount, String qualification, boolean isAsc);
	int demSoSanPhamTheoNgayNhap(Date ngayBatDau);
	
	
	/**
	 * Lay danh sach san pham co ngay nhap nam giua ngay1 va ngay2.
	 */
	List<SanPham> getListSanPhamTheoNgayNhap(Date ngay1, Date ngay2,
			int kqDauTien, int soKqToiDa);
	
	/**
	 * Dem tat ca so san pham co ngay nhap nam giua ngay1 va ngay2. 
	 */
	int demSoSanPhamTheoNgayNhap(Date ngay1, Date ngay2);
	
	/**
	 * Tim kiem san pham theo ten. Xem them {@link #demSoSanPhamKhiTimKiemTheoTen(String)}
	 */
	List<SanPham> timKiemSanPhamTheoTen(String tuKhoa, int kqDauTien, int soKqToiDa);
	
	/**
	 * Dem tat ca ket qua tim kiem theo ten.
	 */
	int demSoSanPhamKhiTimKiemTheoTen(String tuKhoa);
	
	List<SanPham> getListSanPham(ProductFilter productFilter, int kqDauTien, int soKqToiDa);
	int demSoSanPhamKhiGetListSanPham(ProductFilter productFilter);
	
	List<SanPham> getListSanPhamBanChayNhat(int soSanPham);
}