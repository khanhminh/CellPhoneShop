package cellphoneshop.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.NguoidungDAO;
import cellphoneshop.model.Nguoidung;
import cellphoneshop.viewmodel.RegisterUser;

@Service
public class NguoiDungServiceImpl implements NguoiDungService {
	@Autowired
	private NguoidungDAO nguoiDungDAO;

	public Nguoidung getNguoidung(String email) {
		return nguoiDungDAO.getNguoidung(email);
	}
	
	public Nguoidung getNguoiDung(Integer maNguoiDung) {
		return nguoiDungDAO.getNguoiDung(maNguoiDung);
	}

	public Boolean insertNguoidung(RegisterUser user) {
		boolean result = true;
		try {
			Nguoidung nd = new Nguoidung();
			nd.setTenDangNhap(user.getUsername());
			nd.setMatKhau(user.getPassword());
			nd.setEmail(user.getEmail());
			nd.setHo(user.getFirstname());
			nd.setTen(user.getName());
			nd.setSoDienThoai(user.getPhone());
			nd.setDiaChi(user.getAddress());
			short sex = (short) (user.getSex().equalsIgnoreCase("Nam") ? 1 : 0);
			nd.setGioiTinh(sex);
			DateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
			nd.setNgaySinh(formater.parse(user.getBirthday()));	
			
			/*Set<>
			nd.setVaitros(new HashSet<E>());*/
			
			result = nguoiDungDAO.insertNguoidung(nd);
		} catch (Exception e) {
			result = false;
		}	
		
		return result;
	}

	public Boolean checkLogin(Nguoidung user) {
		return checkLogin(user);
	}
}
