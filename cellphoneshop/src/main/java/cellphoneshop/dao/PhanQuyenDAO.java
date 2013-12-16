package cellphoneshop.dao;

import java.util.List;

import cellphoneshop.model.VaiTro;

public interface PhanQuyenDAO {
	//List<Phanquyen> getListVaiTro();
	VaiTro getPhanQuyen(int maNguoiDung);
}
