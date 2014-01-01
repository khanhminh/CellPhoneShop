package cellphoneshop.service;

import cellphoneshop.model.DanhGia;
import cellphoneshop.model.NguoiDung;
import cellphoneshop.viewmodel.RatingInfor;

public interface DanhGiaService {
	boolean insertDanhGia(DanhGia danhGia);
	boolean insertDanhGia(NguoiDung nguoiDung, Integer maSp, float score);
	DanhGia getDanhGia(Integer maSanPham, Integer maNguoiDung);
	boolean updateDanhGia(DanhGia danhGia);
	RatingInfor getThongTinDanhGiaSanPham(Integer maSanPham);
}
