package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.Loainguoidung;

public interface LoaiNguoiDungService {
	void insertLoaiNguoiDung(Loainguoidung loaiND);
	Loainguoidung getLoaiNguoiDungTheoId(Short maLoaiND);
	List<Loainguoidung> getListLoaiNguoiDung();
}
