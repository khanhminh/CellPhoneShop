package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.HeDieuHanh;

public interface HeDieuHanhDAO {
	boolean insertHeDieuHanh(HeDieuHanh hdh);
	HeDieuHanh getHeDieuHanhTheoId(Integer maHDH);
	List<HeDieuHanh> getListHeDieuHanh();
}
