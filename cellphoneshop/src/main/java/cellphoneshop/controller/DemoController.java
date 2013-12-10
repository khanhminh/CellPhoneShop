package cellphoneshop.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.service.NhaSanXuatService;
import cellphoneshop.service.VaiTroService;

import com.opensymphony.xwork2.ActionSupport;

public class DemoController extends ActionSupport{
	
	/*@Autowired
	private VaiTroService vaiTroService;
	
	public String demo(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("list", vaiTroService.getListVaiTro());
		
		return SUCCESS;		
	}*/
	
	@Autowired
	private NhaSanXuatService nhaSanXuatService;
	
	public String demo(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("list", nhaSanXuatService.getListNhaSanXuat());
		
		return SUCCESS;		
	}
}
