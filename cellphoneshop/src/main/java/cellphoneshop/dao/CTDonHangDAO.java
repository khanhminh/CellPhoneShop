package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.Ctdonhang;

public interface CTDonHangDAO {
	void insertCTDonHang(Ctdonhang ctDonHang);
	Ctdonhang getCTDonHang(Long maCTDonHang);
	void updateCTDonHang(Ctdonhang ctDonHang);
	List<Ctdonhang> getListCTDonHangTheoMaDonHang(Long maDonHang);
	//TODO: Them ham xoa CTDonHang
}