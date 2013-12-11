package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.Loaisanpham;

public interface LoaiSanPhamDAO {
	void insertLoaiSP(Loaisanpham loaiSP);
	Loaisanpham getLoaiSPById(Short maLoaiSP);
	List<Loaisanpham> getListLoaiSP();
}
