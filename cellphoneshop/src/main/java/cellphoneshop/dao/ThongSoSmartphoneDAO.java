package cellphoneshop.dao;

import cellphoneshop.model.Thongsosmartphone;

public interface ThongSoSmartphoneDAO {
	void insertThongSoSmartphone(Thongsosmartphone tsSmartPhone);
	Thongsosmartphone getThongSoSmartphoneTheoMaCTSP(Long maChiTietSp);
	void updateThongSoSmartphone(Thongsosmartphone tsSmartphone);
}
