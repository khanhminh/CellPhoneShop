package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.BinhLuanDAO;
import cellphoneshop.model.Binhluan;

@Service
public class BinhLuanServiceImpl implements BinhLuanService {
	@Autowired
	private BinhLuanDAO binhLuanDAO;

	public void insertBinhLuan(Binhluan binhLuanMoi) {
		binhLuanDAO.insertBinhLuan(binhLuanMoi);
	}

	public Binhluan getBinhLuan(Long maBinhLuan) {
		return binhLuanDAO.getBinhLuan(maBinhLuan);
	}

	public void updateBinhLuan(Binhluan binhLuan) {
		binhLuanDAO.updateBinhLuan(binhLuan);
	}

	public List<Binhluan> getListBinhLuanTheoMaSP(Long maSanPham,
			int kqDauTien, int soKqToiDa) {
		return binhLuanDAO.getListBinhLuanTheoMaSP(maSanPham, kqDauTien, soKqToiDa);
	}

	public int demSoBinhLuanCuaSanPham(Long maSanPham) {
		return binhLuanDAO.demSoBinhLuanCuaSanPham(maSanPham);
	}
	
	
}
