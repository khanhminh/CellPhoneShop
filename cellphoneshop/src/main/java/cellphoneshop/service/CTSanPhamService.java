package cellphoneshop.service;

import cellphoneshop.model.Ctsanpham;

public interface CTSanPhamService {
	/**
	 * Chen chi tiet san pham moi.
	 */
	void insertCTSanPham(Ctsanpham ctSanPham);
	
	/**
	 * Lay chi tiet san pham theo ma chi tiet san pham.
	 */
	Ctsanpham getCTSanPhamTheoId(Long maCtSP);
	
	/**
	 * Lay chi tiet san pham theo ma san pham.
	 */
	Ctsanpham getCTSanPhamTheoMaSP(Long maSanPham);
	
	/**
	 * Cap nhap chi tiet san pham.
	 */
	void updateCTSanPham(Ctsanpham ctSanPham);
}
