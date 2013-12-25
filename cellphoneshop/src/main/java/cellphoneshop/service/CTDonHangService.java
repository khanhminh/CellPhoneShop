package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.CtDonHang;

public interface CTDonHangService {
	void insertCTDonHang(CtDonHang ctDonHang);
	CtDonHang getCTDonHang(Integer maCTDonHang);
	void updateCTDonHang(CtDonHang ctDonHang);
	List<CtDonHang> getListCTDonHangTheoMaDonHang(Integer maDonHang);
	//TODO: Them ham xoa CTDonHang
}
