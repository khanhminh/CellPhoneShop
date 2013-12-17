package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.PtGiaoHang;

public interface PTGiaoHangDAO {
	void insertPTGiaoHang(PtGiaoHang ptGiaoHang);
	PtGiaoHang getPTGiaoHang(Integer maPtGiaoHang);
	List<PtGiaoHang> getListPTGiaoHang();
}
