package cellphoneshop.service;

import java.util.List;

import cellphoneshop.model.KhuyenMai;

public interface KhuyenMaiService {
	boolean insertKhuyenMai(KhuyenMai khuyenMai);
	KhuyenMai getKhuyenMai(Integer maKhuyenMai);
	boolean updateKhuyenMai(KhuyenMai khuyenMai);
	List<KhuyenMai> getListKhuyenMai();
	List<KhuyenMai> getListKhuyenMaiChuaDong();
	List<KhuyenMai> getListKhuyenMai(Integer vitriBD, Integer soluongKM);
	List<KhuyenMai> getListKhuyenMail(String query, String option, Integer vitriBD, Integer soluongKM);
	Integer countKhuyenMai();
	Integer countKhuyenMail(String query, String option);
}
