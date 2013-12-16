package cellphoneshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.HinhAnhSp;
import cellphoneshop.model.SanPham;

import cellphoneshop.service.HinhAnhSPService;
import cellphoneshop.service.SanPhamService;


import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ProductController extends ActionSupport implements ServletRequestAware{
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private HinhAnhSPService hinhAnhSpService;

	
	private HttpServletRequest request;
	
	public String detail(){
		String productId = request.getParameter("product");
		if (productId == null || !productId.matches("\\d*")){
			return ERROR;
		}
		
		int id = Integer.parseInt(productId);
		SanPham product = sanPhamService.getSanPhamTheoId(id);
		List<HinhAnhSp> images = 
				hinhAnhSpService.getListHinhAnhSPTheoMaCTSP(product.getMaSp());
//		CtSanPham info = 
//				thongSoSpService.getThongSoSmartphoneTheoMaCTSP(product.getMaSp());
		
//		if (product == null || images == null || info == null){
//			return ERROR;
//		}
		
		if (product == null || images == null){
			return ERROR;
		}
		
		request.setAttribute("sp", product);	
		request.setAttribute("images", images);	
//		request.setAttribute("info",info);	
		
		return SUCCESS;
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;		
	}
}
