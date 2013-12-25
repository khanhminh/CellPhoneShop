package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.VaiTroDAO;
import cellphoneshop.model.VaiTro;

@Service
public class VaiTroServiceImpl implements VaiTroService {

	@Autowired
	private VaiTroDAO vaiTroDAO;
	
	public List<VaiTro> getListVaiTro() {
		
		return vaiTroDAO.getListVaiTro();
	}

	public VaiTro getVaiTro(String name) {
		
		return vaiTroDAO.getVaitro(name);
	}

	public VaiTro getVaiTro(Integer maVaiTro) {
		
		return vaiTroDAO.getVaiTro(maVaiTro);
	}

}
