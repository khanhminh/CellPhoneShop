package cellphoneshop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.CTDonHangDAO;
import cellphoneshop.model.Ctdonhang;

@Service
public class CTDonHangServiceImpl implements CTDonHangService {
	@Autowired
	private CTDonHangDAO ctDonHangDAO;

	public void insertCTDonHang(Ctdonhang ctDonHang) {
		ctDonHangDAO.insertCTDonHang(ctDonHang);
	}

	public Ctdonhang getCTDonHang(Long maCTDonHang) {
		return ctDonHangDAO.getCTDonHang(maCTDonHang);
	}

	public void updateCTDonHang(Ctdonhang ctDonHang) {
		ctDonHangDAO.updateCTDonHang(ctDonHang);
	}

	public List<Ctdonhang> getListCTDonHangTheoMaDonHang(Long maDonHang) {
		return ctDonHangDAO.getListCTDonHangTheoMaDonHang(maDonHang);
	}
}
