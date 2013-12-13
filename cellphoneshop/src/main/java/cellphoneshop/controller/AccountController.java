package cellphoneshop.controller;

//import org.slf4j.Logger;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.service.NguoiDungService;


import cellphoneshop.viewmodel.RegisterUser;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AccountController extends ActionSupport {

	private Logger logger = Logger.getLogger(AccountController.class);	
	
	@Autowired
	private NguoiDungService nguoiDungService;
	private RegisterUser user;
	private List<String> errors;
	
	public RegisterUser getRegister() {
		return user;
	}

	public void setRegister(RegisterUser register) {
		this.user = register;
	}

	public String login() {

		logger.info("Vao login Controller AccountController");
		return INPUT;
	}

	public String loginFail() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("error", true);

		return ERROR;
	}

	public String register() throws UnsupportedEncodingException {		
		logger.info("Vao register Controller AccountController");
		
		HttpServletRequest request = ServletActionContext.getRequest();		
		request.setCharacterEncoding("UTF-8");
		
		errors = new ArrayList<String>();
		if (user == null || !validateRegister()){
			request.setAttribute("errors", errors);
			return INPUT;
		}
				
		if(nguoiDungService.insertNguoidung(user)){
			return SUCCESS;
		}
		else{
			return INPUT;
		}
		
	}
	
	private boolean validateRegister(){
		boolean result = true;
		errors = new ArrayList<String>();
		
		if (!user.getUsername().matches("^.{6,20}$")){
			errors.add("Tên đăng nhập không hợp lệ");
			result = false;
		} else {
			//errors.add("");
		}
		
		if (!user.getPassword().matches("^.{6,20}$")){
			errors.add("Mật khẩu không hợp lệ");
			result = false;
		} 
		else if (!user.getPassword().equals(user.getConfirm())) {
			errors.add("Mật khẩu không khớp");
			result = false;
		}
		
		if (user.getFirstname().equals("")){
			errors.add("Vui lòng nhập họ");
			result = false;
		}
		
		if (user.getName().equals("")){
			errors.add("Vui lòng nhập tên");
			result = false;
		}
		
		if (!user.getEmail()
				.matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")){
			errors.add("Địa chỉ email không hợp lệ");
			result = false;						
		} 
		else if (nguoiDungService.getNguoidung(user.getEmail()) != null) {
			errors.add("Địa chỉ email đã được sử dụng");
			result = false;
		}
		
		if (!tryParseDate(user.getBirthday())){
			errors.add("Ngày sinh không hợp lệ");
			result = false;
		}
		
		if (!user.getPhone().matches("^\\d{6,11}$")){
			errors.add("Số điện thoại không hợp lệ");
			result = false;
		}
		
		if (user.getAddress().equals("Vui lòng nhập địa chỉ")){
			errors.add("");
			result = false;
		}
		
		return result;
	}
	
	private boolean tryParseDate(String strDate){
		boolean result = true;
		DateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
		try {
			formater.parse(strDate);
		} catch (Exception e) {
			result = false;
		}
		
		return result;
	}
}
