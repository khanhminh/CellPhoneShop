package cellphoneshop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.NhaSanXuatDAO;
import cellphoneshop.model.Nhasanxuat;

@Service
public class NhaSanXuatServiceImpl implements NhaSanXuatService {

	@Autowired
	private NhaSanXuatDAO nhaSXDAO;
	
	public List<Nhasanxuat> getListNhaSanXuat() {
		return nhaSXDAO.getListNhaSanXuat();
	}

	public boolean insertNhaSanXuat(Nhasanxuat nhaSX) {
		return nhaSXDAO.insertNhaSanXuat(nhaSX);
	}

	public Nhasanxuat getNhaSanXuatTheoId(Short maNhaSX) {
		return nhaSXDAO.getNhaSanXuatTheoId(maNhaSX);
	}
}