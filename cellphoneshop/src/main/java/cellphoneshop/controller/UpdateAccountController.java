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

import cellphoneshop.model.NguoiDung;
import cellphoneshop.security.SecurityHelper;
import cellphoneshop.service.NguoiDungService;
import cellphoneshop.util.Message;
import cellphoneshop.viewmodel.UpdateUser;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UpdateAccountController extends ActionSupport implements
		ServletRequestAware {
	Logger logger = Logger.getLogger(UpdateAccountController.class);

	@Autowired
	private NguoiDungService nguoiDungService;

	private HttpServletRequest request;
	private UpdateUser user;
	private List<String> errors = new ArrayList<String>();

	@Autowired
	private Message messages;

	public String updateAcccount() {
		errors = new ArrayList<String>();
		if (user == null) {
			return INPUT;
		}

		if (!validateUpdate()) {
			request.setAttribute("errors", errors);
			return INPUT;
		}

		// / test;

		NguoiDung loginUser = SecurityHelper.getUser();
		if (loginUser == null) {
			errors.add(messages.getMessageList().getProperty("unknowLoginUser"));
			return INPUT;
		}

		String sex = user.getSex();
		if (sex.equals("name")) {
			loginUser.setGioiTinh(1);
		} else {
			loginUser.setGioiTinh(0);
		}

		loginUser.setDiaChi(user.getAddress());
		Date ngaysinh = ParseDate(user.getBirthday());
		if (ngaysinh == null) {
			errors.add(messages.getMessageList().getProperty("errorBirthDate"));
			request.setAttribute("errors", errors);
			return INPUT;
		}

		loginUser.setNgaySinh(ngaysinh);
		loginUser.setHo(user.getFirstname());
		loginUser.setSoDienThoai(user.getPhone());
		loginUser.setNhanTinQuaEmail(false);

		if (!nguoiDungService.updateNguoidung(loginUser)) {
			errors.add(messages.getMessageList().getProperty("updateFail"));
			request.setAttribute("errors", errors);
			return INPUT;
		}
		errors.add(messages.getMessageList().getProperty("updateSuccess"));
		logger.info("Tai khoan " + loginUser.getEmail()
				+ " da duoc cap nhat thong tin thanh cong!");
		request.setAttribute("errors", errors);
		return SUCCESS;
	}

	public String changePassword() {
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		// test
		if (currentPassword != null) {
			logger.info(currentPassword);
		}
		return SUCCESS;
	}

	// public String changePassword() {
	// String currentPassword = request.getParameter("currentPassword");
	// String newPassword = request.getParameter("newPassword");
	// String confirmPassword = request.getParameter("confirmPassword");
	//
	// logger.info("ChangPassword");
	//
	// return INPUT;
	//
	// errors = new ArrayList<String>();
	// NguoiDung loginUser = SecurityHelper.getUser();
	//
	// if(loginUser == null){
	// errors.add(messages.getMessageList().getProperty("unknowLoginUser"));
	// request.setAttribute("errors", errors);
	// return SUCCESS;
	// }
	//
	//
	// // test
	// if (currentPassword != null) {
	//
	// if(!newPassword.equals(confirmPassword)){
	// errors.add(messages.getMessageList().getProperty("mismatch"));
	// request.setAttribute("errors", errors);
	// return SUCCESS;
	// }
	//
	//
	// NguoiDung nd = new NguoiDung();
	// nd.setMatKhau(currentPassword);
	// try {
	// String password = nguoiDungService.encodePassword(nd);
	//
	// if(loginUser.getMatKhau().equals(password)){
	//
	// loginUser.setMatKhau(newPassword);
	// password = nguoiDungService.encodePassword(loginUser);
	// loginUser.setMatKhau(password);
	//
	// if(nguoiDungService.updateNguoidung(loginUser)){
	//
	// logger.info("Update thanh cong mat khau cho email: " +
	// loginUser.getEmail());
	// errors.add(messages.getMessageList().getProperty("updatePasswordSuccess"));
	// request.setAttribute("errors", errors);
	// return SUCCESS;
	//
	// }else{
	//
	// errors.add(messages.getMessageList().getProperty("updatelFailPassword"));
	// request.setAttribute("errors", errors);
	// return SUCCESS;
	//
	// }
	// }else{
	//
	// errors.add(messages.getMessageList().getProperty("errorCurrentPassword"));
	// request.setAttribute("errors", errors);
	// return SUCCESS;
	//
	// }
	// } catch (Exception e) {
	// logger.error("EncodePassword: " + e.getMessage());
	// return SUCCESS;
	// }
	// }

	// return SUCCESS;

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
			logger.error("Parse date is not success");
			return null;
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
}
