package cellphoneshop.dao;
import java.util.Date;
import java.util.List;
import cellphoneshop.model.Sanpham;

public interface SanPhamDAO {
	void insertSanPham(Sanpham sp);
	Sanpham getSanPhamTheoId(Long maSp);
	void updateSanPham(Sanpham sp);
	
	/**
	 * Lay danh sach san pham co ngay nhap truoc mot ngay nao do co phan trang.
	 * Xem them ham dem tat ca so san pham co the {@link #demSoSanPhamMoi(Date)}
	 * @param ngayBatDau Ngày bat dau dem.
	 * @param ketQuaDauTien So thu tu cua san pham dau tien trong CSDL.
	 * @param soKetQua So ket qua toi da tra ve.
	 */
	List<Sanpham> getListSanPhamTheoNgayNhap(Date ngayBatDau, int ketQuaDauTien, int soKetQuaToiDa);
	
	/**
	 * Tính số sản phẩm nếu lấy tất cả sản phẩm có ngày nhập
	 * trước một ngày nào đó.
	 */
	long demSoSanPhamTheoNgayNhap(Date ngayBatDau);
	
	
	/**
	 * Lay danh sach san pham co ngay nhap nam giua ngay1 va ngay2.
	 */
	List<Sanpham> getListSanPhamTheoNgayNhap(Date ngay1, Date ngay2,
			int kqDauTien, int soKqToiDa);
	
	/**
	 * Dem tat ca so san pham co ngay nhap nam giua ngay1 va ngay2. 
	 */
	long demSoSanPhamTheoNgayNhap(Date ngay1, Date ngay2);
	
	/**
	 * Tim kiem san pham theo ten. Xem them {@link #demSoSanPhamKhiTimKiemTheoTen(String)}
	 */
	List<Sanpham> timKiemSanPhamTheoTen(String tuKhoa, int kqDauTien, int soKqToiDa);
	
	/**
	 * Dem tat ca ket qua tim kiem theo ten.
	 */
	long demSoSanPhamKhiTimKiemTheoTen(String tuKhoa);
}