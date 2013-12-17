package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.TrangThaiDonHangDAO;
import cellphoneshop.model.TrangThaiDonHang;

@Service
public class TrangThaiDonHangServiceImpl implements TrangThaiDonHangService {
	@Autowired
	private TrangThaiDonHangDAO ttDonHangDAO;

	public void insertTrangThaiDonHang(TrangThaiDonHang ttDonHang) {
		ttDonHangDAO.insertTrangThaiDonHang(ttDonHang);
	}

	public TrangThaiDonHang getTrangThaiDonHang(Integer maTrangThai) {
		return ttDonHangDAO.getTrangThaiDonHang(maTrangThai);
	}

	public List<TrangThaiDonHang> getListTrangThaiDonHang() {
		return ttDonHangDAO.getListTrangThaiDonHang();
	}
	
	
}
