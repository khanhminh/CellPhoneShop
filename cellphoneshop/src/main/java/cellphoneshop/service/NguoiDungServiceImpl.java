package cellphoneshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.NguoidungDAO;
import cellphoneshop.model.Nguoidung;

@Service
public class NguoiDungServiceImpl implements NguoiDungService {
	@Autowired
	private NguoidungDAO nguoiDungDAO;

	public Nguoidung getNguoidung(String email) {
		return nguoiDungDAO.getNguoidung(email);
	}

	public Boolean insertNguoidung(Nguoidung user) {
		return nguoiDungDAO.insertNguoidung(user);
	}

	public Boolean checkLogin(Nguoidung user) {
		return checkLogin(user);
	}
}
