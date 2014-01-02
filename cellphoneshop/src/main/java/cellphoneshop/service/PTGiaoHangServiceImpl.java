package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.PTGiaoHangDAO;
import cellphoneshop.model.PtGiaoHang;

@Service
public class PTGiaoHangServiceImpl implements PTGiaoHangService {
	@Autowired
	private PTGiaoHangDAO ptGiaoHangDAO;

	public boolean insertPTGiaoHang(PtGiaoHang ptGiaoHang) {
		return ptGiaoHangDAO.insertPTGiaoHang(ptGiaoHang);
	}

	public PtGiaoHang getPTGiaoHang(Integer maPtGiaoHang) {
		return ptGiaoHangDAO.getPTGiaoHang(maPtGiaoHang);
	}

	public List<PtGiaoHang> getListPTGiaoHang() {
		return ptGiaoHangDAO.getListPTGiaoHang();
	}
}
