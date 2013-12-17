package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.NhaSanXuat;

public interface NhaSanXuatDAO {
	boolean insertNhaSanXuat(NhaSanXuat nhaSX);
	NhaSanXuat getNhaSanXuatTheoId(Integer maNhaSX);
	List<NhaSanXuat> getListNhaSanXuat();
}