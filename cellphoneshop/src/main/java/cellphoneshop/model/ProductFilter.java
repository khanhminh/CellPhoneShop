package cellphoneshop.model;

import java.util.ArrayList;
import java.util.List;


public class ProductFilter {

	public List<NhaSanXuat> producerList = new ArrayList<NhaSanXuat>();
	public List<Float> ratingList = new ArrayList<Float>();
	public List<HeDieuHanh> osList = new ArrayList<HeDieuHanh>();
	public List<PriceConstraint> priceConstraintList = new ArrayList<PriceConstraint>();
	
	public  ProductFilter() {
	}
	
	/**
	 * Them tieu chi rang buoc ve gia san pham.
	 */
	public void addPriceConstraint(int minPrice, int maxPrice) {
		for(PriceConstraint iPc : priceConstraintList){
			if(iPc.getMinPrice() == minPrice && iPc.getMaxPrice() == maxPrice){
				return;
			}
		}
		priceConstraintList.add(new PriceConstraint(minPrice, maxPrice));
	}
	
	/**
	 * Xoa tieu chi rang buoc gia san pham.
	 */
	public void removePriceContraint(int minPrice, int maxPrice){
		for(PriceConstraint iPc : priceConstraintList){
			if(iPc.getMinPrice() == minPrice && iPc.getMaxPrice() == maxPrice){
				priceConstraintList.remove(iPc);
				break;
			}
		}
	}
	
	/**
	 * Them tieu chi he dieu hanh.
	 */
	public void addOS(HeDieuHanh os){
		if(osList.contains(os)){
			return;
		}
		
		osList.add(os);
	}
	
	/**
	 * Xoa tieu chi he dieu hanh.
	 */
	public void removeOS(HeDieuHanh os){
		if (osList.contains(os)) {
			osList.remove(os);
		}
	}
	
	/**
	 * Them tieu chi nha san xuat.
	 */
	public void addProducer(NhaSanXuat producer){
		if(producerList.contains(producer)){
			return;
		}
		
		producerList.add(producer);
	}
	
	/**
	 * Xoa tieu chi nha san xuat.
	 */
	public void removeProducer(NhaSanXuat producer){
		if(producerList.contains(producer)){
			producerList.remove(producer);
		}
	}
	
	/**
	 * Them tieu chi diem danh gia.
	 */
	public void addRating(float starMark) {
		for (Float mark : ratingList) {
			if (mark == starMark) {
				return;
			}
		}
		
		ratingList.add(starMark);
	}
	
	/**
	 * Xoa tieu chi diem danh gia.
	 */
	public void removeRating(float starMark) {
		for (Float mark : ratingList) {
			if (mark == starMark) {
				ratingList.remove(mark);
				break;
			}
		}
	}
}
