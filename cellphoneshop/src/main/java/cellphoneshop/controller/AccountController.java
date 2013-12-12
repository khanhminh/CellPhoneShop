package cellphoneshop.controller;

//import org.slf4j.Logger;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.Nguoidung;
import cellphoneshop.service.NguoiDungService;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AccountController extends ActionSupport {

	private Logger logger = Logger.getLogger(AccountController.class);
	
	@Autowired
	NguoiDungService nguoiDungService;

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
		if(request.getParameter("username") == null || request.getParameter("username").equals("")){
			return INPUT;
		}
		
		Nguoidung user = new Nguoidung();
		String comformPassword = request.getParameter("confirm");

		user.setTenDangNhap(request.getParameter("username"));
		user.setMatKhau(request.getParameter("password"));
		user.setHo(request.getParameter("ho"));
		user.setTen(request.getParameter("ten"));
		user.setEmail(request.getParameter("email"));
		//request.getParameter("dob")
		user.setNgaySinh(new Date());
		user.setSoDienThoai(request.getParameter("phone"));
		user.setDiaChi(request.getParameter("address"));
		String sex = request.getParameter("sex");

		if (sex.equals("") && sex != null) {
			if (sex.equals("nam")) {
				user.setGioiTinh(Short.valueOf("1"));
			} else {
				user.setGioiTinh(Short.valueOf("0"));
			}
		}
		
		if(nguoiDungService.insertNguoidung(user)){
			return SUCCESS;
		}else{
			return ERROR;
		}
		
	}
	

	
}
