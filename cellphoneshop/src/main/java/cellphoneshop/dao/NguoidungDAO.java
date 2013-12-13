package cellphoneshop.dao;

import cellphoneshop.model.Nguoidung;

public interface NguoidungDAO {
	Nguoidung getNguoidung(String email);
	Nguoidung getNguoiDung(Integer maNguoiDung);
	Boolean insertNguoidung(Nguoidung user);
	Boolean checkLogin(Nguoidung user);
}
