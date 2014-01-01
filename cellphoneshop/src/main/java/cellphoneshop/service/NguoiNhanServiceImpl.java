package cellphoneshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.NguoiNhanDAO;
import cellphoneshop.model.NguoiNhan;

@Service
public class NguoiNhanServiceImpl implements NguoiNhanService{
	
	@Autowired
	private NguoiNhanDAO nguoiNhanDAO;
	

	public boolean themNguoiNhan(NguoiNhan nguoiNhan) {
		return nguoiNhanDAO.themNguoiNhan(nguoiNhan);
	}

	public NguoiNhan getNguoiNhan(Integer maNguoiDung, String tenNguoiNhan) {
		
		return nguoiNhanDAO.getNguoiNhan(maNguoiDung, tenNguoiNhan);
	}

}
