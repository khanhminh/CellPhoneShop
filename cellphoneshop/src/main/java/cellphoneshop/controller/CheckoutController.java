package cellphoneshop.controller;

import cellphoneshop.model.Donhang;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class CheckoutController extends ActionSupport{
	
	private Donhang donHang;
	
	public String checkout(){
		
		
		return INPUT;
	}

	public Donhang getDonHang() {
		return donHang;
	}

	public void setDonHang(Donhang donHang) {
		this.donHang = donHang;
	}
}
