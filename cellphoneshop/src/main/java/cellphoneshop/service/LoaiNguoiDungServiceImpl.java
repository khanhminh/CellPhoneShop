package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.LoaiNguoiDungDAO;
import cellphoneshop.model.LoaiNguoiDung;


@Service
public class LoaiNguoiDungServiceImpl implements LoaiNguoiDungService {
	@Autowired
	private LoaiNguoiDungDAO loaiNDDAO;

	public boolean insertLoaiNguoiDung(LoaiNguoiDung loaiND) {
		return loaiNDDAO.insertLoaiNguoiDung(loaiND);
	}

	public LoaiNguoiDung getLoaiNguoiDungTheoId(Integer maLoaiND) {
		return loaiNDDAO.getLoaiNguoiDungTheoId(maLoaiND);
	}

	public List<LoaiNguoiDung> getListLoaiNguoiDung() {
		return loaiNDDAO.getListLoaiNguoiDung();
	}
}
