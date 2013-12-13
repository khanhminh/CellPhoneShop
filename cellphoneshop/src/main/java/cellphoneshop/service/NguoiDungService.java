package cellphoneshop.service;

import java.text.ParseException;

import cellphoneshop.model.Nguoidung;
import cellphoneshop.viewmodel.RegisterUser;

public interface NguoiDungService {
	Nguoidung getNguoidung(String email);
	Nguoidung getNguoiDung(Integer maNguoiDung);
	Boolean insertNguoidung(RegisterUser user);
	Boolean checkLogin(Nguoidung user);
}
