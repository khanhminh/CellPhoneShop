package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.DonHangDAO;
import cellphoneshop.model.Donhang;

@Service
public class DonHangServiceImpl implements DonHangService {
	@Autowired
	private DonHangDAO donHangDAO;

	public void insertDonHang(Donhang donHangMoi) {
		donHangDAO.insertDonHang(donHangMoi);
	}

	public Donhang getDonHang(Long maDonHang) {
		return donHangDAO.getDonHang(maDonHang);
	}

	public void updateDonHang(Donhang donHang) {
		donHangDAO.updateDonHang(donHang);
	}

	public List<Donhang> getListDonHangTheoNguoiDung(int maNguoiDung) {
		return donHangDAO.getListDonHangTheoNguoiDung(maNguoiDung);
	}
}
