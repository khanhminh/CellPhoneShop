package cellphoneshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.CartItem;
import cellphoneshop.model.DonHang;
import cellphoneshop.model.NguoiDung;
import cellphoneshop.model.PtGiaoHang;
import cellphoneshop.model.PtThanhToan;
import cellphoneshop.security.SecurityHelper;
import cellphoneshop.service.DonHangService;
import cellphoneshop.service.PTGiaoHangService;
import cellphoneshop.service.PTThanhToanService;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class CheckoutController extends ActionSupport implements ServletRequestAware{
	
	@Autowired
	private PTGiaoHangService ptghService;
	@Autowired
	private PTThanhToanService ptttService;
	@Autowired
	private DonHangService donHangService;
	
	private Logger log = Logger.getLogger(CheckoutController.class);
	
	private static final String EMPTY = "empty";
	
	private HttpServletRequest request;
	
	private DonHang donHang;
	
	@SuppressWarnings("unchecked")
	public String checkout(){
		HttpSession session = request.getSession();
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()){
			return EMPTY;
		}
		
		List<PtGiaoHang> ptgh = ptghService.getListPTGiaoHang();
		List<PtThanhToan> pttt = ptttService.getListPTThanhToan();
		request.setAttribute("ptgh", ptgh);
		request.setAttribute("pttt", pttt);
		
		if (donHang != null){
			try {
				NguoiDung nguoiDung = SecurityHelper.getUser();			
				int id = donHangService.checkOut(nguoiDung.getMaNd(), cart, donHang);
				session.removeAttribute("cart");
				request.setAttribute("orderId", id);
				donHang = null;
				
				return SUCCESS;
			} catch (Exception e) {
				return ERROR;
			}
		}
		
		return INPUT;
	}

	public DonHang getDonHang() {
		return donHang;
	}

	public void setDonHang(DonHang donHang) {
		this.donHang = donHang;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
