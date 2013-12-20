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

	public boolean insertBinhLuan(BinhLuan binhLuanMoi) {
		return binhLuanDAO.insertBinhLuan(binhLuanMoi);
	}

	public BinhLuan getBinhLuan(Integer maBinhLuan) {
		return binhLuanDAO.getBinhLuan(maBinhLuan);
	}

	public boolean updateBinhLuan(BinhLuan binhLuan) {
		return binhLuanDAO.updateBinhLuan(binhLuan);
	}

	public List<BinhLuan> getListBinhLuanTheoMaSP(Integer maSanPham,
			int kqDauTien, int soKqToiDa) {
		return binhLuanDAO.getListBinhLuanTheoMaSP(maSanPham, kqDauTien, soKqToiDa);
	}

	public int demSoBinhLuanCuaSanPham(Integer maSanPham) {
		return binhLuanDAO.demSoBinhLuanCuaSanPham(maSanPham);
	}

	public boolean deleteBinhLuan(Integer maBinhLuan) {
		BinhLuan binhLuan = binhLuanDAO.getBinhLuan(maBinhLuan);
		return binhLuanDAO.deleteBinhLuan(binhLuan);
	}

	public boolean deleteBinhLuan(BinhLuan binhLuan) {
		return binhLuanDAO.deleteBinhLuan(binhLuan);
	}
}
