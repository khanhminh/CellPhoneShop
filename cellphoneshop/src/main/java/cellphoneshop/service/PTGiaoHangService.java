package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.Ptgiaohang;

public interface PTGiaoHangService {
	void insertPTGiaoHang(Ptgiaohang ptGiaoHang);
	Ptgiaohang getPTGiaoHang(Short maPtGiaoHang);
	List<Ptgiaohang> getListPTGiaoHang();
}
