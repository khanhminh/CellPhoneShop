package cellphoneshop.service;

import java.util.List;

import cellphoneshop.model.ProductDetail;
import cellphoneshop.model.SanPham;

public interface SanPhamService {
	/**
	 * Them san pham moi
	 */
	void insertSanPham(SanPham sp);
	
	/**
	 * Lay thong tin san pham theo Id
	 */
	SanPham getSanPhamTheoId(Integer maSp);
	
	void updateSanPham(SanPham sp);
	
	/**
	 * Lay danh sach san pham moi trong tuan co phan trang.
	 */
	List<SanPham> getListSanPhamMoiTrongTuan(int ketQuaDauTien, int soKetQuaToiDa);
	
	/**
	 * Dem so luong tat ca san pham moi them trong tuan.
	 */
	int demSoSanPhamMoiTrongTuan();
	
	/**
	 * Lay danh sach san pham moi trong thang co phan trang.
	 */
	List<SanPham> getListSanPhamMoiTrongThang(int ketQuaDauTien, int soKetQuaToiDa);
	
	
	/**
	 * Dem so luong tat ca san pham moi them trong thang.
	 */
	int demSoSanPhamMoiTrongThang();
	
	
	
	/**
	 * Tim kiem san pham theo ten. Xem them {@link #demSoSanPhamKhiTimKiemTheoTen(String)}
	 */
	List<SanPham> timKiemSanPhamTheoTen(String tuKhoa, int kqDauTien, int soKqToiDa);
	
	/**
	 * Dem tat ca ket qua tim kiem theo ten.
	 */
	long demSoSanPhamKhiTimKiemTheoTen(String tuKhoa);
	
	/**
	 * Lay san pham theo loai, sap xep the 1 tieu chi nao do
	 * @param maloai
	 * @param positionStart
	 * @param amount
	 * @param qualification
	 * @param sortStyle
	 * @return
	 */
	List<SanPham> getListSanPhamTheoLoai(Integer maloai, Integer positionStart, Integer amount, String qualification, boolean isAsc);
	
	public ProductDetail getSanPhamCungChiTietTheoId(Integer maSp);
	
	public List<ProductDetail> getCompareList(List<Integer> productIdList);
}