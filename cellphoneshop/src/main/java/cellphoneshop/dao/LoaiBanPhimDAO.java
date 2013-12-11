package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.Loaibanphim;

public interface LoaiBanPhimDAO {
	void insertLoaiBanPhim(Loaibanphim loaiBP);
	Loaibanphim getLoaiBanPhimTheoId(Short maLoaiBP);
	List<Loaibanphim> getListLoaiBanPhim();
}
