package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.Loainguoidung;

public interface LoaiNguoiDungDAO {
	void insertLoaiNguoiDung(Loainguoidung loaiND);
	Loainguoidung getLoaiNguoiDungTheoId(Short maLoaiND);
	List<Loainguoidung> getListLoaiNguoiDung();
}