package cellphoneshop.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.DSMongMuonDAO;
import cellphoneshop.model.DanhSachMongMuon;
import cellphoneshop.model.NguoiDung;
import cellphoneshop.model.SanPham;

@Service
public class DSMongMuonServiceImpl implements DSMongMuonService {
	@Autowired DSMongMuonDAO dsmmDAO;

	public boolean insertDanhSachMongMuon(NguoiDung nguoiDung, List<SanPham> dsSanPham) {
		DanhSachMongMuon dsMongMuon = new DanhSachMongMuon(nguoiDung);
		Date ngayTao = new Date();
		dsMongMuon.setNgayTao(ngayTao);
		
		for (SanPham sp : dsSanPham) {
			dsMongMuon.getSanPhams().add(sp);
		}
		
		return insertDSMongMuon(dsMongMuon);
	}

	public boolean insertDSMongMuon(DanhSachMongMuon dsmm) {
		return dsmmDAO.insertDSMongMuon(dsmm);	
	}

	public List<DanhSachMongMuon> getListDSMongMuon(Integer maNguoiDung) {
		return dsmmDAO.getListDSMongMuon(maNguoiDung);
	}

	public DanhSachMongMuon getDSMongMuon(Integer maDSMongMuon) {
		return dsmmDAO.getDSMongMuon(maDSMongMuon);
	}
}
