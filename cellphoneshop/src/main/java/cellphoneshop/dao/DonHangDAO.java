package cellphoneshop.dao;

import java.util.List;

import cellphoneshop.model.DonHang;

public interface DonHangDAO {
	void insertDonHang(DonHang donHangMoi);
	DonHang getDonHang(Integer maDonHang);
	DonHang getDonHangCungChiTietTheoId(Integer maDonHang);
	boolean updateDonHang(DonHang donHang);
	List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung, boolean isAsc, Integer maStatus, int kqDautien, int kqToiDa);
	List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung);
	public List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung, Integer maStatus);
	// TODO: lam chuc nang xoa don hang
	List<DonHang> getListDonHang(String by, boolean asc, int start, int count);
	List<DonHang> getListDonHang(Integer maStatus, String by, boolean asc, int start, int count);
	int demSoDonHang();
	int demSoDonHang(Integer maStatus);
	boolean xoaDonHang(Integer maDonHang);
	List<DonHang> getListDonHangTheoNguoiDung(Integer maNd, int start, int view);
	int demSoDonHangTheoNguoiDung(Integer maNd);
}
