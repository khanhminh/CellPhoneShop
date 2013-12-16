package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.LoaiSanPham;

public interface LoaiSanPhamDAO {
	void insertLoaiSP(LoaiSanPham loaiSP);
	LoaiSanPham getLoaiSPTheoId(Integer maLoaiSP);
	List<LoaiSanPham> getListLoaiSP();
}
