package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.Hedieuhanh;

public interface HeDieuHanhDAO {
	void insertHeDieuHanh(Hedieuhanh hdh);
	Hedieuhanh getHeDieuHanhTheoId(Short maHDH);
	List<Hedieuhanh> getListHeDieuHanh();
}
