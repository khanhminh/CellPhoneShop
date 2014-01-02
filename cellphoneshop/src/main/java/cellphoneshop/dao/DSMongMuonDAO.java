package cellphoneshop.dao;

import java.util.List;
import cellphoneshop.model.DanhSachMongMuon;

public interface DSMongMuonDAO {
	boolean insertDSMongMuon(DanhSachMongMuon dsmm);
	List<DanhSachMongMuon> getListDSMongMuon(Integer maNguoiDung);
	DanhSachMongMuon getDSMongMuon(Integer maDSMongMuon);
}
