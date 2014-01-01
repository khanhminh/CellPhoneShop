package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.TrangThaiDonHang;

public interface TrangThaiDonHangDAO {
	boolean insertTrangThaiDonHang(TrangThaiDonHang ttDonHang);
	TrangThaiDonHang getTrangThaiDonHang(Integer maTrangThai);
	List<TrangThaiDonHang> getListTrangThaiDonHang();
}
