package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.Vaitro;

public interface VaiTroService {

	List<Vaitro> getListVaiTro();
	Vaitro getVaiTro(String name);
}
