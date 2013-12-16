package cellphoneshop.dao;

import java.util.List;

import cellphoneshop.model.BinhLuan;

public interface BinhLuanDAO {
	void insertBinhLuan(BinhLuan binhLuanMoi);
	BinhLuan getBinhLuan(Integer maBinhLuan);
	void updateBinhLuan(BinhLuan binhLuan);
	List<BinhLuan> getListBinhLuanTheoMaSP(Integer maSanPham, int kqDauTien, int soKqToiDa);
	int demSoBinhLuanCuaSanPham(Integer maSanPham);
}
