package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.NhaSanXuatDAO;
import cellphoneshop.model.Nhasanxuat;

@Service
public class NhaSanXuatServiceImpl implements NhaSanXuatService {

	@Autowired
	private NhaSanXuatDAO nhaSanXuatDAO;
	
	public List<Nhasanxuat> getListNhaSanXuat() {
		return nhaSanXuatDAO.getListNhaSanXuat();
	}

}