package cellphoneshop.controller;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ActionSupport;

public class SaleOfController extends ActionSupport implements ServletRequestAware{
	private File myFile;
	private String myFileContentType;
	private String saveDirectory;
	private String myFileFileName;
	private String destPath;
	private HttpServletRequest request;
	
	

	private Logger log = Logger.getLogger(SaleOfController.class);

	public String execute() {
//		HttpServletRequest request = ServletActionContext.getRequest();
		this.saveImage();
		return SUCCESS;
	}
	
	public boolean saveImage(){
		destPath = request.getSession().getServletContext().getRealPath(saveDirectory);

		try {			
			File destFile = new File(destPath, myFileFileName);
			FileUtils.copyFile(myFile, destFile);
			log.info("Upload comlete, link image save on database is " + this.getLinkImage());
			return true;

		} catch (IOException ex) {
			log.error("Can't upload file " + this.myFileFileName + ex.getMessage());
			return false;
		}
	}

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getMyFileContentType() {
		return myFileContentType;
	}

	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	public String getMyFileFileName() {
		return myFileFileName;
	}

	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}

	public String getSaveDirectory() {
		return saveDirectory;
	}

	public void setSaveDirectory(String saveDirectory) {
		this.saveDirectory = saveDirectory;
	}
	
	public String getLinkImage(){
		return this.saveDirectory + "/" + this.myFileFileName;
	}
}
