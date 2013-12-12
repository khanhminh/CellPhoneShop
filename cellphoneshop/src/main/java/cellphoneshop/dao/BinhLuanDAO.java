package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.Binhluan;

public interface BinhLuanDAO {
	void insertBinhLuan(Binhluan binhLuanMoi);
	Binhluan getBinhLuan(Long maBinhLuan);
	void updateBinhLuan(Binhluan binhLuan);
	List<Binhluan> getListBinhLuanTheoMaSP(Long maSanPham);
}
