package cellphoneshop.dao;

import java.util.List;

import cellphoneshop.model.VaiTro;

public interface VaiTroDAO {
	List<VaiTro> getListVaiTro();
	VaiTro getVaitro(int maVaiTro);
	VaiTro getVaiTro(Integer maVaiTro);
	VaiTro getVaitro(String tenVaiTro);
}
