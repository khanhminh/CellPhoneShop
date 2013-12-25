package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.BinhLuan;

public interface BinhLuanService {
	boolean insertBinhLuan(BinhLuan binhLuanMoi);
	BinhLuan getBinhLuan(Integer maBinhLuan);
	boolean updateBinhLuan(BinhLuan binhLuan);
	
	/**
	 * Xem them {@link #demSoBinhLuanCuaSanPham(Long)}
	 */
	List<BinhLuan> getListBinhLuanTheoMaSP(Integer maSanPham, int kqDauTien, int soKqToiDa);
	int demSoBinhLuanCuaSanPham(Integer maSanPham);
	
	boolean deleteBinhLuan(Integer maBinhLuan);
	boolean deleteBinhLuan(BinhLuan binhLuan);
}
