package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.Trangthaidonhang;

public interface TrangThaiDonHangService {
	void insertTrangThaiDonHang(Trangthaidonhang ttDonHang);
	Trangthaidonhang getTrangThaiDonHang(Short maTrangThai);
	List<Trangthaidonhang> getListTrangThaiDonHang();
}
