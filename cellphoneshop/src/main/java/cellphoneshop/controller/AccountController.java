package cellphoneshop.controller;

//import org.slf4j.log;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import cellphoneshop.model.NguoiDung;
import cellphoneshop.service.NguoiDungService;
import cellphoneshop.util.Message;
import cellphoneshop.util.PatternRegex;
import cellphoneshop.viewmodel.RegisterUser;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AccountController extends ActionSupport {

	private Logger log = Logger.getLogger((AccountController.class));

	@Autowired
	private NguoiDungService nguoiDungService;

	@Autowired
	private Message message;
	@Autowired
	private PatternRegex patterns;
	
	@Autowired
	@Qualifier("authenticationManager")
	private AuthenticationManager authMgr;

	private RegisterUser user;
	private List<String> errors;

	public void setRegister(RegisterUser register) {
		this.user = register;
	}
	
	public RegisterUser getRegister() {
		
		return this.user;
	}

	public String login() {
		log.info("vao trang dang nhap");
		return INPUT;
	}

	public String loginFail() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("error", true);
		log.info("dang nhap that bai");

		return ERROR;
	}

	public String register() throws UnsupportedEncodingException {
		log.info("Vao register Controller AccountController");

		HttpServletRequest request = ServletActionContext.getRequest();
		request.setCharacterEncoding("UTF-8");

		errors = new ArrayList<String>();
		if (user == null || !validateRegister()) {
			log.info("vao trang dang ky hoac du lieu nhap khon hop le");
			request.setAttribute("errors", errors);
			return INPUT;
		}

		if (nguoiDungService.insertNguoidung(user)) {
			Authentication authRequest = new UsernamePasswordAuthenticationToken(
					user.getEmail(), user.getPassword());
			Authentication authResult = authMgr.authenticate(authRequest);
			SecurityContextHolder.getContext().setAuthentication(authResult);

			user = null;
			log.info("dang ký thanh cong");
			return SUCCESS;
		} else {
			return INPUT;
		}

	}

	public String checkEmail() throws IOException {
		log.info("kiem tra email bang ajax: " + user.getEmail());
		NguoiDung ng = nguoiDungService.getNguoidung(user.getEmail());
		boolean result = ng != null ? false : true;
		returnJsonData(result);

		return "json";
	}

	private boolean validateRegister() {
		boolean result = true;
		errors = new ArrayList<String>();

		try {
			if (!user.getPassword().matches(patterns.getPattern("password"))) {
				errors.add(message.getMessageList().getProperty("errorPassword"));
				result = false;
			} else if (!user.getPassword().equals(user.getConfirm())) {
				errors.add(message.getMessageList().getProperty("mismatch"));
				result = false;
			}

			if (user.getFirstname().equals("")) {
				errors.add(message.getMessageList().getProperty("unknowFirstName"));
				result = false;
			}

			if (user.getName().equals("")) {
				errors.add(message.getMessageList().getProperty("unknowName"));
				result = false;
			}

			if (!user.getEmail().matches(patterns.getPattern("email"))) {
				errors.add(message.getMessageList().getProperty("errorEmail"));
				result = false;
			} else if (nguoiDungService.getNguoidung(user.getEmail()) != null) {
				errors.add(message.getMessageList().getProperty("duplicateEmail"));
				result = false;
			}

			if (!tryParseDate(user.getBirthday())) {
				errors.add(message.getMessageList().getProperty("errorBirthDate"));
				result = false;
			}

			if (!user.getPhone().matches(patterns.getPattern("phone"))) {
				errors.add(message.getMessageList().getProperty("errorPhoneNumber"));
				result = false;
			}

			if (user.getAddress().equals("")) {
				errors.add(message.getMessageList().getProperty("unknowAddress"));
				result = false;
			}
		} catch (Exception e) {
			log.info("du lieu dang ky khong hop le");
			result = false;
		}

		return result;
	}

	private boolean tryParseDate(String strDate) {
		boolean result = true;
		DateFormat formater = new SimpleDateFormat(patterns.getPattern("date_format"));
		try {
			formater.parse(strDate);
		} catch (Exception e) {
			result = false;
		}

		return result;
	}
	
	private void returnJsonData(Object obj){
		Gson gson = new Gson();
		String json = gson.toJson(obj);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.write(json);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			log.error("Loi tra ve json");
		}
	}
}
