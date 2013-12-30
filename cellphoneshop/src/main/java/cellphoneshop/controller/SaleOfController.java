package cellphoneshop.controller;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.KhuyenMai;
import cellphoneshop.service.KhuyenMaiService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class SaleOfController extends ActionSupport implements ServletRequestAware{
	private File myFile;
	private String myFileContentType;
	private String saveDirectory;
	private Integer saleOfPerPage;
	private String myFileFileName;
	private String destPath;
	private HttpServletRequest request;

	private Logger log = Logger.getLogger(SaleOfController.class);
	@Autowired
	private KhuyenMaiService khuyenMaiService;

	public String execute() {
		log.info("Vao ham execute controller");
		Integer curentPage = getPageNumber(request.getParameter("page"));
		List<KhuyenMai> khuyenmailList = this.getListKhuyenMail(curentPage);
		for(KhuyenMai km : khuyenmailList){
			log.info("Mo ta: " + km.getMoTa());
		}
		request.setAttribute("kmList", khuyenmailList);
		
		return SUCCESS;
	}

	public String insertKhuyenMai() {
		// HttpServletRequest request = ServletActionContext.getRequest();
		// this.saveImage();
		log.info("Vao ham insert khuyen mai controller");

		return SUCCESS;
	}

	public boolean saveImage() {
		destPath = request.getSession().getServletContext()
				.getRealPath(saveDirectory);

		try {
			File destFile = new File(destPath, myFileFileName);
			FileUtils.copyFile(myFile, destFile);
			log.info("Upload comlete, link image save on database is "
					+ this.getLinkImage());
			return true;

		} catch (IOException ex) {
			log.error("Can't upload file " + this.myFileFileName
					+ ex.getMessage());
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

	public String getLinkImage() {
		return this.saveDirectory + "/" + this.myFileFileName;
	}

	public Integer getSaleOfPerPage() {
		return saleOfPerPage;
	}

	public void setSaleOfPerPage(Integer saleOfPerPage) {
		this.saleOfPerPage = saleOfPerPage;
	}

	public Integer getPageNumber(String page) {
		if (page == null || page.equals("")) {
			return 1;
		}

		try {
			return Integer.parseInt(page);

		} catch (Exception e) {
			log.error("Parse page error" + page);
			return 1;

		}
	}
	
	public List<KhuyenMai> getListKhuyenMail(Integer page){
		Integer vitriBD = (page - 1) * this.saleOfPerPage;
		return khuyenMaiService.getListKhuyenMai(vitriBD, this.saleOfPerPage);
	}
}

