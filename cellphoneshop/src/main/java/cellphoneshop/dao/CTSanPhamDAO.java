package cellphoneshop.dao;

import cellphoneshop.model.CtSanPham;

public interface CTSanPhamDAO {
	boolean insertCTSanPham(CtSanPham ctSanPham);
	CtSanPham getCTSanPhamTheoId(Integer maCtSP);
	CtSanPham getCTSanPhamTheoMaSP(Integer maSanPham);
	boolean updateCTSanPham(CtSanPham ctSanPham);
}