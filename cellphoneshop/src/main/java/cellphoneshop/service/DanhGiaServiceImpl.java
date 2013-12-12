package cellphoneshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.DanhGiaDAO;
import cellphoneshop.model.Danhgia;

@Service
public class DanhGiaServiceImpl implements DanhGiaService {
	@Autowired
	private DanhGiaDAO danhGiaDAO;

	public void insertDanhGia(Danhgia danhGia) {
		danhGiaDAO.insertDanhGia(danhGia);
	}

	public Danhgia getDanhGia(Long maSanPham, Integer maNguoiDung) {
		return danhGiaDAO.getDanhGia(maSanPham, maNguoiDung);
	}

	public void updateDanhGia(Danhgia danhGia) {
		danhGiaDAO.updateDanhGia(danhGia);
	}
}
