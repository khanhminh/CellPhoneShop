package cellphoneshop.controller;



import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.service.SanPhamService;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class HomeController extends ActionSupport implements ServletRequestAware{
	
	@Autowired
	private SanPhamService sanPhamService;
	private HttpServletRequest request;
	
	private int productPerPage;

	@Override
	public String execute() throws Exception {
		int currentPage = getPage(request.getParameter("page"));
		long totalNewProduct = sanPhamService.demSoSanPhamMoi(null);
		int totalPage = (int)totalNewProduct / productPerPage;
		
		request.setAttribute("newProducts", null);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", null);
		
		return SUCCESS;
	}
	
	private int getPage(String strPage){
		if (strPage.matches("\\d")){
			return Integer.parseInt(strPage);
		}
		
		return 1;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;		
	}
}
