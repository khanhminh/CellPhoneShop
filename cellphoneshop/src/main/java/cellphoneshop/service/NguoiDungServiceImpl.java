package cellphoneshop.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.NguoidungDAO;
import cellphoneshop.model.NguoiDung;
import cellphoneshop.model.VaiTro;
import cellphoneshop.viewmodel.RegisterUser;

@Service
public class NguoiDungServiceImpl implements NguoiDungService {
	@Autowired
	private NguoidungDAO nguoiDungDAO;
	@Autowired
	private VaiTroService vaiTroService;

	public NguoiDung getNguoidung(String email) {
		return nguoiDungDAO.getNguoidung(email);
	}
	
	public NguoiDung getNguoiDung(Integer maNguoiDung) {
		return nguoiDungDAO.getNguoiDung(maNguoiDung);
	}

	public Boolean insertNguoidung(RegisterUser user) {
		boolean result = true;
		try {
			NguoiDung nd = new NguoiDung();
		//	nd.setTenDangNhap(user.getUsername());
			nd.setMatKhau(user.getPassword());
			nd.setEmail(user.getEmail());
			nd.setHo(user.getFirstname());
			nd.setTen(user.getName());
			nd.setSoDienThoai(user.getPhone());
			nd.setDiaChi(user.getAddress());
			Integer sex = (Integer) (user.getSex().equalsIgnoreCase("Nam") ? 1 : 0);
			nd.setGioiTinh(sex);
			DateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
			nd.setNgaySinh(formater.parse(user.getBirthday()));	
			
			VaiTro vt = vaiTroService.getVaiTro("User");
			if (vt != null){
				Set<VaiTro> vaitros = new HashSet<VaiTro>();
				vaitros.add(vt);
				nd.setVaiTros(vaitros);
			}
			
			result = nguoiDungDAO.insertNguoidung(nd);
		} catch (Exception e) {
			result = false;
		}	
		
		return result;
	}

	public Boolean checkLogin(NguoiDung user) {
		return checkLogin(user);
	}

	public List<NguoiDung> getListNguoiDung(int ketquadautien, int soluong) {
		return nguoiDungDAO.getListNguoiDung(ketquadautien, soluong);
	}

	public Boolean phanQuyenNguoiDung(Integer maNguoiDung, Integer maVaiTro) {
		if(maNguoiDung == null || maVaiTro == null){
			return false;
		}
		VaiTro vaiTro = vaiTroService.getVaiTro(maVaiTro);
		NguoiDung nguoiDung = nguoiDungDAO.getNguoiDung(maNguoiDung);
		
		if(vaiTro == null || nguoiDung == null){
			return false;
		}
		
		Iterator iterator = nguoiDung.getVaiTros().iterator();
		VaiTro vt = (VaiTro) iterator.next();
		vt.setMaVaiTro(maVaiTro);
		vt.setTenVaiTro(vaiTro.getTenVaiTro());
		
		
		return nguoiDungDAO.updateNguoidung(nguoiDung);		
	}

	public Boolean updateNguoidung(NguoiDung user) {
		// TODO Auto-generated method stub
		return nguoiDungDAO.updateNguoidung(user);
	}
}
