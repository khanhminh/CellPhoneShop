package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.TrangThaiDonHang;

public interface TrangThaiDonHangService {
	void insertTrangThaiDonHang(TrangThaiDonHang ttDonHang);
	TrangThaiDonHang getTrangThaiDonHang(Integer maTrangThai);
	List<TrangThaiDonHang> getListTrangThaiDonHang();
}
