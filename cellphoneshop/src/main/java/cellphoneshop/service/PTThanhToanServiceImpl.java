package cellphoneshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.PTThanhToanDAO;
import cellphoneshop.model.PtThanhToan;

@Service
public class PTThanhToanServiceImpl implements PTThanhToanService {
	@Autowired
	private PTThanhToanDAO ptThanhToanDAO;

	public void insertPTThanhToan(PtThanhToan ptThanhToan) {
		ptThanhToanDAO.insertPTThanhToan(ptThanhToan);

	}

	public PtThanhToan getPTThanhToanTheoId(Integer maPtThanhToan) {

		return ptThanhToanDAO.getPTThanhToanTheoId(maPtThanhToan);
	}

	public List<PtThanhToan> getListPTThanhToan() {
		return ptThanhToanDAO.getListPTThanhToan();
	}

}
