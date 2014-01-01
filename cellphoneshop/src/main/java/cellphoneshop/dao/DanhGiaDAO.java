package cellphoneshop.dao;

import cellphoneshop.model.DanhGia;

public interface DanhGiaDAO {
	boolean insertDanhGia(DanhGia danhGia);
	DanhGia getDanhGia(Integer maSanPham, Integer maNguoiDung);
	boolean updateDanhGia(DanhGia danhGia);
	int countDanhGia(Integer maSp);
}
