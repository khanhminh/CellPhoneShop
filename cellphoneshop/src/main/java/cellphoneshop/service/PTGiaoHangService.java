package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.PtGiaoHang;

public interface PTGiaoHangService {
	void insertPTGiaoHang(PtGiaoHang ptGiaoHang);
	PtGiaoHang getPTGiaoHang(Integer maPtGiaoHang);
	List<PtGiaoHang> getListPTGiaoHang();
}
