package cellphoneshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;




import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.DonHang;
import cellphoneshop.service.DonHangService;
import cellphoneshop.util.JsonHandler;
import cellphoneshop.util.Util;
import cellphoneshop.viewmodel.SortBy;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AdminOrderManagerController extends ActionSupport implements ServletRequestAware{
	
	private HttpServletRequest request;
	private Logger logger = Logger.getLogger(AdminOrderManagerController.class);	
	@Autowired
	private DonHangService dhService;
	
	private int status;
	private int view;
	private String sortby;
	private int page;
	
	public String listOrder(){
		
		int start = (page - 1) * view;
		List<DonHang> listOrder = 
				dhService.getListDonHang(status, getSortBy(), start, view);
		int count = dhService.demoSoDonHang(status);
		int totalPage = count / view;
		if (totalPage * view < count){
			totalPage++;
		}
		
		request.setAttribute("status", status);
		request.setAttribute("view", view);
		request.setAttribute("sortby", sortby);
		request.setAttribute("page", page);
		request.setAttribute("listOrder", listOrder);
		request.setAttribute("totalPage", totalPage);
		
		return SUCCESS;
	}
	
	public String detailOrder(){
		String strId = request.getParameter("id");
		if (Util.tryParseInt(strId)){
			int id = Integer.parseInt(strId);
			DonHang dh = dhService.getDonHangCungChiTietTheoId(id);
			if (dh != null){
				request.setAttribute("order", dh);
			}
		}
		
		return SUCCESS;
	}
	
	public String deleteOrder(){
		boolean result = true;
		try {
			String strId = request.getParameter("id");
			int id = Integer.parseInt(strId);
			result = dhService.xoaDonHang(id);
		} catch (Exception e) {
			result = false;
		}
		JsonHandler.writeJson(new Boolean(result));
		
		return "json";
	}
	
	private SortBy getSortBy(){
		SortBy sb = new SortBy();
		if (sortby != null){
			String[] params = sortby.split("_");
			if (params != null && params.length == 2){
				sb.setBy(params[0]);
				boolean asc = params[1].equalsIgnoreCase("asc") ? true : false;
				sb.setAsc(asc);
			}
		}
		
		return sb;
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;		
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void setView(int view) {
		this.view = view;
	}

	public void setSortby(String sortby) {
		this.sortby = sortby;
	}

	public void setPage(int page) {		
		this.page = page;
	}

	public int getStatus() {
		return status;
	}

	public int getView() {
		return view;
	}

	public String getSortby() {
		return sortby;
	}

	public int getPage() {
		return page;
	}	
}
