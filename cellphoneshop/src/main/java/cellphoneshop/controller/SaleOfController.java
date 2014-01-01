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
import cellphoneshop.util.Message;
import cellphoneshop.viewmodel.UpdateKhuyenMai;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Currency;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class SaleOfController extends ActionSupport implements
		ServletRequestAware {
	private File myFile;
	private String myFileContentType;
	private String saveDirectory;
	private Integer saleOfPerPage;
	private String myFileFileName;
	private String destPath;
	private HttpServletRequest request;
	private Integer trangThaiDong;
	private Integer trangThaiMo;
	private Integer trangThaiTuongLai;
	private Integer totalKm;
	private List<String> errors;
	private UpdateKhuyenMai updatekm;
	private String query;
	private String option;
	private String regixTrangThaiKM;

	private Logger log = Logger.getLogger(SaleOfController.class);
	@Autowired
	private KhuyenMaiService khuyenMaiService;

	@Autowired
	private TrangThaiKhuyenMaiService trangThaiKhuyenMaiService;

	@Autowired
	private Message messages;

	public String execute() {
		log.info("Vao ham execute controller");
		Integer currentPage = getCurrentPage(request.getParameter("page"));
		List<KhuyenMai> khuyenmailList = this.getListKhuyenMail(currentPage);
		request.setAttribute("kmList", khuyenmailList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", this.getTotalPage());

		return SUCCESS;
	}

	public String detailKhuyenMai() {
		log.info("Vao detail khuyen mail Controller");
		Integer maKM = this.getmaKM(request.getParameter("id"));

		if (maKM != null) {
			KhuyenMai khuyenMai = khuyenMaiService.getKhuyenMai(maKM);
			if (khuyenMai != null) {
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

	public String stopKhuyenMai() {
		log.info("Vao stop Khuyen mai controller");
		Integer maKM = this.getmaKM(request.getParameter("id"));
		if (maKM != null) {
			KhuyenMai khuyenMai = khuyenMaiService.getKhuyenMai(maKM);
			if (khuyenMai != null) {
				khuyenMai.setNgayKetThuc(new Date());
				TrangThaiKhuyenMai trangThaiKhuyenMai = trangThaiKhuyenMaiService
						.getTrangThaiKM(this.trangThaiDong);
				khuyenMai.setTrangThaiKhuyenMai(trangThaiKhuyenMai);

				if (khuyenMaiService.updateKhuyenMai(khuyenMai)) {
					log.info("Stop khuyen mai " + khuyenMai.getTieuDe()
							+ " thanh cong");
				} else {
					log.error("Khong the stop khuyen mai");
				}
			}
		}
		return SUCCESS;
	}

	public String showUpdateKhuyenMaiForm() {
		errors = new ArrayList<String>();
		log.info("Go to show updateKhuyenMai form");
		Integer maKM = this.getmaKM(request.getParameter("id"));
		if (maKM == null) {
			errors.add(messages.getMessageList().getProperty("errorInfoKM"));
			request.setAttribute("errors", errors);
			return INPUT;
		}

		KhuyenMai khuyenmai = khuyenMaiService.getKhuyenMai(maKM);
		if (khuyenmai == null) {
			errors.add(messages.getMessageList().getProperty("errorInfoKM"));
			request.setAttribute("errors", errors);
			return INPUT;
		}

		updatekm = new UpdateKhuyenMai();
		request.setAttribute("km", khuyenmai);
		updatekm.setMaKm(khuyenmai.getMaKm());
		return INPUT;
	}

	public String processUpdateKhuyenMai() {
		errors = new ArrayList<String>();
		if (updatekm == null) {
			errors.add(messages.getMessageList().getProperty("errorInfoKM"));
			request.setAttribute("errors", errors);
			return ERROR;
		}

		if (!vaildateUpdate()) {
			request.setAttribute("errors", errors);
			return ERROR;
		}

		log.info("ma: " + updatekm.getMaKm());
		KhuyenMai khuyenmai = khuyenMaiService.getKhuyenMai(updatekm.getMaKm());
		if (khuyenmai == null) {
			errors.add(messages.getMessageList().getProperty("errorUpdateKM"));
			request.setAttribute("errors", errors);
			return ERROR;
		}

		khuyenmai.setTieuDe(updatekm.getTieuDe());
		khuyenmai.setMoTa(updatekm.getMoTa());
		if (updatekm.getPhanTramGiamGia() == null
				|| updatekm.getPhanTramGiamGia() == 0.0) {
			khuyenmai.setPhanTramGiamGia(null);
		} else {
			khuyenmai.setPhanTramGiamGia(updatekm.getPhanTramGiamGia());
		}

		khuyenmai.setNgayKetThuc(updatekm.getNgayKetThuc());
		if(khuyenmai.getTrangThaiKhuyenMai().getMaTrangThai() == this.trangThaiTuongLai){
			khuyenmai.setNgayBatDau(updatekm.getNgayBatDau());
		}
		if (updatekm.getQuaTang().isEmpty()) {
			khuyenmai.setQuaTang(null);
		} else {
			khuyenmai.setQuaTang(updatekm.getQuaTang());
		}

		if (myFileFileName != null) {
			if (this.saveImage()) {
				khuyenmai.setHinhAnh(this.getLinkImage());

			}
		}

		if (khuyenMaiService.updateKhuyenMai(khuyenmai)) {
			request.setAttribute("isSuccess", true);
			request.setAttribute("km", khuyenmai);
			log.info("Cap nhat - giam gia: " + khuyenmai.getPhanTramGiamGia());
			log.info("Tang kem: " + khuyenmai.getQuaTang());
			log.info("Cap nhat thanh cong khuyen mai: " + khuyenmai.getTieuDe());
			return SUCCESS;
		} else {
			errors.add(messages.getMessageList().getProperty("errorUpdateKM"));
			request.setAttribute("errors", errors);
			log.info("Cap nhat khong thanh cong khuyen mai: "
					+ khuyenmai.getTieuDe());
			return ERROR;
		}
	}

	public String searchKhuyenMai() {
		log.info("Go to searchKhuyenMai controller");

		if (query == null || option == null) {
			request.setAttribute("isInput", true);
			return INPUT;
		}

		request.setAttribute("isInput", false);

		if (!this.validateSearch()) {
			request.setAttribute("errors", errors);
			return SUCCESS;
		}

		Integer currentPage = this.getCurrentPage(request.getParameter("page"));
		Integer vitriBD = this.getVitriBD(currentPage);
		List<KhuyenMai> khuyenMaiList = khuyenMaiService.getListKhuyenMail(
				query, option, vitriBD, this.saleOfPerPage);

		if (khuyenMaiList == null || khuyenMaiList.isEmpty()) {
			errors = new ArrayList<String>();
			errors.add(messages.getMessageList().getProperty("notFoundKM"));
			request.setAttribute("errors", errors);
			return SUCCESS;
		}

		if (option.equals("id")) {
			request.setAttribute("currentPage", 1);
			request.setAttribute("totalPage", 1);
		} else {
			Integer totalspecialkm = khuyenMaiService.countKhuyenMail(query,
					option);
			log.info("totalspecialKM: " + totalspecialkm);
			Integer totalPage = this.getTotalPage(totalspecialkm);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPage", totalPage);
		}

		request.setAttribute("kmList", khuyenMaiList);
		return SUCCESS;
	}

	public boolean saveImage() {
		destPath = request.getSession().getServletContext()
				.getRealPath(saveDirectory);
		if (myFile == null || myFileFileName == null) {
			return false;
		}
		log.info("destPath: " + destPath);
		log.info("nameFile: " + myFileFileName);
		try {
			File destFile = new File(destPath, myFileFileName);
			FileUtils.copyFile(myFile, destFile);
			log.info("Destpath: " + destPath);
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

	public Integer getCurrentPage(String page) {
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

	public Integer getmaKM(String makm) {
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

	public List<KhuyenMai> getListKhuyenMail(Integer page) {
		Integer vitriBD = this.getVitriBD(page);
		return khuyenMaiService.getListKhuyenMai(vitriBD, this.saleOfPerPage);
	}

	public Integer getVitriBD(Integer page) {
		return (page - 1) * this.saleOfPerPage;
	}

	public Integer getTotalPage() {
		if (this.totalKm == null) {
			this.totalKm = khuyenMaiService.countKhuyenMai();
		}
		Integer nPage = this.totalKm / this.saleOfPerPage;
		if ((this.totalKm % this.saleOfPerPage) != 0) {
			nPage += 1;
		}

		return nPage;
	}

	public Integer getTotalPage(Integer total) {
		if (total == null) {
			return 0;
		}
		Integer totalPage = total / this.getSaleOfPerPage();
		if ((total % this.saleOfPerPage) != 0) {
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

	public UpdateKhuyenMai getKm() {
		return updatekm;
	}

	public void setKm(UpdateKhuyenMai km) {
		this.updatekm = km;
	}

	public Integer getTrangThaiMo() {
		return trangThaiMo;
	}

	public void setTrangThaiMo(Integer trangThaiMo) {
		this.trangThaiMo = trangThaiMo;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public boolean validateSearch() {

		errors = new ArrayList<String>();

		if (option.equals("status")) {
			if (!query.matches(this.regixTrangThaiKM)) {
				errors.add(messages.getMessageList().getProperty(
						"errorIdStatus"));
				return false;
			}

		} else {
			if (option.equals("id")) {
				try {
					Integer.parseInt(query);
				} catch (Exception ex) {
					errors.add(messages.getMessageList().getProperty(
							"errormaKM"));
					return false;
				}
			}
		}

		return true;
	}

	public boolean validateFload(String fNumber) {
		errors = new ArrayList<String>();
		if (updatekm.getNgayKetThuc().compareTo(new Date()) <= 0) {
			errors.add(messages.getMessageList().getProperty("errorNgayKT"));
			return false;
		}
		return true;
	}

	public boolean tryParseDate(String strDate) {
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
			log.error("Parse date is not success");
			return null;
		}
	}

	public boolean validatekNgayBatDau() {
		
		//To do:
		if(updatekm.getNgayBatDau() == null){
			return true;
		}
		if (updatekm.getNgayBatDau().compareTo(new Date()) <= 0) {
			return true;
		}
		errors.add(messages.getMessageList().getProperty("errorNgayDB"));
		return false;
	}

	public boolean validateNgayKetThuc() {
		if (updatekm.getNgayKetThuc().compareTo(new Date()) <= 0) {
			errors.add(messages.getMessageList().getProperty("errorNgayKT"));
			return false;
		}

		return true;
	}

	public boolean vaildateUpdate() {

		errors = new ArrayList<String>();
		if (!this.validatekNgayBatDau()) {
			return false;
		}

		if (!this.validateNgayKetThuc()) {
			return false;
		}

		return true;
	}

	public String getRegixTrangThaiKM() {
		return regixTrangThaiKM;
	}

	public void setRegixTrangThaiKM(String regixTrangThaiKM) {
		this.regixTrangThaiKM = regixTrangThaiKM;
	}

	public Integer getTrangThaiTuongLai() {
		return trangThaiTuongLai;
	}

	public void setTrangThaiTuongLai(Integer trangThaiTuongLai) {
		this.trangThaiTuongLai = trangThaiTuongLai;
	}

}
