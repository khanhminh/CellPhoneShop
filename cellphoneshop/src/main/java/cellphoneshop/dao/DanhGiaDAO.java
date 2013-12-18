package cellphoneshop.dao;

import cellphoneshop.model.DanhGia;


public interface DanhGiaDAO {
	void insertDanhGia(DanhGia danhGia); //TODO Viet trigger trong CSDL cho tu dong cap nhap diem danh gia TB cua san pham
	DanhGia getDanhGia(Integer maSanPham, Integer maNguoiDung);
	void updateDanhGia(DanhGia danhGia);
	int countDanhGia(Integer maSp);
}
