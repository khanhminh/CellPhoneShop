package cellphoneshop.service;

import java.text.ParseException;

import cellphoneshop.model.NguoiDung;
import cellphoneshop.viewmodel.RegisterUser;

public interface NguoiDungService {
	NguoiDung getNguoidung(String email);
	NguoiDung getNguoiDung(Integer maNguoiDung);
	Boolean insertNguoidung(RegisterUser user);
	Boolean checkLogin(NguoiDung user);
}
