package cellphoneshop.controller;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.interceptor.HomeInterceptor;
import cellphoneshop.model.KhuyenMai;
import cellphoneshop.model.SanPham;
import cellphoneshop.model.TrangThaiKhuyenMai;
import cellphoneshop.service.KhuyenMaiService;
import cellphoneshop.service.SanPhamService;
import cellphoneshop.service.TrangThaiKhuyenMaiService;
import cellphoneshop.util.CTKhuyenMai;
import cellphoneshop.util.Message;
import cellphoneshop.viewmodel.CTKhuyenMaiView;
import cellphoneshop.viewmodel.UpdateKhuyenMai;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
	private Integer countCut;
	private String linkResources;
	private String saveLinkImage;
	private KhuyenMai insertKm;

	// Chitiet khuyen mai
	private int idKhuyenMai;
	private CTKhuyenMai ctKhuyenMai;
	@Autowired
	private SanPhamService sanPhamService;

	private Logger log = Logger.getLogger(SaleOfController.class);
	@Autowired
	private KhuyenMaiService khuyenMaiService;

	@Autowired
	private TrangThaiKhuyenMaiService trangThaiKhuyenMaiService;

	@Autowired
	private Message messages;

	public String execute() {

		Integer currentPage = getCurrentPage(request.getParameter("page"));
		List<KhuyenMai> khuyenmailList = this.getListKhuyenMail(currentPage);
		request.setAttribute("kmList", khuyenmailList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", this.getTotalPage());

		return SUCCESS;
	}

	public String detailKhuyenMai() {
		this.getPathSaveImage();
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
		errors = new ArrayList<String>();
		if (this.insertKm == null) {
			return INPUT;
		}

		if (!validateInsert()) {
			request.setAttribute("errors", errors);
			request.setAttribute("inputKm", this.insertKm);
			return INPUT;

		}
		TrangThaiKhuyenMai statusKm = trangThaiKhuyenMaiService
				.getTrangThaiKM(this.trangThaiTuongLai);
		if (statusKm == null) {
			errors.add(messages.getMessageList().getProperty("errorInsert"));
			request.setAttribute("errors", errors);
			request.setAttribute("inputKm", this.insertKm);
			return INPUT;
		}

		if (!this.saveImage()) {
			errors.add(messages.getMessageList().getProperty("errorSaveImage"));
			request.setAttribute("errors", errors);
			request.setAttribute("inputKm", this.insertKm);
			return INPUT;
		}
		this.insertKm.setTrangThaiKhuyenMai(statusKm);
		this.insertKm.setHinhAnh(this.getLinkImage());
		if(this.insertKm.getPhanTramGiamGia() == null){
			this.insertKm.setPhanTramGiamGia(0f);
		}
		
		if (khuyenMaiService.insertKhuyenMai(this.insertKm)) {
			log.warn("Them thanh cong khuyen mai, co id: "
					+ this.insertKm.getMaKm());
			this.insertKm = null;
			this.updateTotalKm();
			return SUCCESS;
		} else {
			errors.add(messages.getMessageList().getProperty("errorInsert"));
			request.setAttribute("errors", errors);
			request.setAttribute("inputKm", this.insertKm);
			log.warn("Them khong thanh cong khuyen mai co tieu de: "
					+ this.insertKm.getTieuDe());
			return INPUT;
		}
	}

	public String stopKhuyenMai() {
		Integer maKM = this.getmaKM(request.getParameter("id"));
		if (maKM != null) {
			KhuyenMai khuyenMai = khuyenMaiService.getKhuyenMai(maKM);
			if (khuyenMai != null) {
				khuyenMai.setNgayKetThuc(new Date());
				TrangThaiKhuyenMai trangThaiKhuyenMai = trangThaiKhuyenMaiService
						.getTrangThaiKM(this.trangThaiDong);
				khuyenMai.setTrangThaiKhuyenMai(trangThaiKhuyenMai);

				if (khuyenMaiService.updateKhuyenMai(khuyenMai)) {
					log.warn("Stop khuyen mai " + khuyenMai.getTieuDe()
							+ " ID: " + khuyenMai.getMaKm() + " thanh cong");
					this.reloadKhuyenMai();
				} else {
					log.error("Khong the stop khuyen mai");
				}
			}
		}
		return SUCCESS;
	}

	public String startKhuyenMai() {
		Integer maKM = this.getmaKM(request.getParameter("id"));
		if (maKM != null) {
			KhuyenMai khuyenMai = khuyenMaiService.getKhuyenMai(maKM);
			if (khuyenMai != null) {
				khuyenMai.setNgayBatDau(new Date());
				TrangThaiKhuyenMai trangThaiKhuyenMai = trangThaiKhuyenMaiService
						.getTrangThaiKM(this.trangThaiMo);
				khuyenMai.setTrangThaiKhuyenMai(trangThaiKhuyenMai);

				if (khuyenMaiService.updateKhuyenMai(khuyenMai)) {
					log.warn("Start khuyen mai " + khuyenMai.getTieuDe()
							+ " ID: " + khuyenMai.getMaKm() + " thanh cong");
					this.reloadKhuyenMai();
				} else {
					log.error("Khong the tart khuyen mai");
				}
			}
		}
		return SUCCESS;
	}

	public String showUpdateKhuyenMaiForm() {
		errors = new ArrayList<String>();
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
		KhuyenMai khuyenmai = khuyenMaiService.getKhuyenMai(updatekm.getMaKm());

		if (!vaildateUpdate(khuyenmai)) {
			request.setAttribute("errors", errors);
			khuyenmai.setNgayBatDau(updatekm.getNgayBatDau());
			khuyenmai.setNgayKetThuc(updatekm.getNgayKetThuc());
			khuyenmai.setMoTa(updatekm.getMoTa());
			khuyenmai.setTieuDe(updatekm.getTieuDe());
			khuyenmai.setPhanTramGiamGia(updatekm.getPhanTramGiamGia());
			khuyenmai.setQuaTang(updatekm.getQuaTang());

			request.setAttribute("km", khuyenmai);
			request.setAttribute("errors", errors);
			return ERROR;
		}

		log.warn("ma: " + updatekm.getMaKm());

		khuyenmai.setTieuDe(updatekm.getTieuDe());
		khuyenmai.setMoTa(updatekm.getMoTa());
		if (updatekm.getPhanTramGiamGia() == null
				|| updatekm.getPhanTramGiamGia() == 0f) {
			khuyenmai.setPhanTramGiamGia(0f);
		} else {
			khuyenmai.setPhanTramGiamGia(updatekm.getPhanTramGiamGia());
		}

		khuyenmai.setNgayBatDau(updatekm.getNgayBatDau());
		khuyenmai.setNgayKetThuc(updatekm.getNgayKetThuc());
		log.warn("Ngay bat dau: " + updatekm.getNgayBatDau());
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
			log.warn("Cap nhat - giam gia: " + khuyenmai.getPhanTramGiamGia());
			log.warn("Tang kem: " + khuyenmai.getQuaTang());
			log.warn("Cap nhat thanh cong khuyen mai: " + khuyenmai.getTieuDe());
			this.reloadKhuyenMai();
			return SUCCESS;
		} else {
			errors.add(messages.getMessageList().getProperty("errorUpdateKM"));
			request.setAttribute("errors", errors);
			log.warn("Cap nhat khong thanh cong khuyen mai: "
					+ khuyenmai.getTieuDe());
			return ERROR;
		}
	}

	public String searchKhuyenMai() {

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
		List<KhuyenMai> khuyenMaiList = khuyenMaiService.getListKhuyenMai(
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
			Integer totalspecialkm = khuyenMaiService.countKhuyenMai(query,
					option);
			log.warn("totalspecialKM: " + totalspecialkm);
			Integer totalPage = this.getTotalPage(totalspecialkm);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPage", totalPage);
		}

		request.setAttribute("kmList", khuyenMaiList);
		return SUCCESS;
	}

	public String listCTKhuyenMai() {
		List<CTKhuyenMaiView> ctKhuyenMaiList = khuyenMaiService
				.getListCTKhuyenMai();

		request.setAttribute("ctkmList", ctKhuyenMaiList);
		request.setAttribute("currentPage", 1);
		request.setAttribute("totalPage", 1);
		return SUCCESS;
	}

	public String insertCTKhuyenMai() {
		if (this.ctKhuyenMai == null) {
			this.inputDataCTKhuyenMai();
			return INPUT;
		}

		if (!validateInsertCtKhuyenMai()) {
			request.setAttribute("errors", errors);
			return INPUT;
		}

		if (khuyenMaiService.ApdungKhuyenMaiChoSanPham(this.ctKhuyenMai
				.getSanPham().getMaSp(), this.ctKhuyenMai.getKhuyenMai()
				.getMaKm())) {
			log.warn("Add thanhg cong san pham "
					+ this.ctKhuyenMai.getSanPham().getMaSp()
					+ " vao khuyen mai "
					+ this.ctKhuyenMai.getKhuyenMai().getMaKm());
			this.ctKhuyenMai = null;
			request.setAttribute("isSuccess", true);
			return SUCCESS;

		} else {
			log.warn("Add khong thanh thanhg cong san pham "
					+ this.ctKhuyenMai.getSanPham().getMaSp()
					+ " vao khuyen mai "
					+ this.ctKhuyenMai.getKhuyenMai().getMaKm());
		}

		errors = new ArrayList<String>();
		errors.add(messages.getMessage("errorInsertCTKM"));
		request.setAttribute("errors", errors);
		ctKhuyenMai = null;
		this.inputDataCTKhuyenMai();
		return INPUT;
	}

	public String deleteCTKhuyenMai() {
		String idSPString = request.getParameter("idsp");
		String idKMString = request.getParameter("idkm");
		Integer idKm = null;
		Integer idSp = null;

		if (idKMString != null) {
			try {
				idKm = Integer.parseInt(idKMString);
				idSp = Integer.parseInt(idSPString);
			} catch (Exception e) {
				return SUCCESS;
			}

		}
		if (khuyenMaiService.HuyApDungKhuyenMaiChoSanPham(idSp, idKm)) {
			request.setAttribute("isSuccess", true);
			log.warn("Delete success ctkm: idSP: " + idSp + " idKm: " + idKm);
			return SUCCESS;
		} else {
			log.warn("Delete unsuccess ctkm: idSP: " + idSp + " idKm: " + idKm);
			return SUCCESS;
		}

	}

	public String searchCTKhuyenMai() {

		if (this.query == null || this.option == null) {
			request.setAttribute("isInput", true);
			return SUCCESS;
		}
		errors = new ArrayList<String>();

		List<CTKhuyenMaiView> ctKhuyenMaiList = khuyenMaiService
				.getListCTKhuyenMai(this.query, this.option);

		if (ctKhuyenMaiList == null || ctKhuyenMaiList.isEmpty()) {
			errors.add(messages.getMessage("unFoundctkm"));
			request.setAttribute("errors", errors);
			return SUCCESS;
		}

		request.setAttribute("ctkmList", ctKhuyenMaiList);
		request.setAttribute("currentPage", 1);
		request.setAttribute("totalPage", 1);
		return SUCCESS;
	}

	public void inputDataCTKhuyenMai() {
		List<SanPham> spList = sanPhamService.getListSanPham("maSp", true);
		List<KhuyenMai> openkmList = khuyenMaiService.getListKhuyenMai(
				this.trangThaiMo + "", "status", null, null);
		List<KhuyenMai> futurekmList = khuyenMaiService.getListKhuyenMai(
				this.trangThaiTuongLai + "", "status", null, null);
		List<KhuyenMai> kmList = new ArrayList<KhuyenMai>();
		if (openkmList != null) {
			for (KhuyenMai km : openkmList) {
				kmList.add(km);
			}
		}

		if (futurekmList != null) {
			for (KhuyenMai km : futurekmList) {
				kmList.add(km);
			}
		}

		request.setAttribute("spList", spList);
		request.setAttribute("kmList", kmList);
	}

	public boolean validateInsertCtKhuyenMai() {
		errors = new ArrayList<String>();
		if (ctKhuyenMai.getKhuyenMai().getMaKm() == null) {
			errors.add(messages.getMessage("unknownMaKM"));
		} else {
			if (khuyenMaiService.getKhuyenMai(ctKhuyenMai.getKhuyenMai()
					.getMaKm()) == null) {
				errors.add(messages.getMessage("errormaKM"));
			}
		}

		if (ctKhuyenMai.getSanPham().getMaSp() == null) {
			errors.add(messages.getMessage("unknownmaSP"));
		} else {
			if (sanPhamService.getSanPhamTheoId(ctKhuyenMai.getSanPham()
					.getMaSp()) == null) {
				errors.add(messages.getMessage("errormaSP"));
			}
		}

		if (errors.isEmpty()) {
			return true;
		}

		return false;
	}

	public boolean saveImage() {
		destPath = this.getPathSaveImage();
		log.warn("destPath: " + destPath);
		if (destPath == null) {
			return false;
		}

		// destPath += this.linkResources;
		// destPath += this.saveDirectory;

		if (myFile == null || myFileFileName == null) {
			return false;
		}
		// log.warn("destPath: " + destPath);
		log.warn("nameFile: " + myFileFileName);
		try {
			File destFile = new File(destPath, myFileFileName);
			FileUtils.copyFile(myFile, destFile);
			// log.warn("Destpath: " + destPath);
			log.warn("Upload comlete, link image save on database is "
					+ this.getLinkImage());
			return true;

		} catch (IOException ex) {
			log.error("Can't upload file " + this.myFileFileName + " "
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
		return this.saveLinkImage + this.myFileFileName;
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
			log.error("Parse page error" + page + " message: " + e.getMessage() );
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
			log.error("Parse makm error" + makm + " message: " + e.getMessage());
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

	public boolean updateTotalKm() {
		if (this.totalKm == null) {
			this.totalKm = khuyenMaiService.countKhuyenMai();
		}

		if (totalKm != null) {
			totalKm += 1;
			return true;
		}

		return false;
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
			log.error("Parse date is not success " + e.getMessage());
			return null;
		}
	}

	public boolean validatekNgayBatDau(KhuyenMai khuyenmai, Date today) {
		if (updatekm.getNgayBatDau() == null) {
			errors.add(messages.getMessageList().getProperty("unknownNgayBD"));
			return false;
		}

		if (updatekm.getNgayBatDau() == null) {
			errors.add(messages.getMessageList().getProperty("unknownNgayBD"));
			return false;
		}

		if (khuyenmai.getTrangThaiKhuyenMai().getMaTrangThai() == this.trangThaiTuongLai) {
			// DK today > ngayBatDau()
			if (updatekm.getNgayBatDau().compareTo(today) < 0) {
				errors.add(messages.getMessageList().getProperty(
						"errorNgayBDTL"));
				return false;
			}
		} else {
			// DK today < ngayBatDau(<0)
			if (updatekm.getNgayBatDau().compareTo(new Date()) > 0) {
				errors.add(messages.getMessageList().getProperty("errorNgayBD"));
				return false;
			}
		}

		return true;
	}

	public boolean validateNgayKetThuc(Date today) {
		if (updatekm.getNgayKetThuc() == null) {
			errors.add(messages.getMessageList().getProperty("unknownNgayKT"));
			return false;
		}

		log.warn("Thoi gian ket thuc: " + updatekm.getNgayKetThuc());
		if (updatekm.getNgayKetThuc().compareTo(today) < 0) {
			errors.add(messages.getMessageList().getProperty("errorNgayKT"));
			return false;
		}
		return true;
	}

	public boolean vaildateUpdate(KhuyenMai km) {

		errors = new ArrayList<String>();
		Date today = new Date();
		if (km == null) {
			errors.add(messages.getMessageList().getProperty("errorUpdateKM"));
			return false;
		}

		this.validatekNgayBatDau(km, today);
		this.validateNgayKetThuc(today);

		if (updatekm.getPhanTramGiamGia() == null
				|| updatekm.getPhanTramGiamGia() == 0.0) {
			if (updatekm.getQuaTang() == null
					|| updatekm.getQuaTang().isEmpty()) {
				errors.add(messages
						.getMessage("uknowQuaTangorPhanTrangGiamGia"));

			}
		} else {
			if (updatekm.getQuaTang() == null
					|| updatekm.getQuaTang().isEmpty()) {
				if (updatekm.getPhanTramGiamGia() == null
						|| updatekm.getPhanTramGiamGia() == 0.0) {
					errors.add(messages
							.getMessage("uknowQuaTangorPhanTrangGiamGia"));
				}
			}
		}
		
		if(updatekm.getNgayBatDau().compareTo(updatekm.getNgayKetThuc()) > 0){
			errors.add(messages.getMessage("errorDate"));
		}

		if (errors.isEmpty()) {
			return true;
		}

		return false;
	}

	public boolean validateInsert() {
		errors = new ArrayList<String>();
		Date today = new Date();
		if (insertKm.getTieuDe() == null || insertKm.getTieuDe().isEmpty()) {
			errors.add(messages.getMessageList().getProperty("unknownTieuDe"));
		}
		if (insertKm.getMoTa() == null || insertKm.getMoTa().isEmpty()) {
			errors.add(messages.getMessageList().getProperty("unknownMota"));
		}

		if (insertKm.getNgayBatDau() == null) {
			errors.add(messages.getMessageList().getProperty("unknownNgayBD"));
		} else {
			if (insertKm.getNgayBatDau().compareTo(today) < 0) {
				log.warn("Loi ngay bat dau khuyen mai");
				errors.add(messages.getMessageList().getProperty(
						"errorNgayBDTL"));
			}
		}

		if (insertKm.getNgayKetThuc() == null) {
			errors.add(messages.getMessageList().getProperty("unknownNgayKT"));
		}

		if (insertKm.getNgayKetThuc().compareTo(today) < 0) {
			errors.add(messages.getMessageList().getProperty("errorNgayKT"));
		}

		if (this.myFileFileName == null || this.myFile == null
				|| this.myFileFileName.isEmpty()) {
			errors.add(messages.getMessageList().getProperty("unknownImage"));
		}

		if (insertKm.getPhanTramGiamGia() == null
				|| insertKm.getPhanTramGiamGia() == 0.0) {
			if (insertKm.getQuaTang() == null
					|| insertKm.getQuaTang().isEmpty()) {
				errors.add(messages
						.getMessage("uknowQuaTangorPhanTrangGiamGia"));

			}
		} else {
			if (insertKm.getQuaTang() == null
					|| insertKm.getQuaTang().isEmpty()) {
				if (insertKm.getPhanTramGiamGia() == null
						|| insertKm.getPhanTramGiamGia() == 0.0) {
					errors.add(messages
							.getMessage("uknowQuaTangorPhanTrangGiamGia"));
				}
			}
		}
		
		if(insertKm.getNgayBatDau().compareTo(insertKm.getNgayKetThuc()) > 0){
			errors.add(messages.getMessage("errorDate"));
		}

		if (!errors.isEmpty()) {
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

	public String getPathSaveImage() {

		// String path =
		// request.getSession().getServletContext().getRealPath("/");
		String path = request.getSession().getServletContext()
				.getRealPath(this.saveDirectory);
		return path;

		// if (path == null || path.isEmpty()) {
		// return null;
		// }
		//
		// int count = 0;
		//
		// Integer pathLength = path.length();
		// char pattern = path.charAt(pathLength - 1);
		// String backupPath = path;
		// String projectName = null;
		// for (int i = path.length() - 1; i > 0; i--) {
		// if (count == this.countCut) {
		// break;
		// }
		// if (path.charAt(i - 1) == pattern) {
		// if (projectName == null || projectName.isEmpty()) {
		// projectName = backupPath.substring(i, pathLength - 1);
		// }
		// count++;
		// }
		//
		// path = path.substring(0, i);
		// }
		// return (path + projectName + pattern + projectName);
	}

	public Integer getCountCut() {
		return countCut;
	}

	public void setCountCut(Integer countCut) {
		this.countCut = countCut;
	}

	public String getLinkResources() {
		return linkResources;
	}

	public void setLinkResources(String linkResources) {
		this.linkResources = linkResources;
	}

	public String getSaveLinkImage() {
		return saveLinkImage;
	}

	public void setSaveLinkImage(String saveLinkImage) {
		this.saveLinkImage = saveLinkImage;
	}

	public void reloadKhuyenMai() {
		HomeInterceptor instance = HomeInterceptor.getInstance();
		if (instance != null) {
			instance.loadListKM();
		}
	}

	public KhuyenMai getInsertKm() {
		return insertKm;
	}

	public void setInsertKm(KhuyenMai insertKm) {
		this.insertKm = insertKm;
	}

	public int getIdKhuyenMai() {
		return idKhuyenMai;
	}

	public void setIdKhuyenMai(int idKhuyenMai) {
		this.idKhuyenMai = idKhuyenMai;
	}

	public CTKhuyenMai getCtKhuyenMai() {
		return ctKhuyenMai;
	}

	public void setCtKhuyenMai(CTKhuyenMai ctKhuyenMai) {
		this.ctKhuyenMai = ctKhuyenMai;
	}

}
