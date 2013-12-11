package cellphoneshop.dao;
import java.util.Date;
import java.util.List;
import cellphoneshop.model.Sanpham;

public interface SanPhamDAO {
	void insertSanPham(Sanpham sp);
	Sanpham getSanPhamTheoId(Long maSp);
	void updateSanPham(Sanpham sp);
	
	/**
	 * Lấy danh sách sản phẩm có ngày nhập trước một ngày nào đó.
	 * Xem thêm hàm đếm tất cả số kết quả có thể. {@link #demSoSanPhamMoi(Date)}
	 * @param ngayBatDau Ngày bắt đầu tính.
	 * @param ketQuaDauTien Số thứ tự sản phẩm đầu tiên tìm trong CSDL.
	 * @param soKetQua Số kết quả tối đa mong muốn trả về.
	 * @return Danh sách sản phẩm
	 */
	List<Sanpham> getListSanPhamMoi(Date ngayBatDau, int ketQuaDauTien, int soKetQuaToiDa);
	
	/**
	 * Tính số sản phẩm nếu lấy tất cả sản phẩm có ngày nhập
	 * trước một ngày nào đó.
	 */
	long demSoSanPhamMoi(Date ngayBatDau);
}