package cellphoneshop.service;

import cellphoneshop.model.DanhGia;
import cellphoneshop.model.NguoiDung;
import cellphoneshop.viewmodel.RatingInfor;

public interface DanhGiaService {
	void insertDanhGia(DanhGia danhGia);
	void insertDanhGia(NguoiDung nguoiDung, Integer maSp, float score);
	DanhGia getDanhGia(Integer maSanPham, Integer maNguoiDung);
	void updateDanhGia(DanhGia danhGia);
	RatingInfor getThongTinDanhGiaSanPham(Integer maSanPham);
}
