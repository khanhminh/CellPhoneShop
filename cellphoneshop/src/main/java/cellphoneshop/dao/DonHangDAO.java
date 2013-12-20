package cellphoneshop.dao;

import java.util.List;

import cellphoneshop.model.DonHang;

public interface DonHangDAO {
	void insertDonHang(DonHang donHangMoi);
	DonHang getDonHang(Integer maDonHang);
	DonHang getDonHangCungChiTietTheoId(Integer maDonHang);
	void updateDonHang(DonHang donHang);
	List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung, boolean isAsc, Integer maStatus, int kqDautien, int kqToiDa);
	List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung);
	public List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung, Integer maStatus);
	// TODO: lam chuc nang xoa don hang
}
