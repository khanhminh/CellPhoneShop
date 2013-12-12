package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.Hinhanhsp;

public interface HinhAnhSPDAO {
	void insertHinhAnhSP(Hinhanhsp hinhSp);
	void updateHinhAnhSp(Hinhanhsp hinhSp);
	List<Hinhanhsp> getListHinhAnhSPTheoMaCTSP(Long maChiTietSP);
}