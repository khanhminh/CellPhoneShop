package cellphoneshop.dao;

import cellphoneshop.model.NguoiDung;

public interface NguoidungDAO {
	NguoiDung getNguoidung(String email);
	NguoiDung getNguoiDung(Integer maNguoiDung);
	Boolean insertNguoidung(NguoiDung user);
	Boolean checkLogin(NguoiDung user);
}
