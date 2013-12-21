package cellphoneshop.dao;

import java.util.List;

import cellphoneshop.model.NguoiDung;

public interface NguoidungDAO {
	NguoiDung getNguoidung(String email);
	List<NguoiDung> getListNguoiDung();
	NguoiDung getNguoiDung(Integer maNguoiDung);
	Boolean insertNguoidung(NguoiDung user);
	Boolean updateNguoidung(NguoiDung user);
	Boolean checkLogin(NguoiDung user);
	
	
}
