package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.LoaiSanPham;

public interface LoaiSanPhamDAO {
	boolean insertLoaiSP(LoaiSanPham loaiSP);
	LoaiSanPham getLoaiSPTheoId(Integer maLoaiSP);
	List<LoaiSanPham> getListLoaiSP();
}
