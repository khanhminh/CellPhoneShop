package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.PtGiaoHang;

public interface PTGiaoHangDAO {
	boolean insertPTGiaoHang(PtGiaoHang ptGiaoHang);
	PtGiaoHang getPTGiaoHang(Integer maPtGiaoHang);
	List<PtGiaoHang> getListPTGiaoHang();
}
