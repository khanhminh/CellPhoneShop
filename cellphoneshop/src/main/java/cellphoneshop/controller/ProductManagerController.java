package cellphoneshop.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.LoaiSanPham;
import cellphoneshop.model.NhaSanXuat;
import cellphoneshop.model.SanPham;
import cellphoneshop.service.LoaiSanPhamService;
import cellphoneshop.service.NhaSanXuatService;
import cellphoneshop.service.SanPhamService;

import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class ProductManagerController extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	@Autowired
	private NhaSanXuatService producerService;
	@Autowired
	private SanPhamService productService;
	@Autowired
	private LoaiSanPhamService categoryService;
	
	private SanPham product;
	private List<String> errors;
	private NhaSanXuat emptyProducer;
	private LoaiSanPham productCategory;
	private NhaSanXuat producer;
	private boolean insertSuccess = false;
	private Logger log = Logger.getLogger(ProductManagerController.class);
	
	
	public String insertProduct() {
		String insertNewProductRequest = request.getParameter("themSanPhamFlag"); 
		if (insertNewProductRequest != null && insertNewProductRequest.equals("true")) {
			System.out.println("xxx:" + insertNewProductRequest);
			insertSuccess = false;
			product = null;
		}
		
		List<NhaSanXuat> danhSachNhaSanXuat = producerService.getListNhaSanXuat();
		if (emptyProducer == null) {
			emptyProducer = new NhaSanXuat("Chon mot nha san xuat");
			emptyProducer.setMaNhaSx(-1);
		}
		danhSachNhaSanXuat.add(0, emptyProducer);
		request.setAttribute("danhSachNhaSanXuat", danhSachNhaSanXuat);
		
		if (product == null){
			return INPUT;
		}
		else if (!validateProduct()){
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
		
		
		if (productService.insertSanPham(product)) {
			insertSuccess = true;
			return SUCCESS;
		} else {
			insertSuccess = false;
			errors.add("Loi khong the them san pham vao csdl. Vui long lien he voi nguoi quan tri de kiem tra loi nay");
			return INPUT;
		}
	}
	
	private boolean validateProduct(){		
		errors = new ArrayList<String>();
		
		String tenSp = product.getTenSp().trim();
		if (tenSp == null || tenSp.isEmpty()){
			errors.add("Ten san pham khong hop le");
			return false;
		}
		
		try {
			int maNhaSanXuat = Integer.parseInt(request.getParameter("maNhaSanXuat"));
			if (maNhaSanXuat == -1) {
				errors.add("Ban chua chon nha san xuat");
				return false;
			}
			producer = producerService.getNhaSanXuatTheoId(maNhaSanXuat);
			if (producer == null) {
				errors.add("Khong tim thay nha san xuat");
				return false;
			}
		} catch (NumberFormatException ex) {
			errors.add("Nha san xuat khong hop le");
			return false;
		}
		
		if (product.getGia() == null || product.getGia() < 0) {
			errors.add("Gia san pham khong hop le");
			return false;
		}
		
		if (product.getSoThangBaoHanh() == null || product.getSoThangBaoHanh() < 0) {
			errors.add("So thang bao hanh khong hop le");
			return false;
		}
		
		if (product.getSoLuongHienCo() == null || product.getSoLuongHienCo() < 0) {
			errors.add("So luong hien co khong hop le");
			return false;
		}
		
		if (product.getTongSoLuong() == null || product.getTongSoLuong() < 0) {
			errors.add("Tong so luong khong hop le");
			return false;
		}
		
		if (product.getSoLuongHienCo() > product.getTongSoLuong()) {
			errors.add("So luong hien co phai nho hon tong so luong");
			return false;
		}
		
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
	
	public boolean getInsertSuccess() {
		return insertSuccess;
	}
	
	public void setInsertSucess(boolean b) {
		insertSuccess = b;
	}
}