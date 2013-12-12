package cellphoneshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cellphoneshop.dao.ThongSoSmartphoneDAO;
import cellphoneshop.model.Thongsosmartphone;

@Service
public class ThongSoSmartphoneServiceImpl implements ThongSoSmartphoneService {

	@Autowired
	private ThongSoSmartphoneDAO tsSmartphoneDAO;

	public void insertThongSoSmartphone(Thongsosmartphone tsSmartPhone) {
		tsSmartphoneDAO.insertThongSoSmartphone(tsSmartPhone);	
	}

	public Thongsosmartphone getThongSoSmartphoneTheoMaCTSP(Long maChiTietSp) {
		return tsSmartphoneDAO.getThongSoSmartphoneTheoMaCTSP(maChiTietSp);
	}

	public void updateThongSoSmartphone(Thongsosmartphone tsSmartphone) {
		tsSmartphoneDAO.updateThongSoSmartphone(tsSmartphone);
	}
}
