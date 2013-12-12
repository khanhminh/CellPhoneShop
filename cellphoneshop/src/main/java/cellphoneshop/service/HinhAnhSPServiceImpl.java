package cellphoneshop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.HinhAnhSPDAO;
import cellphoneshop.model.Hinhanhsp;

@Service
public class HinhAnhSPServiceImpl implements HinhAnhSPService {
	@Autowired
	private HinhAnhSPDAO hinhAnhSPDAO;

	public void insertHinhAnhSP(Hinhanhsp hinhSp) {
		hinhAnhSPDAO.insertHinhAnhSP(hinhSp);
	}

	public void updateHinhAnhSp(Hinhanhsp hinhSp) {
		hinhAnhSPDAO.updateHinhAnhSp(hinhSp);
	}

	public List<Hinhanhsp> getListHinhAnhSPTheoMaCTSP(Long maChiTietSP) {
		return hinhAnhSPDAO.getListHinhAnhSPTheoMaCTSP(maChiTietSP);
	}
}
