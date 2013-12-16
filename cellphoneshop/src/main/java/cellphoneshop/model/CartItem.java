package cellphoneshop.model;

public class CartItem {
	private SanPham product;
	private int count;
	
	public CartItem() {
		
	}
	
	public CartItem(SanPham product, int count) {
		this.product = product;
		this.count = count;
	}

	public SanPham getProduct() {
		return product;
	}

	public void setProduct(SanPham product) {
		this.product = product;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
