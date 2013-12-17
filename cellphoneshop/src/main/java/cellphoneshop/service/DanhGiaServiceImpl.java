package cellphoneshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.DanhGiaDAO;
import cellphoneshop.model.DanhGia;
import cellphoneshop.model.DanhGiaId;
import cellphoneshop.model.NguoiDung;
import cellphoneshop.model.SanPham;

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

	public void insertDanhGia(NguoiDung nguoiDung, Integer maSp, float score) {
		SanPham sanPham = new SanPham();
		sanPham.setMaSp(maSp);		
		DanhGia danhGia = danhGiaDAO.getDanhGia(maSp, nguoiDung.getMaNd());
		if (danhGia != null){
			danhGia.setDiem(score);
			updateDanhGia(danhGia);
		}
		else {
			DanhGiaId id = new DanhGiaId(maSp, nguoiDung.getMaNd());
			danhGia = new DanhGia(id, sanPham, nguoiDung, score);
			danhGiaDAO.insertDanhGia(danhGia);			
		}
	}
}
