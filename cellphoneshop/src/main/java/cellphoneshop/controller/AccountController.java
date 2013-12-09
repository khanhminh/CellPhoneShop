package cellphoneshop.controller;

//import org.slf4j.Logger;
import org.apache.log4j.Logger;


import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AccountController extends ActionSupport{
	
	
	private Logger logger = Logger.getLogger(AccountController.class);
	public String login(){
		
		logger.info("Vao login Controller AccountController");
		return INPUT;
	}
	
	public String register(){
		
		logger.info("Vao register Controller AccountController");
		return INPUT;
	}
}
