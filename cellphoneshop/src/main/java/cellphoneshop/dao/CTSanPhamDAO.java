package cellphoneshop.dao;

import cellphoneshop.model.CtSanPham;

public interface CTSanPhamDAO {
	void insertCTSanPham(CtSanPham ctSanPham);
	CtSanPham getCTSanPhamTheoId(Integer maCtSP);
	CtSanPham getCTSanPhamTheoMaSP(Integer maSanPham);
	void updateCTSanPham(CtSanPham ctSanPham);
}