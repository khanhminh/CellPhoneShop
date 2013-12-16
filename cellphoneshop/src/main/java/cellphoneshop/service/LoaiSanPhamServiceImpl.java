package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.LoaiSanPhamDAO;
import cellphoneshop.model.LoaiSanPham;

@Service
public class LoaiSanPhamServiceImpl implements LoaiSanPhamService {
	@Autowired
	private LoaiSanPhamDAO loaiSpDAO;

	public void insertLoaiSP(LoaiSanPham loaiSP) {
		loaiSpDAO.insertLoaiSP(loaiSP);
	}

	public LoaiSanPham getLoaiSPTheoId(Integer maLoaiSP) {
		return loaiSpDAO.getLoaiSPTheoId(maLoaiSP);
	}

	public List<LoaiSanPham> getListLoaiSP() {
		return loaiSpDAO.getListLoaiSP();
	}

}
