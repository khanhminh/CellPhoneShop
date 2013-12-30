package cellphoneshop.dao;

import java.util.List;

import cellphoneshop.model.KhuyenMai;

public interface KhuyenMaiDAO {
	boolean insertKhuyenMai(KhuyenMai khuyenMai);
	KhuyenMai getKhuyenMai(Integer maKhuyenMai);
	boolean updateKhuyenMai(KhuyenMai khuyenMai);
	List<KhuyenMai> getListKhuyenMai();
	List<KhuyenMai> getListKhuyenMai(Integer vitriBD, Integer soluongKM);
	List<KhuyenMai> getListKhuyenMaiChuaDong();
	Integer countKhuyenMai();
}
