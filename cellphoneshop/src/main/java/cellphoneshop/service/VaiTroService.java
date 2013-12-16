package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.VaiTro;

public interface VaiTroService {

	List<VaiTro> getListVaiTro();
	VaiTro getVaiTro(String name);
}
