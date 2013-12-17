package cellphoneshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.dao.SanPhamDAO;
import cellphoneshop.model.CtSanPham;
import cellphoneshop.model.ProductDetail;
import cellphoneshop.model.SanPham;
import cellphoneshop.service.SanPhamService;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class HomeController extends ActionSupport implements ServletRequestAware{
	
	@Autowired
	private SanPhamService sanPhamService;
	private HttpServletRequest request;
	Logger logger = Logger.getLogger(HomeController.class);
	
	private int productPerPage = 8;
	
	@Override
	public String execute() throws Exception {
		int currentPage = getPage(request.getParameter("page"));
		long totalNewProduct = sanPhamService.demSoSanPhamMoiTrongTuan();
		int totalPage = (int)totalNewProduct / productPerPage;
		int start = (currentPage - 1) * productPerPage;
		List<SanPham> newProducts = 
				sanPhamService.getListSanPhamMoiTrongTuan(start, productPerPage);
		
		request.setAttribute("newProducts", newProducts);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		
		//test
		ProductDetail pd = sanPhamService.getSanPhamCungChiTietTheoId(1);
		System.out.println(pd.getProduct().getTenSp());
		System.out.println(pd.getProduct().getNhaSanXuat().getTenNhaSx());
		System.out.println(pd.getProduct().getLoaiSanPham().getTenLoaiSp());
		System.out.println(pd.getImages().size());
		System.out.println(pd.getDetail().getChieuCao());
		System.out.println(pd.getDetail().getHeDieuHanh().getTenHdh());
		
		return SUCCESS;
	}
	
	private int getPage(String strPage){
		if (strPage != null &&strPage.matches("\\d")){
			return Integer.parseInt(strPage);
		}
		
		return 1;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;		
	}
}
