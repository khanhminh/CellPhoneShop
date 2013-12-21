package cellphoneshop.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.HeDieuHanh;
import cellphoneshop.model.NhaSanXuat;
import cellphoneshop.model.ProductFilter;
import cellphoneshop.model.SanPham;
import cellphoneshop.service.HeDieuHanhService;
import cellphoneshop.service.NhaSanXuatService;
import cellphoneshop.service.SanPhamService;
import cellphoneshop.util.Util;
import cellphoneshop.viewmodel.ProductDetail;
import cellphoneshop.viewmodel.SortBy;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class FilterController  extends ActionSupport implements ServletRequestAware {
	
	private HttpServletRequest request;
	@Autowired
	private HeDieuHanhService hdhService;
	@Autowired
	private NhaSanXuatService nsxService;	
	@Autowired
	private SanPhamService spService;
	
	private static final int DEFAULT_NUMBER_PRODUCT = 10;
	
	private Logger logger = Logger.getLogger(FilterController.class);
	
	private String[] os;
	private String[] brand;
	private String[] price;
	private String[] star;
	private int page = 1;
	private int productPerPage = DEFAULT_NUMBER_PRODUCT;
	private String sortby;	
	
	public String filter(){		
		request.setAttribute("oss", os);
		request.setAttribute("brands", brand);
		request.setAttribute("prices", price);
		request.setAttribute("stars", star);
		request.setAttribute("page", page);
		request.setAttribute("productPerPage", productPerPage);
		request.setAttribute("sortby", sortby);

		SortBy sort = getSortBy();
		List<SanPham> list = new ArrayList<SanPham>();
		int totalPage = 0;
		String query = request.getParameter("query");
		if (query != null && !query.equals("")){
			list = spService.timKiemSanPhamTheoTen(query, 0, productPerPage);
		}
		else {
			ProductFilter filter = createProductFilter();			
			if (filter != null){
				list = spService.getListSanPham(filter, (page - 1) * productPerPage, productPerPage, sort);
				int count = spService.demSoSanPhamKhiGetListSanPham(filter);
				totalPage = count / productPerPage;
				if (totalPage * productPerPage < count){
					totalPage++;
				}
			}
			else {
				list = spService.getListSanPham((page - 1) * productPerPage, productPerPage, sort);
				int count = spService.demSoSanPham();
				totalPage = count / productPerPage;
				if (totalPage * productPerPage < count){
					totalPage++;
				}
			}
		}

		request.setAttribute("listProduct", list);
		request.setAttribute("totalPage", totalPage);
		
		logger.info(sort.getBy() + "_" + sort.isAsc());
		
		price = null;
		brand = null;
		os = null;
		star = null;
		
		return SUCCESS;
	}	
	
	public String compare(){
		String[] products = request.getParameterValues("product");
		if (products != null){
			List<Integer> listId = new ArrayList<Integer>();
			for (String id : products){
				if (Util.tryParseInt(id)){
					listId.add(Integer.parseInt(id));
				}
			}
			List<ProductDetail> listProduct = spService.getCompareList(listId);
			request.setAttribute("listProduct", listProduct);
		}
		
		return SUCCESS;
	}
	
	private ProductFilter createProductFilter(){
		ProductFilter filter = new ProductFilter();
		boolean hasValue = false;
		if (price != null){
			for (String p : price){
				String[] para = p.split("_");
				if (para == null || para.length < 2) continue;
				if (Util.tryParseInt(para[0]) && Util.tryParseInt(para[1])){
					hasValue = true;
					filter.addPriceConstraint(Integer.parseInt(para[0]),
							Integer.parseInt(para[1]));					
				}
			}
		}
		if (os != null){
			for (String o : os){
				if (Util.tryParseInt(o)){
					HeDieuHanh hdh = hdhService.getHeDieuHanhTheoId(Integer.parseInt(o));
					if (hdh != null){
						filter.addOS(hdh);
						hasValue = true;
					}
				}
			}
		}
		if (brand != null){
			for (String b : brand){
				if (Util.tryParseInt(b)){
					NhaSanXuat nsx = nsxService.getNhaSanXuatTheoId(Integer.parseInt(b));
					if (nsx != null){
						filter.addProducer(nsx);
						hasValue = true;
					}
				}
			}
		}
		if (star != null){
			for (String s : star){
				if (Util.tryParseInt(s)){
					filter.addRating(Integer.parseInt(s));
					hasValue = true;
				}
			}
		}
		
		return hasValue ? filter : null;
	}
	
	private SortBy getSortBy(){
		SortBy sb = new SortBy();
		if (sortby != null){
			String[] params = sortby.split("_");
			if (params != null && params.length == 2){
				sb.setBy(params[0]);
				boolean asc = params[1].equalsIgnoreCase("asc") ? true : false;
				sb.setAsc(asc);
			}
		}
		
		return sb;
	}
	
	public String[] getOs() {
		return os;
	}
	
	public void setOs(String[] os) {
		this.os = os;
	}			
	
	public String[] getBrand() {
		return brand;
	}

	public void setBrand(String[] brand) {
		this.brand = brand;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String[] getPrice() {
		return price;
	}

	public void setPrice(String[] price) {
		this.price = price;
	}

	public String[] getStar() {
		return star;
	}

	public void setStar(String[] star) {
		this.star = star;
	}

	public int getPage() {
		return page;
	}

	public void setPage(String strPage) {
		int page = 1;
		if (Util.tryParseInt(strPage)){
			page = Integer.parseInt(strPage);
			page = page < 1 ? 1 : page;
		}
		
		this.page = page;
	}

	public int getProductPerPage() {
		return productPerPage;
	}
	
	public void setProductPerPage(String productPerPage) {	
		int number = DEFAULT_NUMBER_PRODUCT;
		if (Util.tryParseInt(productPerPage)){
			number = Integer.parseInt(productPerPage);
			number = number < DEFAULT_NUMBER_PRODUCT ? DEFAULT_NUMBER_PRODUCT : number;
		}
		this.productPerPage = number;
	}

	public String getSortby() {
		return sortby;
	}

	public void setSortby(String sortby) {
		this.sortby = sortby;
	}	
}
