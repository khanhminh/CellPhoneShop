package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.TrangThaiDonHangDAO;
import cellphoneshop.model.Trangthaidonhang;

@Service
public class TrangThaiDonHangServiceImpl implements TrangThaiDonHangService {
	@Autowired
	private TrangThaiDonHangDAO ttDonHangDAO;

	public void insertTrangThaiDonHang(Trangthaidonhang ttDonHang) {
		ttDonHangDAO.insertTrangThaiDonHang(ttDonHang);
	}

	public Trangthaidonhang getTrangThaiDonHang(Short maTrangThai) {
		return ttDonHangDAO.getTrangThaiDonHang(maTrangThai);
	}

	public List<Trangthaidonhang> getListTrangThaiDonHang() {
		return ttDonHangDAO.getListTrangThaiDonHang();
	}
	
	
}
