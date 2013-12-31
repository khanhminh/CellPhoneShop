package cellphoneshop.controller;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.KhuyenMai;
import cellphoneshop.model.TrangThaiKhuyenMai;
import cellphoneshop.service.KhuyenMaiService;
import cellphoneshop.service.TrangThaiKhuyenMaiService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Currency;
import java.util.Date;
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
	private Integer trangThaiDong;
	private Integer totalKm;

	private Logger log = Logger.getLogger(SaleOfController.class);
	@Autowired
	private KhuyenMaiService khuyenMaiService;
	
	@Autowired
	private TrangThaiKhuyenMaiService trangThaiKhuyenMaiService;

	public String execute() {
		log.info("Vao ham execute controller");
		Integer currentPage = getPageNumber(request.getParameter("page"));
		List<KhuyenMai> khuyenmailList = this.getListKhuyenMail(currentPage);
		request.setAttribute("kmList", khuyenmailList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", this.getTotalPage());
		
		return SUCCESS;
	}
	
	public String detailKhuyenMai(){
		log.info("Vao detail khuyen mail Controller");
		Integer maKM = this.getmaKM(request.getParameter("id"));
		if(maKM != null){
			KhuyenMai khuyenMai = khuyenMaiService.getKhuyenMai(maKM);
			if(khuyenMai != null){
				request.setAttribute("km", khuyenMai);
			}
		}
		return SUCCESS;
	}

	public String insertKhuyenMai() {
		// HttpServletRequest request = ServletActionContext.getRequest();
		// this.saveImage();
		log.info("Vao ham insert khuyen mai controller");

		return SUCCESS;
	}
	
	public String stopKhuyenMai(){
		log.info("Vao stop Khuyen mai controller");
		Integer maKM = this.getmaKM(request.getParameter("id"));
		if(maKM != null){
			KhuyenMai khuyenMai = khuyenMaiService.getKhuyenMai(maKM);
			if(khuyenMai != null){
				khuyenMai.setNgayKetThuc(new Date());
				TrangThaiKhuyenMai trangThaiKhuyenMai = trangThaiKhuyenMaiService.getTrangThaiKM(this.trangThaiDong);
				khuyenMai.setTrangThaiKhuyenMai(trangThaiKhuyenMai);
				
				if(khuyenMaiService.updateKhuyenMai(khuyenMai)){
					log.info("Stop khuyen mai "+ khuyenMai.getTieuDe() + " thanh cong");
				}else{
					log.error("Khong the stop khuyen mai");
				}
			}
		}
		return SUCCESS;
	}
	
	public String updateKhuyenMai(){
		log.info("Vao update khuyen mai controller");
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
		log.info("Page input: " + page);
		if (page == null || page.equals("")) {
			return 1;
		}

		try{
			return Integer.parseInt(page);

		} catch (Exception e) {
			log.error("Parse page error" + page);
			return 1;

		}
	}
	
	public Integer getmaKM(String makm){
		if (makm == null || makm.equals("")) {
			return null;
		}
		
		try {
			return Integer.parseInt(makm);

		} catch (Exception e) {
			log.error("Parse makm error" + makm);
			return null;
		}
	}
	
	public List<KhuyenMai> getListKhuyenMail(Integer page){
		Integer vitriBD = (page - 1) * this.saleOfPerPage;
		return khuyenMaiService.getListKhuyenMai(vitriBD, this.saleOfPerPage);
	}
	
	public Integer getTotalPage(){
		if(this.totalKm == null){
			this.totalKm = khuyenMaiService.countKhuyenMai();
		}
		Integer nPage = this.totalKm / this.saleOfPerPage;
		if((this.totalKm % this.saleOfPerPage) != 0){
			nPage += 1;
		}
		
		return nPage;
	}
	
	public Integer getTotalPage(Integer total){
		
		if(total == null){
			return 0;
		}
		Integer totalPage= total / this.getSaleOfPerPage();
		if((this.totalKm % this.saleOfPerPage) != 0){
			totalPage += 1;
		}
		
		return totalPage;
	}

	public Integer getTrangThaiDong() {
		return trangThaiDong;
	}

	public void setTrangThaiDong(Integer trangThaiDong) {
		this.trangThaiDong = trangThaiDong;
	}

	public Integer getTotalKm() {
		return totalKm;
	}

	public void setTotalKm(Integer totalKm) {
		this.totalKm = totalKm;
	}
}

