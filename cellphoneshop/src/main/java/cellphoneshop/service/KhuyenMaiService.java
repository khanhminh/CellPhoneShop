package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.KhuyenMai;

public interface KhuyenMaiService {
	boolean insertKhuyenMai(KhuyenMai khuyenMai);
	KhuyenMai getKhuyenMai(Integer maKhuyenMai);
	boolean updateKhuyenMai(KhuyenMai khuyenMai);
	List<KhuyenMai> getListKhuyenMai();
	List<KhuyenMai> getListKhuyenMaiChuaDong();
}
