package cellphoneshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.NguoiDung;
import cellphoneshop.model.VaiTro;
import cellphoneshop.service.NguoiDungService;
import cellphoneshop.service.VaiTroService;
import cellphoneshop.util.JsonHandler;
import cellphoneshop.util.Util;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AccountManagerController extends ActionSupport implements ServletRequestAware{
	
	@Autowired
	private NguoiDungService ndService;
	@Autowired
	private VaiTroService vtService;
	private HttpServletRequest request;
	private final int RecordPerPage = 10;
	private Logger logger = Logger.getLogger(AccountManagerController.class);
	
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
	
	public String processSetRole(){
		boolean result = true;
		try {
			String strId = request.getParameter("id");
			String[] roles = request.getParameterValues("role");
			int id = Integer.parseInt(strId);
			for (String role : roles){
				int r = Integer.parseInt(role);
				if (!ndService.phanQuyenNguoiDung(id, r)){
					result = false;
					break;
				}
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			result = false;
		}
		JsonHandler.writeJson(new Boolean(result));
		
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
