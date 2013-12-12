package cellphoneshop.dao;

import cellphoneshop.model.Ctsanpham;

public interface CTSanPhamDAO {
	void insertCTSanPham(Ctsanpham ctSanPham);
	Ctsanpham getCTSanPhamTheoId(Long maCtSP);
	Ctsanpham getCTSanPhamTheoMaSP(Long maSanPham);
	void updateCTSanPham(Ctsanpham ctSanPham);
}