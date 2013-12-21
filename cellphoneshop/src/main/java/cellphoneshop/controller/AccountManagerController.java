package cellphoneshop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.NguoiDung;
import cellphoneshop.service.NguoiDungService;
import cellphoneshop.util.Util;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AccountManagerController extends ActionSupport implements ServletRequestAware{
	
	@Autowired
	private NguoiDungService ndService;
	private HttpServletRequest request;
	private final int RecordPerPage = 10;
	
	public String listAccount(){
		int page = getPage();
		int start = (page -1) * RecordPerPage;
		List<NguoiDung> listAccount = ndService.getListNguoiDung(start, RecordPerPage);
		request.setAttribute("listAccount", listAccount);
		
		return SUCCESS;
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
