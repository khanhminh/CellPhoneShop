package cellphoneshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.DanhGiaDAO;
import cellphoneshop.dao.DanhGiaDAOImpl;
import cellphoneshop.dao.SanPhamDAO;
import cellphoneshop.model.DanhGia;
import cellphoneshop.model.DanhGiaId;
import cellphoneshop.model.NguoiDung;
import cellphoneshop.model.SanPham;
import cellphoneshop.viewmodel.RatingInfor;

@Service
public class DanhGiaServiceImpl implements DanhGiaService {
	@Autowired
	private DanhGiaDAO danhGiaDAO;
	@Autowired
	private SanPhamDAO sanPhamDAO;

	public boolean insertDanhGia(DanhGia danhGia) {
		return danhGiaDAO.insertDanhGia(danhGia);
	}

	public DanhGia getDanhGia(Integer maSanPham, Integer maNguoiDung) {
		return danhGiaDAO.getDanhGia(maSanPham, maNguoiDung);
	}

	public boolean updateDanhGia(DanhGia danhGia) {
		return danhGiaDAO.updateDanhGia(danhGia);
	}

	public boolean insertDanhGia(NguoiDung nguoiDung, Integer maSp, float score) {
		SanPham sanPham = new SanPham();
		sanPham.setMaSp(maSp);		
		DanhGia danhGia = danhGiaDAO.getDanhGia(maSp, nguoiDung.getMaNd());
		if (danhGia != null){
			danhGia.setDiem(score);
			updateDanhGia(danhGia);
			return true;
		}
		else {
			DanhGiaId id = new DanhGiaId(maSp, nguoiDung.getMaNd());
			danhGia = new DanhGia(id, sanPham, nguoiDung, score);
			return danhGiaDAO.insertDanhGia(danhGia);			
		}
	}

	public RatingInfor getThongTinDanhGiaSanPham(Integer maSanPham) {
		// TODO Auto-generated method stub
		RatingInfor ratingInfor = new RatingInfor();
		SanPham sanPham = sanPhamDAO.getSanPhamTheoId(maSanPham);
		if(sanPham == null){
			return ratingInfor;
		}
		
		int numberUser = danhGiaDAO.countDanhGia(maSanPham);
		if(numberUser == -1){
			return ratingInfor;
		}
		
		ratingInfor.setNumberUser(numberUser);
		ratingInfor.setAvgRating(sanPham.getDiemDanhGiaTb());
		

		return ratingInfor;
	}
}
