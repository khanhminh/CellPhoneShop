package cellphoneshop.service;

import java.util.List;
import cellphoneshop.model.DanhSachMongMuon;
import cellphoneshop.model.NguoiDung;
import cellphoneshop.model.SanPham;

public interface DSMongMuonService {
	void insertDanhSachMongMuon(NguoiDung nguoiDung, List<SanPham> dsSanPham);
	void insertDSMongMuon(DanhSachMongMuon dsmm);
	List<DanhSachMongMuon> getListDSMongMuon(Integer maNguoiDung);
	DanhSachMongMuon getDSMongMuon(Integer maDSMongMuon);
}