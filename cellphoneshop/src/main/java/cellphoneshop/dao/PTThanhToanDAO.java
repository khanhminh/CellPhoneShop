package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.PtThanhToan;

public interface PTThanhToanDAO {
	boolean insertPTThanhToan(PtThanhToan ptThanhToan);
	PtThanhToan getPTThanhToanTheoId(Integer maPtThanhToan);
	List<PtThanhToan> getListPTThanhToan();
}