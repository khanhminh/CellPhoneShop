package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.Nhasanxuat;

public interface NhaSanXuatDAO {
	boolean insertNhaSanXuat(Nhasanxuat nhaSX);
	Nhasanxuat getNhaSanXuatById(Short maNhaSX);
	List<Nhasanxuat> getListNhaSanXuat();
}