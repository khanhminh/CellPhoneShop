package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.TrangThaiKhuyenMai;

public interface TrangThaiKhuyenMaiDAO {
	boolean insertTrangThaiKM(TrangThaiKhuyenMai ttkm);
	TrangThaiKhuyenMai getTrangThaiKM(Integer maTrangThaiKM);
	TrangThaiKhuyenMai getTrangThaiKM(String tenTrangThaiKM);
	List<TrangThaiKhuyenMai> getListTrangThaiKM();
}
