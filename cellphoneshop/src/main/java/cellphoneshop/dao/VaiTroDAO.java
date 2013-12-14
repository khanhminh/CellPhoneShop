package cellphoneshop.dao;

import java.util.List;

import cellphoneshop.model.Vaitro;

public interface VaiTroDAO {
	List<Vaitro> getListVaiTro();
	Vaitro getVaitro(int maVaiTro);
	Vaitro getVaitro(String tenVaiTro);
}
