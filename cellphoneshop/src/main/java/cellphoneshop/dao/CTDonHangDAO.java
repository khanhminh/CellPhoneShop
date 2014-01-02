package cellphoneshop.dao;

import java.util.List;

import cellphoneshop.model.CtDonHang;

public interface CTDonHangDAO {
	boolean insertCTDonHang(CtDonHang ctDonHang);
	CtDonHang getCTDonHang(Integer maCTDonHang);
	boolean updateCTDonHang(CtDonHang ctDonHang);
	List<CtDonHang> getListCTDonHangTheoMaDonHang(Integer maDonHang);
	boolean xoaCTDonHang(Integer maDonHang);
	//TODO: Them ham xoa CTDonHang
}