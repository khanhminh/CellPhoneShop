package cellphoneshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.DonHang;
import cellphoneshop.model.NguoiDung;
import cellphoneshop.security.SecurityHelper;
import cellphoneshop.service.DonHangService;
import cellphoneshop.service.TrangThaiDonHangService;
import cellphoneshop.util.Util;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class OrderManagerController extends ActionSupport implements
		ServletRequestAware {
	private Logger logger = Logger.getLogger(OrderManagerController.class);
	private HttpServletRequest request;
	@Autowired
	private DonHangService dhService;
	@Autowired
	private TrangThaiDonHangService ttdhService;
	
	private Logger log = Logger.getLogger(OrderManagerController.class);
	
	public String listOrder(){
		NguoiDung user = SecurityHelper.getUser();
		int id = getStatus();
		List<DonHang> listOrder = new ArrayList<DonHang>();
		if (id == -1){
			listOrder = dhService.getListDonHangTheoNguoiDung(user.getMaNd());
		}
		else {
			listOrder = dhService.getListDonHangTheoNguoiDung(user.getMaNd(), id);
		}
		request.setAttribute("listOrder", listOrder);
		request.setAttribute("listStatus", ttdhService.getListTrangThaiDonHang());
		request.setAttribute("id", id);
		
		return SUCCESS;
	}
	
	public String detail(){
		String strId = request.getParameter("id");
		if (Util.tryParseInt(strId)){
			int id = Integer.parseInt(strId);
			DonHang dh = dhService.getDonHangCungChiTietTheoId(id);
			if (dh != null && 
					SecurityHelper.getUser().getMaNd().intValue() == 
					dh.getNguoiDung().getMaNd().intValue()){				
				request.setAttribute("order", dh);
			}
		}
		
		return SUCCESS;
	}
	
	public String listOrderAdmin(){
		
		return SUCCESS;
	}
	
	private int getStatus(){
		String strStatus = request.getParameter("status");
		int id = -1;
		if (Util.tryParseInt(strStatus)){
			id = Integer.parseInt(strStatus);
		}
		
		return id;
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
