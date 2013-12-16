package cellphoneshop.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import cellphoneshop.model.Sanpham;
import cellphoneshop.service.SanPhamService;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class HomeController extends ActionSupport implements ServletRequestAware{
	
	@Autowired
	private SanPhamService sanPhamService;
	private HttpServletRequest request;
	
	private int productPerPage = 8;
	
	@Override
	public String execute() throws Exception {
		int currentPage = getPage(request.getParameter("page"));
		long totalNewProduct = sanPhamService.demSoSanPhamMoiTrongTuan();
		int totalPage = (int)totalNewProduct / productPerPage;
		int start = (currentPage - 1) * productPerPage;
		List<Sanpham> newProducts = 
				sanPhamService.getListSanPhamMoiTrongTuan(start, productPerPage);
		
		request.setAttribute("newProducts", newProducts);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		
		return SUCCESS;
	}
	
	public String about(){
		
		return SUCCESS;
	}
	
	public String contact(){
		
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
