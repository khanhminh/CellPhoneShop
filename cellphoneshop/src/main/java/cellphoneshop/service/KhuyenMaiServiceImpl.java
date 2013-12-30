package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.KhuyenMaiDAO;
import cellphoneshop.model.KhuyenMai;

@Service
public class KhuyenMaiServiceImpl implements KhuyenMaiService {
	@Autowired
	private KhuyenMaiDAO khuyenMaiDAO;

	public boolean insertKhuyenMai(KhuyenMai khuyenMai) {
		return khuyenMaiDAO.insertKhuyenMai(khuyenMai);
	}

	public KhuyenMai getKhuyenMai(Integer maKhuyenMai) {
		return khuyenMaiDAO.getKhuyenMai(maKhuyenMai);
	}

	public boolean updateKhuyenMai(KhuyenMai khuyenMai) {
		return khuyenMaiDAO.updateKhuyenMai(khuyenMai);
	}

	public List<KhuyenMai> getListKhuyenMai() {
		return khuyenMaiDAO.getListKhuyenMai();
	}

	public List<KhuyenMai> getListKhuyenMaiChuaDong() {
		return khuyenMaiDAO.getListKhuyenMaiChuaDong();
	}

	public List<KhuyenMai> getListKhuyenMai(Integer vitriBD, Integer soluongKM) {
		return khuyenMaiDAO.getListKhuyenMai(vitriBD, soluongKM);
	}
}
