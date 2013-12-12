package cellphoneshop.service;

import cellphoneshop.model.Thongsosmartphone;

public interface ThongSoSmartphoneService {
	void insertThongSoSmartphone(Thongsosmartphone tsSmartPhone);
	Thongsosmartphone getThongSoSmartphoneTheoMaCTSP(Long maChiTietSp);
	void updateThongSoSmartphone(Thongsosmartphone tsSmartphone);
}
