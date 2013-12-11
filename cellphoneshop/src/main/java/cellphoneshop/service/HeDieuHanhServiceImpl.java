package cellphoneshop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.HeDieuHanhDAO;
import cellphoneshop.model.Hedieuhanh;

@Service
public class HeDieuHanhServiceImpl implements HeDieuHanhService {
	@Autowired
	private HeDieuHanhDAO hdhDAO;

	public void insertHeDieuHanh(Hedieuhanh hdh) {
		hdhDAO.insertHeDieuHanh(hdh);
	}

	public Hedieuhanh getHeDieuHanhTheoId(Short maHDH) {
		return hdhDAO.getHeDieuHanhTheoId(maHDH);
	}

	public List<Hedieuhanh> getListHeDieuHanh() {
		return hdhDAO.getListHeDieuHanh();
	}
}
