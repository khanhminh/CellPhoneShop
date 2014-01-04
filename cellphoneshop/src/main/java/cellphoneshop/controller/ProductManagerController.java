package cellphoneshop.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;

import org.apache.commons.io.FileUtils;

import cellphoneshop.model.CtSanPham;
import cellphoneshop.model.HinhAnhSp;
import cellphoneshop.model.LoaiSanPham;
import cellphoneshop.model.NhaSanXuat;
import cellphoneshop.model.SanPham;
import cellphoneshop.service.CTSanPhamService;
import cellphoneshop.service.HinhAnhSPService;
import cellphoneshop.service.LoaiSanPhamService;
import cellphoneshop.service.NhaSanXuatService;
import cellphoneshop.service.SanPhamService;
import cellphoneshop.util.LinksSaveImage;
import cellphoneshop.util.Message;
import cellphoneshop.viewmodel.SortBy;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ProductManagerController extends ActionSupport implements
		ServletRequestAware {
	private HttpServletRequest request;
	@Autowired
	private NhaSanXuatService producerService;
	@Autowired
	private SanPhamService productService;
	@Autowired
	private CTSanPhamService productDetailService;
	@Autowired
	private LoaiSanPhamService categoryService;
	@Autowired
	private HinhAnhSPService productImageService;
	@Autowired
	private Message messages;

	private LinksSaveImage imagesLink;

	private SanPham product;
	private CtSanPham productDetail;
	private List<String> errors;
	private NhaSanXuat emptyProducer;
	private LoaiSanPham productCategory;
	private NhaSanXuat producer;
	private boolean insertSuccess = false;

	private Logger log = Logger.getLogger(ProductManagerController.class);
	private Integer productPerPage;
	private Integer totalProduct;
	private File imagesFile; // File uses to save on dir project
	private String imagesFileContentType;
	private String imagesFileFileName; // Name of image file upload

	// Upload Multifile image
	private File[] file;
	private String[] fileContentType;
	private String[] fileFileName;

	public String insertProduct() {
		log.info("Size imagesLin: " + this.imagesLink.getLink("nokia"));
		String insertNewProductRequest = request
				.getParameter("themSanPhamFlag");
		if (insertNewProductRequest != null
				&& insertNewProductRequest.equals("true")) {
			insertSuccess = false;
			product = null;
			productDetail = null;
		}

		List<NhaSanXuat> danhSachNhaSanXuat = producerService
				.getListNhaSanXuat();
		if (emptyProducer == null) {
			emptyProducer = new NhaSanXuat("Chon mot nha san xuat");
			emptyProducer.setMaNhaSx(-1);
		}
		danhSachNhaSanXuat.add(0, emptyProducer);
		request.setAttribute("danhSachNhaSanXuat", danhSachNhaSanXuat);

		if (product == null || productDetail == null) {
			return INPUT;
		} else if (!validateProduct() || !validateProductDetail()) {
			request.setAttribute("errors", errors);
			return INPUT;
		}

		if (productCategory == null) {
			productCategory = categoryService.getLoaiSPTheoId(1);
		}

		product.setLoaiSanPham(productCategory);
		product.setDiemDanhGiaTb(0.0f);
		product.setNgayNhap(new Date());
		product.setNhaSanXuat(producer);
		this.saveImageFile(producer.getTenNhaSx(), product.getTenSp());
		product.setHinhDaiDien(this.getImageUploadLink(producer.getTenNhaSx(),
				product.getTenSp()));

		productDetail.setSanPham(product);
		
		List<HinhAnhSp> productImageList = new ArrayList<HinhAnhSp>();
		if(this.file != null){
			List<String> imageLinks = this.saveMuiltImageFile(producer.getTenNhaSx(), product.getTenSp());
			if (imageLinks != null) {
				for (int i = imageLinks.size() - 1; i >= 0; i--) {
					HinhAnhSp image = new HinhAnhSp(productDetail, imageLinks.get(i), i+1);
					productImageList.add(image);
				}
			}
		}

		if (productService.insertSanPham(product)
				&& productDetailService.insertCTSanPham(productDetail)) {
			for (HinhAnhSp img : productImageList) {
				productImageService.insertHinhAnhSP(img);
			}
			insertSuccess = true;
			return SUCCESS;
		} else {
			insertSuccess = false;
			errors.add(messages.getMessage("errorInsertProduct"));
			return INPUT;
		}
	}

	public String listProduct() {
		log.info("Go to listProduct Controller");
		Integer currentPage = this.getCurrentPage(request.getParameter("page"));
		Integer vitriBatDau = this.getViTriBatDau(currentPage);
		SortBy sort = new SortBy();
		sort.setBy("id");

		List<SanPham> sanPhamList = productService.getListSanPham(vitriBatDau,
				this.productPerPage, sort);

		if (totalProduct == null) {
			totalProduct = productService.demSoSanPham();
		}

		if (sanPhamList == null) {
			return SUCCESS;
		}

		Integer totalPage = this.getTotalPage(totalProduct);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("productList", sanPhamList);
		return SUCCESS;
	}

	public String detailProduct() {
		return SUCCESS;
	}

	private boolean validateProduct() {
		errors = new ArrayList<String>();

		String tenSp = product.getTenSp().trim();
		if (tenSp == null || tenSp.isEmpty()) {
			errors.add(messages.getMessage("errorNamePhone"));
			return false;
		}

		try {
			int maNhaSanXuat = Integer.parseInt(request
					.getParameter("maNhaSanXuat"));
			if (maNhaSanXuat == -1) {
				errors.add(messages.getMessage("unchooseProducer"));
				return false;
			}
			producer = producerService.getNhaSanXuatTheoId(maNhaSanXuat);
			if (producer == null) {
				errors.add(messages.getMessage("unknowProducer"));
				return false;
			}
		} catch (NumberFormatException ex) {
			errors.add(messages.getMessage("errorProducer"));
			return false;
		}

		if (product.getGia() == null || product.getGia() < 0) {
			errors.add(messages.getMessage("errorPrice"));
			return false;
		}

		if (product.getSoThangBaoHanh() == null
				|| product.getSoThangBaoHanh() < 0) {
			errors.add(messages.getMessage("errorSoThangBaoHanh"));
			return false;
		}

		if (product.getSoLuongHienCo() == null
				|| product.getSoLuongHienCo() < 0) {
			errors.add(messages.getMessage("errorSoLuongHienCo"));
			return false;
		}

		if (product.getTongSoLuong() == null || product.getTongSoLuong() < 0) {
			errors.add(messages.getMessage("errorTongSoLuong"));
			return false;
		}

		if (product.getSoLuongHienCo() > product.getTongSoLuong()) {
			errors.add(messages.getMessage("lagerTongSoLuong"));
			return false;
		}

		return true;
	}

	private boolean validateProductDetail() {
		return true;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public SanPham getSanPham() {
		return product;
	}

	public void setSanPham(SanPham sanPham) {
		this.product = sanPham;
	}

	public CtSanPham getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(CtSanPham productDetail) {
		this.productDetail = productDetail;
	}

	public boolean getInsertSuccess() {
		return insertSuccess;
	}

	public void setInsertSucess(boolean b) {
		insertSuccess = b;
	}

	public Integer getProductPerPage() {
		return productPerPage;
	}

	public void setProductPerPage(Integer productPerPage) {
		this.productPerPage = productPerPage;
	}

	public LinksSaveImage getImagesLink() {
		return imagesLink;
	}

	public void setImagesLink(LinksSaveImage imagesLink) {
		this.imagesLink = imagesLink;
	}

	public Message getMessages() {
		return messages;
	}

	public void setMessages(Message messages) {
		this.messages = messages;
	}

	public Integer getCurrentPage(String page) {
		if (page == null || page.isEmpty()) {
			return 1;
		}
		try {
			return Integer.parseInt(page);
		} catch (Exception ex) {
			return 1;

		}
	}

	public Integer getTotalPage(Integer total) {
		if (total == null) {
			return 0;
		}

		Integer totalPage = total / this.productPerPage;
		if ((total % this.productPerPage) != 0) {
			totalPage += 1;
		}
		return totalPage;
	}

	public Integer getViTriBatDau(Integer currentPage) {
		if (currentPage == null) {
			return 0;
		}
		return (currentPage - 1) * this.productPerPage;
	}

	// Save image file on disk
	public boolean saveImageFile(String producer, String nameProduct) {

		if (this.imagesFile == null || this.imagesFileFileName == null) {
			log.info("loi null");
			return false;
		}
		String destPath = this.getDestinationPath(producer, nameProduct);
		File destFile = new File(destPath, this.imagesFileFileName);
		try {
			FileUtils.copyFile(this.imagesFile, destFile);
		} catch (Exception e) {
			log.info("Save on disk unsuccessfully-name: "
					+ this.imagesFileFileName);
			return false;
		}
		log.info("destPath save image: " + destPath);
		log.info("Save on disk successfully-name: " + this.imagesFileFileName);
		log.info("NameProducer: " + producer);
		log.info("Link save on Database: "
				+ this.getImageUploadLink(producer, nameProduct));
		return true;
	}

	
	public List<String> saveMuiltImageFile(String producer, String productName) {
		List<String> saveLinks = new ArrayList<String>();

		String destPath = this.getDestinationPath(producer, productName);
		if (destPath == null || destPath.isEmpty()) {
			return new ArrayList<String>();
		}
		log.info("destination Path: " + destPath);

		for (int i = 0; i < this.file.length; i++) {
			if(fileFileName[i] == null || file[i] == null){
				continue;
			}
			File destFile = new File(destPath, this.fileFileName[i]);
			
			try {
				FileUtils.copyFile(this.file[i], destFile);
			} catch (Exception e) {
				log.info("Save on disk unsuccessfully-name: "
						+ this.fileFileName[i]);
				return new ArrayList<String>();
			}
			log.info("File Name " + (i + 1) + "is: " + getFileFileName()[i]);
			log.info("File ContentType " + (i + 1) + " is: "
					+ getFileContentType()[i]);			
			System.out.println("Files Directory is:"
					+ this.getImageUploadLink(producer, productName,
							this.fileFileName[i]));
			log.info("Save on disk successfully-name: " + this.fileFileName[i]);
			saveLinks.add(this.getImageUploadLink(producer, productName,
					this.fileFileName[i]));
		}

		return saveLinks;
	}

	public String getDestinationPath(String producer, String nameProduct) {
		String destPath = request
				.getSession()
				.getServletContext()
				.getRealPath(
						this.imagesLink.getLink("dir")
								+ this.imagesLink.getLink(producer)
								+ nameProduct
								+ this.imagesLink.getLink("separation"));
		return destPath;
	}

	// Get link( save on database)
	public String getImageUploadLink(String producer, String nameProduct) {
		return this.imagesLink.getLink("dir")
				+ this.imagesLink.getLink(producer) + nameProduct
				+ this.imagesLink.getLink("separation")
				+ this.imagesFileFileName;
	}

	public String getImageUploadLink(String producer, String nameProduct,
			String fileName) {
		return this.imagesLink.getLink("dir")
				+ this.imagesLink.getLink(producer) + nameProduct
				+ this.imagesLink.getLink("separation") + fileName;
	}

	public File getImagesFile() {
		return imagesFile;
	}

	public void setImagesFile(File imagesFile) {
		this.imagesFile = imagesFile;
	}

	public String getImagesFileContentType() {
		return imagesFileContentType;
	}

	public void setImagesFileContentType(String imagesFileContentType) {
		this.imagesFileContentType = imagesFileContentType;
	}

	public String getImagesFileFileName() {
		return imagesFileFileName;
	}

	public void setImagesFileFileName(String imagesFileFileName) {
		this.imagesFileFileName = imagesFileFileName;
	}

	public File[] getFile() {
		return file;
	}

	public void setFile(File[] file) {
		this.file = file;
	}

	public String[] getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String[] fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String[] getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String[] fileFileName) {
		this.fileFileName = fileFileName;
	}

}