package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.Hinhanhsp;

public interface HinhAnhSPService {
	void insertHinhAnhSP(Hinhanhsp hinhSp);
	void updateHinhAnhSp(Hinhanhsp hinhSp);
	
	/**
	 * Lay danh sach hinh sanh cua san pham theo ma chi tiet san pham.
	 */
	List<Hinhanhsp> getListHinhAnhSPTheoMaCTSP(Long maChiTietSP);
}
