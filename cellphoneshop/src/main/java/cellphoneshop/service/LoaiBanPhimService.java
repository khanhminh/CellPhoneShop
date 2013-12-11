package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.Loaibanphim;

public interface LoaiBanPhimService {
	void insertLoaiBanPhim(Loaibanphim loaiBP);
	Loaibanphim getLoaiBanPhimTheoId(Short maLoaiBP);
	List<Loaibanphim> getListLoaiBanPhim();
}
