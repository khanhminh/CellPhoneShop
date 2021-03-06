package cellphoneshop.service;

import java.util.List;

import cellphoneshop.viewmodel.ProductDetail;
import cellphoneshop.viewmodel.SortBy;
import cellphoneshop.model.ProductFilter;
import cellphoneshop.model.SanPham;

public interface SanPhamService {
	/**
	 * Them san pham moi.
	 */
	boolean insertSanPham(SanPham sp);
	
	/**
	 * Lay thong tin san pham theo Id.
	 */
	SanPham getSanPhamTheoId(Integer maSp);
	
	/**
	 * Cap nhap thong tin cua san pham.
	 */
	boolean updateSanPham(SanPham sp);
	
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
	
	/**
	 * Lay chi tiet day du cua mot san pham.
	 */
	public ProductDetail getSanPhamCungChiTietTheoId(Integer maSp);
	
	/**
	 * Lay danh sach so sanh san pham.
	 */
	public List<ProductDetail> getCompareList(List<Integer> productIdList);
	
	/**
	 * Lay cac tieu chi loc ma he thong de xuat cho nguoi dung.
	 */
	public ProductFilter layCacTieuChiLocDayDu();
	

	List<SanPham> getListSanPham(ProductFilter productFilter, int kqDauTien, int soKqToiDa, SortBy sortby);
	int demSoSanPhamKhiGetListSanPham(ProductFilter productFilter);
	
	public List<SanPham> getListSanPham(int kqDauTien, int soKqToiDa, SortBy sortby);	
	public int demSoSanPham();

	/**
	 * Lay danh sach san pham ban chay nhat.
	 */
	List<SanPham> getListSanPhamBanChayNhat(int soSanPham);
	
	List<SanPham> getListSanPhamLienQuan(Integer maSanPham);
	
	public List<SanPham> getListSanPham(String order, boolean isAsc);
	
	public void getKhuyenMaiChoSanPham(SanPham sp);
}