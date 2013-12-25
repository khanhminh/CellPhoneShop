package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.HinhAnhSp;

public interface HinhAnhSPDAO {
	void insertHinhAnhSP(HinhAnhSp hinhSp);
	void updateHinhAnhSp(HinhAnhSp hinhSp);
	List<HinhAnhSp> getListHinhAnhSPTheoMaCTSP(Integer maChiTietSP);
}