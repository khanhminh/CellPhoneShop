package cellphoneshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.DanhGiaDAO;
import cellphoneshop.model.DanhGia;

@Service
public class DanhGiaServiceImpl implements DanhGiaService {
	@Autowired
	private DanhGiaDAO danhGiaDAO;

	public void insertDanhGia(DanhGia danhGia) {
		danhGiaDAO.insertDanhGia(danhGia);
	}

	public DanhGia getDanhGia(Integer maSanPham, Integer maNguoiDung) {
		return danhGiaDAO.getDanhGia(maSanPham, maNguoiDung);
	}

	public void updateDanhGia(DanhGia danhGia) {
		danhGiaDAO.updateDanhGia(danhGia);
	}
}
