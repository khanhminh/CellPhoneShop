package cellphoneshop.service;

import java.util.List;

import cellphoneshop.model.CartItem;
import cellphoneshop.model.DonHang;
import cellphoneshop.model.NguoiNhan;
import cellphoneshop.model.PtGiaoHang;
import cellphoneshop.model.PtThanhToan;

public interface DonHangService {
	void insertDonHang(DonHang donHangMoi);
	DonHang getDonHang(Integer maDonHang);
	DonHang getDonHangCungChiTietTheoId(Integer maDonHang);
	void updateDonHang(DonHang donHang);
	List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung, boolean isAsc, Integer maStatus, int kqDautien, int kqToiDa);
	Integer checkOut(Integer maND, List<CartItem> cartItemList, DonHang donHang);
	// TODO: lam chuc nang xoa don hang
}
