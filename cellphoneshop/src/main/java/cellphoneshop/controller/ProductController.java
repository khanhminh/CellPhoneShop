package cellphoneshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.Hinhanhsp;
import cellphoneshop.model.Sanpham;
import cellphoneshop.model.Thongsosmartphone;
import cellphoneshop.service.HinhAnhSPService;
import cellphoneshop.service.SanPhamService;
import cellphoneshop.service.ThongSoSmartphoneService;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ProductController extends ActionSupport implements ServletRequestAware{
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private HinhAnhSPService hinhAnhSpService;
	@Autowired 
	private ThongSoSmartphoneService thongSoSpService;
	
	private HttpServletRequest request;
	
	public String search(){
		
		return SUCCESS;
	}
	
	public String detail(){
		String productId = request.getParameter("product");
		if (productId == null || !productId.matches("\\d*")){
			return ERROR;
		}
		
		long id = Long.parseLong(productId);
		Sanpham product = sanPhamService.getSanPhamTheoId(id);
		List<Hinhanhsp> images = 
				hinhAnhSpService.getListHinhAnhSPTheoMaCTSP(product.getMaSp());
		Thongsosmartphone info = 
				thongSoSpService.getThongSoSmartphoneTheoMaCTSP(product.getMaSp());
		
		if (product == null || images == null || info == null){
			return ERROR;
		}
		
		request.setAttribute("sp", product);	
		request.setAttribute("images", images);	
		request.setAttribute("info",info);	
		
		return SUCCESS;
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;		
	}
}
