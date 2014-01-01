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

	public boolean insertHinhAnhSP(HinhAnhSp hinhSp) {
		return hinhAnhSPDAO.insertHinhAnhSP(hinhSp);
	}

	public boolean updateHinhAnhSp(HinhAnhSp hinhSp) {
		return hinhAnhSPDAO.updateHinhAnhSp(hinhSp);
	}

	public List<HinhAnhSp> getListHinhAnhSPTheoMaCTSP(Integer maChiTietSP) {
		return hinhAnhSPDAO.getListHinhAnhSPTheoMaCTSP(maChiTietSP);
	}
}
