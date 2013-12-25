package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.HinhAnhSp;

public interface HinhAnhSPService {
	void insertHinhAnhSP(HinhAnhSp hinhSp);
	void updateHinhAnhSp(HinhAnhSp hinhSp);
	
	/**
	 * Lay danh sach hinh sanh cua san pham theo ma chi tiet san pham.
	 */
	List<HinhAnhSp> getListHinhAnhSPTheoMaCTSP(Integer maChiTietSP);
}
