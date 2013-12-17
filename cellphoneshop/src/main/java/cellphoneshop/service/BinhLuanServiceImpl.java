package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.BinhLuanDAO;
import cellphoneshop.model.BinhLuan;

@Service
public class BinhLuanServiceImpl implements BinhLuanService {
	@Autowired
	private BinhLuanDAO binhLuanDAO;

	public void insertBinhLuan(BinhLuan binhLuanMoi) {
		binhLuanDAO.insertBinhLuan(binhLuanMoi);
	}

	public BinhLuan getBinhLuan(Integer maBinhLuan) {
		return binhLuanDAO.getBinhLuan(maBinhLuan);
	}

	public void updateBinhLuan(BinhLuan binhLuan) {
		binhLuanDAO.updateBinhLuan(binhLuan);
	}

	public List<BinhLuan> getListBinhLuanTheoMaSP(Integer maSanPham,
			int kqDauTien, int soKqToiDa) {
		return binhLuanDAO.getListBinhLuanTheoMaSP(maSanPham, kqDauTien, soKqToiDa);
	}

	public int demSoBinhLuanCuaSanPham(Integer maSanPham) {
		return binhLuanDAO.demSoBinhLuanCuaSanPham(maSanPham);
	}
	
	
}
