package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.Hedieuhanh;

public interface HeDieuHanhService {
	void insertHeDieuHanh(Hedieuhanh hdh);
	Hedieuhanh getHeDieuHanhTheoId(Short maHDH);
	List<Hedieuhanh> getListHeDieuHanh();
}
