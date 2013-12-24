package cellphoneshop.service;

import java.util.List;

import cellphoneshop.model.CartItem;
import cellphoneshop.model.DonHang;
import cellphoneshop.viewmodel.SortBy;

public interface DonHangService {
	void insertDonHang(DonHang donHangMoi);
	DonHang getDonHang(Integer maDonHang);
	DonHang getDonHangCungChiTietTheoId(Integer maDonHang);
	void updateDonHang(DonHang donHang);
	List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung, boolean isAsc, Integer maStatus, int kqDautien, int kqToiDa);
	Integer checkOut(Integer maND, List<CartItem> cartItemList, DonHang donHang);
	List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung);
	List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung, Integer maStatus);
	List<DonHang> getListDonHang(Integer maStatus, SortBy sortby, int start, int count);
	int demoSoDonHang(Integer maStatus);
	boolean xoaDonHang(Integer maDonHang);
	// TODO: lam chuc nang xoa don hang
}
