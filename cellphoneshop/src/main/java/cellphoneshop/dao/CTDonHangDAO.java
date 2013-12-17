package cellphoneshop.dao;

import java.util.List;

import cellphoneshop.model.CtDonHang;

public interface CTDonHangDAO {
	void insertCTDonHang(CtDonHang ctDonHang);
	CtDonHang getCTDonHang(Integer maCTDonHang);
	void updateCTDonHang(CtDonHang ctDonHang);
	List<CtDonHang> getListCTDonHangTheoMaDonHang(Integer maDonHang);
	//TODO: Them ham xoa CTDonHang
}