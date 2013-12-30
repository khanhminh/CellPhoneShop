package cellphoneshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.SanPham;
import cellphoneshop.service.NhaSanXuatService;
import cellphoneshop.util.Util;

import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class ProductManagerController extends ActionSupport implements ServletRequestAware{
	
	private HttpServletRequest request;
	private SanPham sanPham;
	private List<String> errors;
	Logger log = Logger.getLogger(ProductManagerController.class);
	
	@Autowired
	private NhaSanXuatService nhaSanXuatService;
	
	public String insertProduct(){
		request.setAttribute("danhSachNhaSanXuat", nhaSanXuatService.getListNhaSanXuat());
		if (sanPham == null){
			return INPUT;
		}
		else if (!validateProduct()){
			request.setAttribute("errors", errors);
			return INPUT;
		}
		
		// productService.insert(sanpham)
		//test
		log.info("Ten Sp: " + sanPham.getTenSp());
		log.info("Ma NSX: " + request.getParameter("maNhaSanXuat"));
		
		return SUCCESS;
	}
	
	private boolean validateProduct(){		
		errors = new ArrayList<String>();
		String tenSp = sanPham.getTenSp().trim();
		if (tenSp == null || tenSp.equals("")){
			errors.add("Ten san pham khong hop le");
			return false;
		}
		
		String maNSX = request.getParameter("maNhaSanXuat");
		if (!Util.tryParseInt(maNSX)){
			errors.add("nha san xuat khong hop le");
			return false;
		}
		//...
		
		return true;
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}	
	
	public SanPham getSanPham() {
		return sanPham;
	}
	
	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
}
