package cellphoneshop.service;

import java.util.List;

import cellphoneshop.model.Nhasanxuat;

public interface NhaSanXuatService {
	boolean insertNhaSanXuat(Nhasanxuat nhaSX);
	Nhasanxuat getNhaSanXuatById(Short maNhaSX);
	List<Nhasanxuat> getListNhaSanXuat();
}
