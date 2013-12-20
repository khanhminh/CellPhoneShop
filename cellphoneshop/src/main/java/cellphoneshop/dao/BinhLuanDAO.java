package cellphoneshop.dao;

import java.util.List;

import cellphoneshop.model.BinhLuan;

public interface BinhLuanDAO {
	boolean insertBinhLuan(BinhLuan binhLuanMoi);
	BinhLuan getBinhLuan(Integer maBinhLuan);
	boolean updateBinhLuan(BinhLuan binhLuan);
	boolean deleteBinhLuan(BinhLuan binhLuan);
	List<BinhLuan> getListBinhLuanTheoMaSP(Integer maSanPham, int kqDauTien, int soKqToiDa);
	int demSoBinhLuanCuaSanPham(Integer maSanPham);
}
