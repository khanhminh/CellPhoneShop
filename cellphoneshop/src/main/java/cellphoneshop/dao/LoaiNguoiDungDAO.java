package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.LoaiNguoiDung;

public interface LoaiNguoiDungDAO {
	boolean insertLoaiNguoiDung(LoaiNguoiDung loaiND);
	LoaiNguoiDung getLoaiNguoiDungTheoId(Integer maLoaiND);
	List<LoaiNguoiDung> getListLoaiNguoiDung();
}