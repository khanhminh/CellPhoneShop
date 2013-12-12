package cellphoneshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.CTSanPhamDAO;
import cellphoneshop.model.Ctsanpham;

@Service
public class CTSanPhamServiceImpl implements CTSanPhamService {
	@Autowired
	private CTSanPhamDAO ctspDAO;

	public void insertCTSanPham(Ctsanpham ctSanPham) {
		ctspDAO.insertCTSanPham(ctSanPham);
	}

	public Ctsanpham getCTSanPhamTheoId(Long maCtSP) {
		return ctspDAO.getCTSanPhamTheoId(maCtSP);
	}

	public Ctsanpham getCTSanPhamTheoMaSP(Long maSanPham) {
		return ctspDAO.getCTSanPhamTheoMaSP(maSanPham);
	}

	public void updateCTSanPham(Ctsanpham ctSanPham) {
		ctspDAO.updateCTSanPham(ctSanPham);
	}
}
