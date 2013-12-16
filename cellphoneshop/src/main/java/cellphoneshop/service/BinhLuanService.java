package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.BinhLuan;

public interface BinhLuanService {
	void insertBinhLuan(BinhLuan binhLuanMoi);
	BinhLuan getBinhLuan(Integer maBinhLuan);
	void updateBinhLuan(BinhLuan binhLuan);
	/**
	 * Xem them {@link #demSoBinhLuanCuaSanPham(Long)}
	 */
	List<BinhLuan> getListBinhLuanTheoMaSP(Integer maSanPham, int kqDauTien, int soKqToiDa);
	int demSoBinhLuanCuaSanPham(Integer maSanPham);
}
