package cellphoneshop.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.PasswordEncoder;

import cellphoneshop.model.NguoiDung;
import cellphoneshop.security.SecurityHelper;
import cellphoneshop.security.UserDetailsAdapter;
import cellphoneshop.service.NguoiDungService;
import cellphoneshop.util.Message;
import cellphoneshop.viewmodel.UpdateUser;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UpdateAccountController extends ActionSupport implements
		ServletRequestAware {
	Logger log = Logger.getLogger(UpdateAccountController.class);
	private HttpServletRequest request;
	private UpdateUser user;

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private Message messages;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private SaltSource saltSource;

	private List<String> errors = new ArrayList<String>();

	public String updateAcccount() {
		errors = new ArrayList<String>();
		NguoiDung loginUser = SecurityHelper.getUser();
		//loginUser = nguoiDungService.getNguoiDung(loginUser.getMaNd());
		if (loginUser == null) {
			errors.add(messages.getMessageList().getProperty("unknowLoginUser"));
			request.setAttribute("errors", errors);
			return INPUT;
		}
		
		if (user == null) {
			request.setAttribute("loginUser", loginUser);
			log.warn("Vo ham updateAccount");
			return INPUT;
		}

		if (!validateUpdate()) {
			request.setAttribute("loginUser", loginUser);
			request.setAttribute("errors", errors);
			return INPUT;
		}

		// / test;


		String sex = user.getSex();
		if (sex.equals("Nam")) {
			loginUser.setGioiTinh(1);
		} else {
			loginUser.setGioiTinh(0);
		}

		loginUser.setDiaChi(user.getAddress());
		Date ngaysinh = ParseDate(user.getBirthday());
		if (ngaysinh == null) {
			request.setAttribute("loginUser", loginUser);
			errors.add(messages.getMessageList().getProperty("errorBirthDate"));
			request.setAttribute("errors", errors);
			return INPUT;
		}

		loginUser.setNgaySinh(ngaysinh);
		loginUser.setTen(user.getName());
		loginUser.setHo(user.getFirstname());
		loginUser.setSoDienThoai(user.getPhone());
		loginUser.setNhanTinQuaEmail(false);

		if (!nguoiDungService.updateNguoidung(loginUser)) {
			request.setAttribute("loginUser", loginUser);
			errors.add(messages.getMessageList().getProperty("updateFail"));
			request.setAttribute("errors", errors);
			return INPUT;
		}
		// errors.add(messages.getMessageList().getProperty("updateSuccess"));
		log.warn("Tai khoan " + loginUser.getEmail()
				+ " da duoc cap nhat thong tin thanh cong!");

		// Set bien isSuccess = true - thanh cong
		request.setAttribute("isSuccess", true);
		request.setAttribute("loginUser", loginUser);
		return INPUT;
	}

	public String changePassword() {
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		errors = new ArrayList<String>();

		NguoiDung loginUser = SecurityHelper.getUser();
		if (loginUser == null) {
			errors.add(messages.getMessageList().getProperty("unknowLoginUser"));
			request.setAttribute("errors", errors);
			return INPUT;
		}

		// test
		if (currentPassword == null) {
			return SUCCESS;
		}

		if (!newPassword.equals(confirmPassword)) {
			errors.add(messages.getMessageList().getProperty("mismatch"));
			request.setAttribute("errors", errors);
			return SUCCESS;
		}
		
		Object salt = saltSource.getSalt(new UserDetailsAdapter(loginUser));
		String password = passwordEncoder.encodePassword(currentPassword, salt);
		if(loginUser.getMatKhau().equals(password)){
			password = passwordEncoder.encodePassword(newPassword, salt);
			loginUser.setMatKhau(password);
			if(nguoiDungService.updateNguoidung(loginUser)){
				request.setAttribute("isSuccess", true);
				log.warn("Update thanh cong mat khau cho email: " + loginUser.getEmail());
				return SUCCESS;
				
			}else{
				 errors.add(messages.getMessageList().getProperty("updatelFailPassword"));
				 request.setAttribute("errors", errors);
				 return SUCCESS;
			}
			
		}else{
			 errors.add(messages.getMessageList().getProperty("errorCurrentPassword"));
			 request.setAttribute("errors", errors);
			 return SUCCESS;
		}
	
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

	private boolean validateUpdate() {
		boolean result = true;
		errors = new ArrayList<String>();
		try {

			if (user.getFirstname().equals("")) {
				errors.add(messages.getMessageList().getProperty(
						"unknowFirstName"));
				result = false;
			}

			if (user.getName().equals("")) {
				errors.add(messages.getMessageList().getProperty("unknowName"));
				result = false;
			}

			if (!tryParseDate(user.getBirthday())) {
				errors.add(messages.getMessageList().getProperty(
						"errorBirthDate"));
				result = false;
			}

			if (!user.getPhone().matches("^\\d{6,11}$")) {
				errors.add(messages.getMessageList().getProperty(
						"errorPhoneNumber"));
				result = false;
			}

			if (user.getAddress().equals("")) {
				errors.add(messages.getMessageList().getProperty(
						"unknowAddress"));
				result = false;
			}
		} catch (Exception e) {
			result = false;
		}

		return result;
	}

	private boolean tryParseDate(String strDate) {
		boolean result = true;
		DateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
		try {
			formater.parse(strDate);
		} catch (Exception e) {
			result = false;
		}

		return result;
	}

	public Date ParseDate(String strDate) {
		DateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
		try {
			return formater.parse(strDate);
		} catch (Exception e) {
			log.warn("Parse date is not success");
			return null;
		}
	}
}
