package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.Loaisanpham;

public interface LoaiSanPhamService {
	void insertLoaiSP(Loaisanpham loaiSP);
	Loaisanpham getLoaiSPTheoId(Short maLoaiSP);
	List<Loaisanpham> getListLoaiSP();
}
