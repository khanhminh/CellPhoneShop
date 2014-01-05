package cellphoneshop.dao;


import cellphoneshop.model.VaiTro;

public interface PhanQuyenDAO {
	//List<Phanquyen> getListVaiTro();
	VaiTro getPhanQuyen(int maNguoiDung);
}
