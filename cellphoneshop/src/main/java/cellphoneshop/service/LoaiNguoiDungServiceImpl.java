package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.LoaiNguoiDungDAO;
import cellphoneshop.model.Loainguoidung;

@Service
public class LoaiNguoiDungServiceImpl implements LoaiNguoiDungService {
	@Autowired
	private LoaiNguoiDungDAO loaiNDDAO;

	public void insertLoaiNguoiDung(Loainguoidung loaiND) {
		loaiNDDAO.insertLoaiNguoiDung(loaiND);
	}

	public Loainguoidung getLoaiNguoiDungById(Short maLoaiND) {
		return loaiNDDAO.getLoaiNguoiDungById(maLoaiND);
	}

	public List<Loainguoidung> getListLoaiNguoiDung() {
		return loaiNDDAO.getListLoaiNguoiDung();
	}
}
