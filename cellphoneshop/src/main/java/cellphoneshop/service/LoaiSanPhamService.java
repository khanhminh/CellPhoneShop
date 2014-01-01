package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.LoaiSanPham;

public interface LoaiSanPhamService {
	boolean insertLoaiSP(LoaiSanPham loaiSP);
	LoaiSanPham getLoaiSPTheoId(Integer maLoaiSP);
	List<LoaiSanPham> getListLoaiSP();
}
