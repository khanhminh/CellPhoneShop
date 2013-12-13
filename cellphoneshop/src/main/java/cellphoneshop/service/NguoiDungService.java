package cellphoneshop.service;

import cellphoneshop.model.Nguoidung;

public interface NguoiDungService {
	Nguoidung getNguoidung(String email);
	Nguoidung getNguoiDung(Integer maNguoiDung);
	Boolean insertNguoidung(Nguoidung user);
	Boolean checkLogin(Nguoidung user);
}
