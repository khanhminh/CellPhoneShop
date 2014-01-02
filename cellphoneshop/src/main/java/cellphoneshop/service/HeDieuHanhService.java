package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.HeDieuHanh;

public interface HeDieuHanhService {
	boolean insertHeDieuHanh(HeDieuHanh hdh);
	HeDieuHanh getHeDieuHanhTheoId(Integer maHDH);
	List<HeDieuHanh> getListHeDieuHanh();
}
