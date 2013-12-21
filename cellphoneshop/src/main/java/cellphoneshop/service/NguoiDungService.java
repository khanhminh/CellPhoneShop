package cellphoneshop.service;

import java.util.List;

import cellphoneshop.model.NguoiDung;
import cellphoneshop.viewmodel.RegisterUser;

public interface NguoiDungService {
	NguoiDung getNguoidung(String email);
	List<NguoiDung> getListNguoiDung(int ketquadautien, int soluong);
	NguoiDung getNguoiDung(Integer maNguoiDung);
	Boolean insertNguoidung(RegisterUser user);
	Boolean checkLogin(NguoiDung user);
	Boolean updateNguoidung(NguoiDung user);
	
	Boolean phanQuyenNguoiDung(Integer maNguoiDung, Integer maVaiTro);
}
