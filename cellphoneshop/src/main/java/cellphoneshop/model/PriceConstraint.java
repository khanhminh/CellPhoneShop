package cellphoneshop.model;

public class PriceConstraint {
	private int minPrice;
	private int maxPrice;
	
	public PriceConstraint() {
	}
	
	public PriceConstraint(int min, int max) {
		this.minPrice = min;
		this.maxPrice = max;
	}

	public String getString(){
		return minPrice + "_" + maxPrice;
	}
	
	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	
}
