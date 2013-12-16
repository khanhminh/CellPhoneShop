package cellphoneshop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.HeDieuHanhDAO;
import cellphoneshop.model.HeDieuHanh;

@Service
public class HeDieuHanhServiceImpl implements HeDieuHanhService {
	@Autowired
	private HeDieuHanhDAO hdhDAO;

	public void insertHeDieuHanh(HeDieuHanh hdh) {
		hdhDAO.insertHeDieuHanh(hdh);
	}

	public HeDieuHanh getHeDieuHanhTheoId(Integer maHDH) {
		return hdhDAO.getHeDieuHanhTheoId(maHDH);
	}

	public List<HeDieuHanh> getListHeDieuHanh() {
		return hdhDAO.getListHeDieuHanh();
	}
}
