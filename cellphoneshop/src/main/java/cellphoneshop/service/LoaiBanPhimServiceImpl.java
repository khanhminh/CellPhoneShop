package cellphoneshop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.LoaiBanPhimDAO;
import cellphoneshop.model.Loaibanphim;

@Service
public class LoaiBanPhimServiceImpl implements LoaiBanPhimService {

	@Autowired
	private LoaiBanPhimDAO loaiBPDAO;
	
	public void insertLoaiBanPhim(Loaibanphim loaiBP) {
		loaiBPDAO.insertLoaiBanPhim(loaiBP);
	}

	public Loaibanphim getLoaiBanPhimTheoId(Short maLoaiBP) {
		return loaiBPDAO.getLoaiBanPhimTheoId(maLoaiBP);
	}

	public List<Loaibanphim> getListLoaiBanPhim() {
		return loaiBPDAO.getListLoaiBanPhim();
	}
	
}
