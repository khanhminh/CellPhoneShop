package cellphoneshop.dao;

import cellphoneshop.model.Danhgia;

public interface DanhGiaDAO {
	void insertDanhGia(Danhgia danhGia); //TODO Viet trigger trong CSDL cho tu dong cap nhap diem danh gia TB cua san pham
	Danhgia getDanhGia(Long maSanPham, Integer maNguoiDung);
	void updateDanhGia(Danhgia danhGia);
}
