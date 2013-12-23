package cellphoneshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.NguoiDung;
import cellphoneshop.model.VaiTro;
import cellphoneshop.security.SecurityHelper;
import cellphoneshop.service.NguoiDungService;
import cellphoneshop.service.VaiTroService;
import cellphoneshop.util.JsonHandler;
import cellphoneshop.util.Util;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AccountManagerController extends ActionSupport implements ServletRequestAware{
	
	private static final int Success = 1;
	private static final int Error = -1;
	private static final int NoAccess = 0;
	
	@Autowired
	private NguoiDungService ndService;
	@Autowired
	private VaiTroService vtService;
	private HttpServletRequest request;
	private final int RecordPerPage = 10;
	private Logger log = Logger.getLogger(AccountManagerController.class);
	
	public String listAccount(){
		int page = getPage();
		int start = (page - 1) * RecordPerPage;
		List<NguoiDung> listAccount = ndService.getListNguoiDung(start, RecordPerPage);
		request.setAttribute("listAccount", listAccount);
		
		return SUCCESS;
	}
	
	public String setRole() {		
		String strId = request.getParameter("id");
		if (Util.tryParseInt(strId)){
			int id = Integer.parseInt(strId);
			NguoiDung account = ndService.getNguoiDung(id);
			if (account != null){				
				request.setAttribute("account", account);
			}
		}
		List<VaiTro> listRole = vtService.getListVaiTro();
		request.setAttribute("listRole", listRole);		
		
		return SUCCESS;
	}
	
	public String detailAccount(){
		String strId = request.getParameter("id");
		if (Util.tryParseInt(strId)){
			int id = Integer.parseInt(strId);
			NguoiDung account = ndService.getNguoiDung(id);
			if (account != null){				
				request.setAttribute("account", account);
			}
		}
		
		return SUCCESS;
	}
	
	public String processSetRole(){
		int result = Success;
		try {
			String strId = request.getParameter("id");
			String[] roles = request.getParameterValues("role");
			String[] unroles = request.getParameterValues("unrole");
			int id = Integer.parseInt(strId);
			NguoiDung admin = SecurityHelper.getUser();
			if (admin.getMaNd() == id) {
				// khong the phan quyen tu phan quyen
				result = NoAccess;
			}
			else {
				if (roles != null){
					for (String role : roles){
						int r = Integer.parseInt(role);
						if (!ndService.phanQuyenNguoiDung(id, r)){
							result = Error;
							break;
						}
					}
				}
				if (unroles != null){
					for (String role : unroles){
						int r = Integer.parseInt(role);
						if (!ndService.huyVaiTroNguoiDung(id, r)){
							result = Error;
							break;
						}
					}
				}
			}			
			
		} catch (Exception e) {
			log.error(e.getMessage());
			result = Error;
		}
		JsonHandler.writeJson(result);
		
		return "json";
	}
	
	public String lockAccount(){
		int result = Success;
		try {
			String action = request.getParameter("action");
			String strId = request.getParameter("id");
			int id = Integer.parseInt(strId);
			if (id == SecurityHelper.getUser().getMaNd().intValue()){
				result = NoAccess;
			}
			else if (action.equals("lock")){
				result = ndService.capNhatTrangThaiNguoiDung(id, true) ? Success : Error;
			}
			else if (action.equals("unlock")){
				result = ndService.capNhatTrangThaiNguoiDung(id, false) ? Success : Error;
			}
			else {
				result = Error;
			}
		} catch (Exception e) {
			result = Error;
			log.error(e.getMessage());
		}
		JsonHandler.writeJson(result);
		
		return "json";
	}

	private int getPage(){
		String strPage = request.getParameter("page");
		int page = 1;
		if (Util.tryParseInt(strPage)){
			page = Integer.parseInt(strPage);
		}
		
		return page > 0 ? page : 1;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;		
	}
}
