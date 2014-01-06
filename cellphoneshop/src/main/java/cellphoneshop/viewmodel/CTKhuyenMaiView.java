package cellphoneshop.viewmodel;

import java.util.List;

import cellphoneshop.model.KhuyenMai;
import cellphoneshop.model.SanPham;

public class CTKhuyenMaiView {
	KhuyenMai khuyenmai;
	List<SanPham> sanphamList;
	public KhuyenMai getKhuyenmai() {
		return khuyenmai;
	}
	public void setKhuyenmai(KhuyenMai khuyenmai) {
		this.khuyenmai = khuyenmai;
	}
	public List<SanPham> getSanphamList() {
		return sanphamList;
	}
	public void setSanphamList(List<SanPham> sanphamList) {
		this.sanphamList = sanphamList;
	}
}
