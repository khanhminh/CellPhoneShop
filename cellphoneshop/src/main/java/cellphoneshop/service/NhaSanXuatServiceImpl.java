package cellphoneshop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.NhaSanXuatDAO;
import cellphoneshop.model.NhaSanXuat;

@Service
public class NhaSanXuatServiceImpl implements NhaSanXuatService {

	@Autowired
	private NhaSanXuatDAO nhaSXDAO;
	
	public List<NhaSanXuat> getListNhaSanXuat() {
		return nhaSXDAO.getListNhaSanXuat();
	}

	public boolean insertNhaSanXuat(NhaSanXuat nhaSX) {
		return nhaSXDAO.insertNhaSanXuat(nhaSX);
	}

	public NhaSanXuat getNhaSanXuatTheoId(Integer maNhaSX) {
		return nhaSXDAO.getNhaSanXuatTheoId(maNhaSX);
	}
}