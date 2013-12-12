package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.Donhang;

public interface DonHangService {
	void insertDonHang(Donhang donHangMoi);
	Donhang getDonHang(Long maDonHang);
	void updateDonHang(Donhang donHang);
	List<Donhang> getListDonHangTheoNguoiDung(int maNguoiDung);
	// TODO: lam chuc nang xoa don hang
}
