package cellphoneshop.service;

import cellphoneshop.model.DanhGia;

public interface DanhGiaService {
	void insertDanhGia(DanhGia danhGia);
	DanhGia getDanhGia(Integer maSanPham, Integer maNguoiDung);
	void updateDanhGia(DanhGia danhGia);
}
