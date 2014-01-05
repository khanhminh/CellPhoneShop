package cellphoneshop.service;

import java.util.List;

import cellphoneshop.model.KhuyenMai;
import cellphoneshop.viewmodel.CTKhuyenMaiView;

public interface KhuyenMaiService {
	boolean insertKhuyenMai(KhuyenMai khuyenMai);
	KhuyenMai getKhuyenMai(Integer maKhuyenMai);
	boolean updateKhuyenMai(KhuyenMai khuyenMai);
	List<KhuyenMai> getListKhuyenMai();
	List<KhuyenMai> getListKhuyenMaiChuaDong();
	List<KhuyenMai> getListKhuyenMai(Integer vitriBD, Integer soluongKM);
	List<KhuyenMai> getListKhuyenMai(String query, String option, Integer vitriBD, Integer soluongKM);
	Integer countKhuyenMai();
	Integer countKhuyenMai(String query, String option);
	boolean ApdungKhuyenMaiChoSanPham(Integer masP, Integer maKm);
	boolean HuyApDungKhuyenMaiChoSanPham(Integer masP, Integer maKm);
	List<CTKhuyenMaiView> getListCTKhuyenMai();
	List<KhuyenMai> getKhuyenMaiDangDienRa(Integer maSP);
	List<CTKhuyenMaiView> getListCTKhuyenMai(String query, String option);
}
