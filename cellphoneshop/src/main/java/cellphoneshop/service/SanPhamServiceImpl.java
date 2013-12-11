package cellphoneshop.service;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.SanPhamDAO;
import cellphoneshop.model.Sanpham;

@Service
public class SanPhamServiceImpl implements SanPhamService {

	@Autowired
	private SanPhamDAO spDAO;
	
	public void insertSanPham(Sanpham sp) {
		spDAO.insertSanPham(sp);
	}

	public Sanpham getSanPhamTheoId(Long maSp) {
		return spDAO.getSanPhamTheoId(maSp);
	}

	public void updateSanPham(Sanpham sp) {
		spDAO.updateSanPham(sp);
	}

	public List<Sanpham> getListSanPhamMoi(Date ngayBatDau, int ketQuaDauTien,
			int soKetQuaToiDa) {
		return spDAO.getListSanPhamMoi(ngayBatDau, ketQuaDauTien, soKetQuaToiDa);
	}

	public long demSoSanPhamMoi(Date ngayBatDau) {
		return spDAO.demSoSanPhamMoi(ngayBatDau);
	}
}
