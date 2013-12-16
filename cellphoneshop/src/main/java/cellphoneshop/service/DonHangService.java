package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.DonHang;

public interface DonHangService {
	void insertDonHang(DonHang donHangMoi);
	DonHang getDonHang(Integer maDonHang);
	void updateDonHang(DonHang donHang);
	List<DonHang> getListDonHangTheoNguoiDung(int maNguoiDung);
	// TODO: lam chuc nang xoa don hang
}
