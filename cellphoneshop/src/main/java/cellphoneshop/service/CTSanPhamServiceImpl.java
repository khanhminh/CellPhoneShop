package cellphoneshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.CTSanPhamDAO;
import cellphoneshop.model.CtSanPham;

@Service
public class CTSanPhamServiceImpl implements CTSanPhamService {
	@Autowired
	private CTSanPhamDAO ctspDAO;

	public void insertCTSanPham(CtSanPham ctSanPham) {
		ctspDAO.insertCTSanPham(ctSanPham);
	}

	public CtSanPham getCTSanPhamTheoId(Integer maCtSP) {
		return ctspDAO.getCTSanPhamTheoId(maCtSP);
	}

	public CtSanPham getCTSanPhamTheoMaSP(Integer maSanPham) {
		return ctspDAO.getCTSanPhamTheoMaSP(maSanPham);
	}

	public void updateCTSanPham(CtSanPham ctSanPham) {
		ctspDAO.updateCTSanPham(ctSanPham);
	}
}
