package cellphoneshop.service;

import cellphoneshop.model.Danhgia;

public interface DanhGiaService {
	void insertDanhGia(Danhgia danhGia);
	Danhgia getDanhGia(Long maSanPham, Integer maNguoiDung);
	void updateDanhGia(Danhgia danhGia);
}
