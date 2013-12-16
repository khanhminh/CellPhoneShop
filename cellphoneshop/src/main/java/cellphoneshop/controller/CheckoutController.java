package cellphoneshop.controller;

import cellphoneshop.model.DonHang;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class CheckoutController extends ActionSupport{
	
	private DonHang donHang;
	
	public String checkout(){
		
		
		return INPUT;
	}

	public DonHang getDonHang() {
		return donHang;
	}

	public void setDonHang(DonHang donHang) {
		this.donHang = donHang;
	}
}
