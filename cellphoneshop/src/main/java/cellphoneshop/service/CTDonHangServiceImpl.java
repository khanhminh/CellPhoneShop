package cellphoneshop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.CTDonHangDAO;
import cellphoneshop.model.CtDonHang;

@Service
public class CTDonHangServiceImpl implements CTDonHangService {
	@Autowired
	private CTDonHangDAO ctDonHangDAO;

	public boolean insertCTDonHang(CtDonHang ctDonHang) {
		return ctDonHangDAO.insertCTDonHang(ctDonHang);
	}

	public CtDonHang getCTDonHang(Integer maCTDonHang) {
		return ctDonHangDAO.getCTDonHang(maCTDonHang);
	}

	public boolean updateCTDonHang(CtDonHang ctDonHang) {
		return ctDonHangDAO.updateCTDonHang(ctDonHang);
	}

	public List<CtDonHang> getListCTDonHangTheoMaDonHang(Integer maDonHang) {
		return ctDonHangDAO.getListCTDonHangTheoMaDonHang(maDonHang);
	}
}
