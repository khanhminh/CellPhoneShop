package cellphoneshop.viewmodel;

import java.util.ArrayList;
import java.util.List;

import cellphoneshop.model.CtSanPham;
import cellphoneshop.model.HinhAnhSp;
import cellphoneshop.model.SanPham;

public class ProductDetail {
	private SanPham product;
	private CtSanPham detail;
	private List<HinhAnhSp> images;
	
	public ProductDetail() {
		images = new ArrayList<HinhAnhSp>();
	}
	
	public SanPham getProduct() {
		return product;
	}
	
	public void setProduct(SanPham product) {
		this.product = product;
	}
	
	public CtSanPham getDetail() {
		return detail;
	}
	
	public void setDetail(CtSanPham detail) {
		this.detail = detail;
	}
	
	public List<HinhAnhSp> getImages() {
		return images;
	}
	
	public void setImages(List<HinhAnhSp> images) {
		this.images = images;
	}
	
	public void addImage(HinhAnhSp img) {
		if (img == null) {
			return;
		}
		
		if (!images.contains(img)) {
			images.add(img);
		}
	}
}