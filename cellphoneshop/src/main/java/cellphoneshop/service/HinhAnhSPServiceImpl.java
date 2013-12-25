package cellphoneshop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.HinhAnhSPDAO;
import cellphoneshop.model.HinhAnhSp;

@Service
public class HinhAnhSPServiceImpl implements HinhAnhSPService {
	@Autowired
	private HinhAnhSPDAO hinhAnhSPDAO;

	public void insertHinhAnhSP(HinhAnhSp hinhSp) {
		hinhAnhSPDAO.insertHinhAnhSP(hinhSp);
	}

	public void updateHinhAnhSp(HinhAnhSp hinhSp) {
		hinhAnhSPDAO.updateHinhAnhSp(hinhSp);
	}

	public List<HinhAnhSp> getListHinhAnhSPTheoMaCTSP(Integer maChiTietSP) {
		return hinhAnhSPDAO.getListHinhAnhSPTheoMaCTSP(maChiTietSP);
	}
}
