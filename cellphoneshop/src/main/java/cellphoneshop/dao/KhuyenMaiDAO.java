package cellphoneshop.dao;

import java.util.List;

import cellphoneshop.model.KhuyenMai;

public interface KhuyenMaiDAO {
	boolean insertKhuyenMai(KhuyenMai khuyenMai);
	KhuyenMai getKhuyenMai(Integer maKhuyenMai);
	boolean updateKhuyenMai(KhuyenMai khuyenMai);
	List<KhuyenMai> getListKhuyenMai();
	List<KhuyenMai> getListKhuyenMai(Integer vitriBD, Integer soluongKM);
	List<KhuyenMai> getListKhuyenMai(String query, String option, Integer vitriBD, Integer soluongKM);
	List<KhuyenMai> getListKhuyenMai(String value, String option);
	List<KhuyenMai> getListKhuyenMaiChuaDong();
	Integer countKhuyenMai();
	Integer countKhuyenMail(String query, String option);
	void updateKhuyenMaiTable();
}
