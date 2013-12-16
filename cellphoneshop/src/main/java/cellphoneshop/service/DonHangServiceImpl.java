package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.DonHangDAO;
import cellphoneshop.model.DonHang;

@Service
public class DonHangServiceImpl implements DonHangService {
	@Autowired
	private DonHangDAO donHangDAO;

	public void insertDonHang(DonHang donHangMoi) {
		donHangDAO.insertDonHang(donHangMoi);
	}

	public DonHang getDonHang(Integer maDonHang) {
		return donHangDAO.getDonHang(maDonHang);
	}

	public void updateDonHang(DonHang donHang) {
		donHangDAO.updateDonHang(donHang);
	}

	public List<DonHang> getListDonHangTheoNguoiDung(int maNguoiDung) {
		return donHangDAO.getListDonHangTheoNguoiDung(maNguoiDung);
	}
}
