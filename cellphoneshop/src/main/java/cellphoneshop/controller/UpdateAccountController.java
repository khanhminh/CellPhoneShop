package cellphoneshop.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import cellphoneshop.viewmodel.UpdateUser;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UpdateAccountController extends ActionSupport implements ServletRequestAware{
	Logger logger = Logger.getLogger(UpdateAccountController.class);
	private HttpServletRequest request;
	private UpdateUser user;
	
	public String updateAcccount(){
		if (user == null){
			return INPUT;			
		}
		/// test;
		logger.info(user.getName());
		
		return SUCCESS;
	}
	
	public String changePassword(){
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		
		// test
		if (currentPassword != null){
			logger.info(currentPassword);
		}
		
		return SUCCESS;
	}	
	
	
	public void setUser(UpdateUser user) {
		this.user = user;
	}
	
	public UpdateUser getUser() {
		return user;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;		
	}
}
