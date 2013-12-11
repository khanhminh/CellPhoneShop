package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.LoaiSanPhamDAO;
import cellphoneshop.model.Loaisanpham;

@Service
public class LoaiSanPhamServiceImpl implements LoaiSanPhamService {
	@Autowired
	private LoaiSanPhamDAO loaiSpDAO;

	public void insertLoaiSP(Loaisanpham loaiSP) {
		loaiSpDAO.insertLoaiSP(loaiSP);
	}

	public Loaisanpham getLoaiSPTheoId(Short maLoaiSP) {
		return loaiSpDAO.getLoaiSPTheoId(maLoaiSP);
	}

	public List<Loaisanpham> getListLoaiSP() {
		return loaiSpDAO.getListLoaiSP();
	}

}
