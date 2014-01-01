package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.CtDonHang;

public interface CTDonHangService {
	boolean insertCTDonHang(CtDonHang ctDonHang);
	CtDonHang getCTDonHang(Integer maCTDonHang);
	boolean updateCTDonHang(CtDonHang ctDonHang);
	List<CtDonHang> getListCTDonHangTheoMaDonHang(Integer maDonHang);
	//TODO: Them ham xoa CTDonHang
}
