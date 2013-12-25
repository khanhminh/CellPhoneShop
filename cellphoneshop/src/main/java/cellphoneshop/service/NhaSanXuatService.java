package cellphoneshop.service;

import java.util.List;

import cellphoneshop.model.NhaSanXuat;

public interface NhaSanXuatService {
	boolean insertNhaSanXuat(NhaSanXuat nhaSX);
	NhaSanXuat getNhaSanXuatTheoId(Integer maNhaSX);
	List<NhaSanXuat> getListNhaSanXuat();
}
