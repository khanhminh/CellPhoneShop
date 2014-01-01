package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.HinhAnhSp;

public interface HinhAnhSPDAO {
	boolean insertHinhAnhSP(HinhAnhSp hinhSp);
	boolean updateHinhAnhSp(HinhAnhSp hinhSp);
	List<HinhAnhSp> getListHinhAnhSPTheoMaCTSP(Integer maChiTietSP);
}