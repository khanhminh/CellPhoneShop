package cellphoneshop.service;

import java.util.List;

import cellphoneshop.model.LoaiNguoiDung;

public interface LoaiNguoiDungService {
	void insertLoaiNguoiDung(LoaiNguoiDung loaiND);
	LoaiNguoiDung getLoaiNguoiDungTheoId(Integer maLoaiND);
	List<LoaiNguoiDung> getListLoaiNguoiDung();
}
