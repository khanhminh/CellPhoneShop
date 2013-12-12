package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.Trangthaidonhang;

public interface TrangThaiDonHangDAO {
	void insertTrangThaiDonHang(Trangthaidonhang ttDonHang);
	Trangthaidonhang getTrangThaiDonHang(Short maTrangThai);
	List<Trangthaidonhang> getListTrangThaiDonHang();
}
