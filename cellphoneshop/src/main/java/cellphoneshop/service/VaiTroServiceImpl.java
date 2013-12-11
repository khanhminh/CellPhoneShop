package cellphoneshop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.VaiTroDAO;
import cellphoneshop.model.Vaitro;

@Service
public class VaiTroServiceImpl implements VaiTroService {

	@Autowired
	private VaiTroDAO vaiTroDAO;
	
	public List<Vaitro> getListVaiTro() {
		
		return vaiTroDAO.getListVaiTro();
	}

}
