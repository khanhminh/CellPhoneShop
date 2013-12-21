package cellphoneshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.SanPham;
import cellphoneshop.service.SanPhamService;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class HomeController extends ActionSupport implements
		ServletRequestAware {

	@Autowired
	private SanPhamService sanPhamService;
	private HttpServletRequest request;

	Logger logger = Logger.getLogger(HomeController.class);
	private int productPerPage;
	
	@Override
	public String execute() throws Exception {
		long totalNewProduct = sanPhamService.demSoSanPhamMoiTrongTuan();
		int totalPage = (int) totalNewProduct / productPerPage;
		if (totalPage * productPerPage < totalNewProduct) {
			totalPage++;
		}

		request.setAttribute("currentPage", 1);
		request.setAttribute("totalPage", totalPage);

		return SUCCESS;
	}

	// ajax lay san pham moi
	public String newProducts() {
		int currentPage = getPage(request.getParameter("page"));
		int start = (currentPage - 1) * productPerPage;
		List<SanPham> newProducts = sanPhamService.getListSanPhamMoiTrongTuan(
				start, productPerPage);

		request.setAttribute("newProducts", newProducts);

		return SUCCESS;
	}

	public String bestSellingProducts() {
		List<SanPham> bestSellingProducts = sanPhamService.getListSanPhamBanChayNhat(productPerPage);
		request.setAttribute("bestSellingProducts", bestSellingProducts);

		return SUCCESS;
	}

	public String about() {
		return SUCCESS;
	}

	public String contact() {
		return SUCCESS;
	}

	public void setProductPerPage(int productPerPage) {
		this.productPerPage = productPerPage;
	}

	private int getPage(String strPage) {
		if (strPage != null && strPage.matches("\\d")) {
			return Integer.parseInt(strPage);
		}

		return 1;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
