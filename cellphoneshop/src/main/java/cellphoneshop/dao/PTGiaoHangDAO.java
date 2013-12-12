package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.Ptgiaohang;

public interface PTGiaoHangDAO {
	void insertPTGiaoHang(Ptgiaohang ptGiaoHang);
	Ptgiaohang getPTGiaoHang(Short maPtGiaoHang);
	List<Ptgiaohang> getListPTGiaoHang();
}
