package cellphoneshop.controller;

//import org.slf4j.Logger;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ExceptionDepthComparator;

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
		
		//Show register form
		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		if(username == null || username.equals("")){
			return INPUT;
		}
	
		Nguoidung user = new Nguoidung();

		user.setTenDangNhap(request.getParameter("username"));
		user.setMatKhau(request.getParameter("password"));
		if(user.getMatKhau() == null || user.getMatKhau().equals("")){
			return INPUT;
		}
		String comformPassword = request.getParameter("confirm");
		if(comformPassword == null || comformPassword.equals("")){
			return INPUT;
		}
		
		
		//Not match with retype password
		if(!user.getMatKhau().equals(comformPassword)){
			return INPUT;
		}
		
		user.setHo(request.getParameter("ho"));
		if(user.getHo() == null || user.getHo().equals("")){
			return INPUT;
		}
		
		
		user.setTen(request.getParameter("ten"));
		if(user.getTen() == null || user.getTen().equals("")){
			return INPUT;
		}
		
		user.setEmail(request.getParameter("email"));
		if(user.getEmail() == null || user.getEmail().equals("")){
			return INPUT;
		}
		
		//request.getParameter("dob")
		try {
			//Date ngaysinh = dateFormat.parse(request.getParameter("birthday"));
			//user.setNgaySinh(ngaysinh);
			user.setNgaySinh(new Date());
		} catch (Exception e) {
			// TODO: handle exception
			logger.info("String date didn't be correct format");
			return INPUT;
		}
		
		
		
		
		user.setSoDienThoai(request.getParameter("phone"));
		if(user.getSoDienThoai() == null || user.getSoDienThoai().equals("")){
			return INPUT;
		}
		//Check phone number
		String patternPhone = "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]";
		if(!user.getSoDienThoai().matches(patternPhone)){
			return INPUT;
		}
		
		
		user.setDiaChi(request.getParameter("address"));
		if(user.getDiaChi() == null || user.getDiaChi().equals("")){
			return INPUT;
		}
		
		String sex = request.getParameter("sex");
		if (sex.equals("") && sex != null) {
			if (sex.equals("nam")) {
				user.setGioiTinh(Short.valueOf("1"));
			} else {
				user.setGioiTinh(Short.valueOf("0"));
			}
		}else{
			user.setGioiTinh(Short.valueOf("0"));
		}
		
		
		if(nguoiDungService.insertNguoidung(user)){
			return SUCCESS;
		}else{
			return INPUT;
		}
		
	}
}
