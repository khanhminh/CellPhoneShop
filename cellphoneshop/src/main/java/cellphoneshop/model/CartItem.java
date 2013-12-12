package cellphoneshop.model;

public class CartItem {
	private Sanpham product;
	private int count;
	
	public CartItem() {
		
	}
	
	public CartItem(Sanpham product, int count) {
		this.product = product;
		this.count = count;
	}

	public Sanpham getProduct() {
		return product;
	}

	public void setProduct(Sanpham product) {
		this.product = product;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
