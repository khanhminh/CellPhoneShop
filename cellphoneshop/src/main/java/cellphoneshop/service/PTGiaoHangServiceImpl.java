package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.PTGiaoHangDAO;
import cellphoneshop.model.Ptgiaohang;

@Service
public class PTGiaoHangServiceImpl implements PTGiaoHangService {
	@Autowired
	private PTGiaoHangDAO ptGiaoHangDAO;

	public void insertPTGiaoHang(Ptgiaohang ptGiaoHang) {
		ptGiaoHangDAO.insertPTGiaoHang(ptGiaoHang);
	}

	public Ptgiaohang getPTGiaoHang(Short maPtGiaoHang) {
		return ptGiaoHangDAO.getPTGiaoHang(maPtGiaoHang);
	}

	public List<Ptgiaohang> getListPTGiaoHang() {
		return ptGiaoHangDAO.getListPTGiaoHang();
	}
}
