package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.Binhluan;

public interface BinhLuanService {
	void insertBinhLuan(Binhluan binhLuanMoi);
	Binhluan getBinhLuan(Long maBinhLuan);
	void updateBinhLuan(Binhluan binhLuan);
	/**
	 * Xem them {@link #demSoBinhLuanCuaSanPham(Long)}
	 */
	List<Binhluan> getListBinhLuanTheoMaSP(Long maSanPham, int kqDauTien, int soKqToiDa);
	int demSoBinhLuanCuaSanPham(Long maSanPham);
}
