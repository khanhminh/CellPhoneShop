package cellphoneshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;




import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.DonHang;
import cellphoneshop.model.NguoiNhan;
import cellphoneshop.model.PhieuGiaoHang;
import cellphoneshop.model.PtGiaoHang;
import cellphoneshop.model.PtThanhToan;
import cellphoneshop.model.TrangThaiDonHang;
import cellphoneshop.security.SecurityHelper;
import cellphoneshop.service.DonHangService;
import cellphoneshop.service.PTGiaoHangService;
import cellphoneshop.service.PTThanhToanService;
import cellphoneshop.util.JsonHandler;
import cellphoneshop.util.Message;
import cellphoneshop.util.Util;
import cellphoneshop.viewmodel.SortBy;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AdminOrderManagerController extends ActionSupport implements ServletRequestAware{
	
	private HttpServletRequest request;
	private Logger logger = Logger.getLogger(AdminOrderManagerController.class);	
	@Autowired
	private DonHangService dhService;
	@Autowired
	private Message message;
	
	private int status;
	private int view;
	private String sortby;
	private int page;
		
	private DonHang donHang;
	private List<String> errors;
	
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
			
			logger.info(SecurityHelper.getUser().getEmail() + " xoa don hang: " + strId);
		} catch (Exception e) {
			logger.error("loi xoa don hang: " + e.getMessage());
			result = false;
		}
		JsonHandler.writeJson(new Boolean(result));
		
		return "json";
	}
	
	public String editOrder(){		
		errors = new ArrayList<String>();
		if (request.getMethod().equalsIgnoreCase("get")){
			String strId = request.getParameter("id");
			if (Util.tryParseInt(strId)){
				int id = Integer.parseInt(strId);
				DonHang order = dhService.getDonHangCungChiTietTheoId(id);
				request.setAttribute("order", order);
			}
		}
		else {
			DonHang order = dhService.getDonHangCungChiTietTheoId(donHang.getMaDonHang());
			donHang.setCtDonHangs(order.getCtDonHangs());			
			request.setAttribute("order", donHang);
			if (validateOrder()){
				if (dhService.capnhatDonHang(donHang)){
					request.setAttribute("isSuccess", true);				
					logger.info(SecurityHelper.getUser().getEmail() + " cap nhat don hang: " + order.getMaDonHang());
				}
				else {
					request.setAttribute("isSuccess", false);				
					logger.info("cap nhat don hang that bai: " + order.getMaDonHang());
				}
			}
			else {
				request.setAttribute("errors", errors);
				logger.info("thong tin don hang cap nhat khong hop le ");
			}
		}
		
		return SUCCESS;
	}
	
	public String searchOrder(){
		
		return INPUT;
	}
	
	public String processSearchOrder(){
		try {
			String key = request.getParameter("query");
			String option = request.getParameter("option");
			String page = request.getParameter("page");
			int p = 1;
			if (Util.tryParseInt(page)){
				p = Integer.parseInt(page);
				p = p > 0 ? p : 1;
			}
			int start = (p - 1) * view;
			List<DonHang> listOrder = dhService.getListDonHang(key, option, start, view);
			int count = dhService.demSoDonHang(key, option);
			int totalPage = count / view;
			if (totalPage * view < count){
				totalPage++;
			}
			request.setAttribute("listOrder", listOrder);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("page", p);
		} catch (Exception e) {
			logger.error("search order fail: " + e.getMessage());
		}			
		
		return SUCCESS;
	}
	
	private boolean validateOrder(){
		try {
			if (donHang == null) {
				errors.add(message.getMessage("unknowInfo"));
				return false;
			}
			
			NguoiNhan nguoinhan = donHang.getNguoiNhan();
			if (nguoinhan == null) {
				errors.add(message.getMessage("unknowInfo"));
				return false;
			}
			if (nguoinhan.getHoTen().trim().equals("")){
				errors.add(message.getMessage("unknowFullName"));
				return false;
			}
			String phone = nguoinhan.getSoDienThoai().trim();
			if (phone.equals("") || !phone.matches("^\\d{6,11}$")){
				errors.add(message.getMessage("errorPhoneNumber"));
				return false;
			}
			if (nguoinhan.getDiaChi().trim().equals("")){
				errors.add(message.getMessage("unknowAddress"));
				return false;
			}
			
			PtGiaoHang ppgh = donHang.getPtGiaoHang();
			if (ppgh == null) {
				errors.add(message.getMessage("unknowInfo"));
				return false;
			}
			
			PtThanhToan pttt = donHang.getPtThanhToan();
			if (pttt == null) {
				errors.add(message.getMessage("unknowInfo"));
				return false;
			}
			
			TrangThaiDonHang ttdh = donHang.getTrangThaiDonHang();
			if (ttdh == null) {
				errors.add(message.getMessage("unknowInfo"));
				return false;
			}
		} catch (Exception e) {
			errors.add(message.getMessage("unknowInfo"));
			logger.error("validate order fail: " + e.getMessage());
			return false;
		}
		
		return true;
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
	
	public DonHang getDonHang() {
		return donHang;
	}

	public void setDonHang(DonHang donHang) {
		this.donHang = donHang;
	}
}
