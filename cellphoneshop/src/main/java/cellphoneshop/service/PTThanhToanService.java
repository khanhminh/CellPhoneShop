package cellphoneshop.service;

import java.util.List;

import cellphoneshop.model.PtThanhToan;

public interface PTThanhToanService {
	boolean insertPTThanhToan(PtThanhToan ptThanhToan);
	PtThanhToan getPTThanhToanTheoId(Integer maPtThanhToan);
	List<PtThanhToan> getListPTThanhToan();

}
