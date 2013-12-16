package cellphoneshop.service;

import cellphoneshop.model.CtSanPham;


public interface CTSanPhamService {
	/**
	 * Chen chi tiet san pham moi.
	 */
	void insertCTSanPham(CtSanPham ctSanPham);
	
	/**
	 * Lay chi tiet san pham theo ma chi tiet san pham.
	 */
	CtSanPham getCTSanPhamTheoId(Integer maCtSP);
	
	/**
	 * Lay chi tiet san pham theo ma san pham.
	 */
	CtSanPham getCTSanPhamTheoMaSP(Integer maSanPham);
	
	/**
	 * Cap nhap chi tiet san pham.
	 */
	void updateCTSanPham(CtSanPham ctSanPham);
}
