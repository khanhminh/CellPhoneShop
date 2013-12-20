package cellphoneshop.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.TrangThaiKhuyenMaiDAO;
import cellphoneshop.model.TrangThaiKhuyenMai;

@Service
public class TrangThaiKhuyenMaiServiceImpl implements TrangThaiKhuyenMaiService {
	@Autowired
	private TrangThaiKhuyenMaiDAO ttkmDAO;

	public boolean insertTrangThaiKM(TrangThaiKhuyenMai ttkm) {
		return ttkmDAO.insertTrangThaiKM(ttkm);
	}

	public TrangThaiKhuyenMai getTrangThaiKM(Integer maTrangThaiKM) {
		return ttkmDAO.getTrangThaiKM(maTrangThaiKM);
	}

	public TrangThaiKhuyenMai getTrangThaiKM(String tenTrangThaiKM) {
		return ttkmDAO.getTrangThaiKM(tenTrangThaiKM);
	}

	public List<TrangThaiKhuyenMai> getListTrangThaiKM() {
		return ttkmDAO.getListTrangThaiKM();
	}
}
