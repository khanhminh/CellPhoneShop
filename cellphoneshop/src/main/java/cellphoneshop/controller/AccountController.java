package cellphoneshop.controller;

//import org.slf4j.Logger;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;



import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AccountController extends ActionSupport{
	
	
	private Logger logger = Logger.getLogger(AccountController.class);
	public String login(){
		
		logger.info("Vao login Controller AccountController");
		return INPUT;
	}
	
	public String loginFail(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("error", true);
		
		return ERROR;
	}
	
	public String register(){
		
		logger.info("Vao register Controller AccountController");
		return INPUT;
	}
}
