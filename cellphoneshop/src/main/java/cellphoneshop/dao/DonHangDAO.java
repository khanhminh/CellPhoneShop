package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.DonHang;

public interface DonHangDAO {
	void insertDonHang(DonHang donHangMoi);
	DonHang getDonHang(Integer maDonHang);
	DonHang getDonHangCungChiTietTheoId(Integer maDonHang);
	void updateDonHang(DonHang donHang);
	List<DonHang> getListDonHangTheoNguoiDung(int maNguoiDung); // TODO: Sap xep theo dat hang
	
	
	// TODO: lam chuc nang xoa don hang
}
