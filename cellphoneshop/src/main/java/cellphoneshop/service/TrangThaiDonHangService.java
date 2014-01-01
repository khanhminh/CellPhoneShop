package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.TrangThaiDonHang;

public interface TrangThaiDonHangService {
	boolean insertTrangThaiDonHang(TrangThaiDonHang ttDonHang);
	TrangThaiDonHang getTrangThaiDonHang(Integer maTrangThai);
	List<TrangThaiDonHang> getListTrangThaiDonHang();
}
