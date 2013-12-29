package cellphoneshop.controller;
import java.io.File;

import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.http.HttpRequest;

import java.io.IOException; 

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class SaleOfController  extends ActionSupport{
	 private File myFile;
	   private String myFileContentType;
	   private String myFileFileName;
	   private String destPath;
	   
	   private Logger log = Logger.getLogger(SaleOfController.class);

	   public String execute()
	   {
	      /* Copy file to a safe location */
	      destPath = "C:/apache-tomcat-6.0.33/work/";

	      try{
	    	  
	    	 HttpServletRequest request = ServletActionContext.getRequest();
	    	 destPath = request.getSession().getServletContext().getRealPath("/resources/images/");
	    	 
	    	 log.info("destpath: " + destPath);
	     	 log.info("Src File name: " + myFile);
	     	 log.info("Dst File name: " + myFileFileName);
	     	    	 
	     	 File destFile  = new File(destPath, myFileFileName);
	    	 FileUtils.copyFile(myFile, destFile);
	    	 
	    	 	  
	      }catch(IOException e){
	         e.printStackTrace();
	         return ERROR;
	      }

	      return SUCCESS;
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
	}