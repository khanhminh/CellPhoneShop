package cellphoneshop.controller;

import java.io.EOFException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.BinhLuan;
import cellphoneshop.model.NguoiDung;
import cellphoneshop.model.SanPham;
import cellphoneshop.security.SecurityHelper;
import cellphoneshop.service.BinhLuanService;
import cellphoneshop.service.DanhGiaService;
import cellphoneshop.service.SanPhamService;
import cellphoneshop.util.JsonHandler;
import cellphoneshop.util.Util;
import cellphoneshop.viewmodel.ProductDetail;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ProductController extends ActionSupport implements ServletRequestAware{
	
	private final int RATING_SUCCESS = 1;
	private final int RATING_FAIL = -1;
	private final int NO_LOGIN = 0;
	
	private static final String JSON = "json";
	
	@Autowired
	private SanPhamService sanPhamService;
	@Autowired
	private DanhGiaService danhGiaService;
	@Autowired
	private BinhLuanService binhLuanService;
	

	
	private HttpServletRequest request;
	
	public String detail(){
		String productId = request.getParameter("product");
		if (productId == null || !productId.matches("\\d*")){
			return ERROR;
		}
		
		int id = Integer.parseInt(productId);
		ProductDetail detail = sanPhamService.getSanPhamCungChiTietTheoId(id);		
		if (detail == null){
			return ERROR;
		}
		
		request.setAttribute("detail", detail);	
		
		return SUCCESS;
	}
	
	public String compare(){
		
		return SUCCESS;
	}
	
	public String rating(){		
		Integer result = RATING_SUCCESS;
		NguoiDung user = SecurityHelper.getUser();
		if (user != null){
			String strId = request.getParameter("id");		
			String strNumber = request.getParameter("number");	
			if (Util.tryParseInt(strId) &&
					Util.tryParseInt(strNumber)){
				int id = Integer.parseInt(strId);
				int number = Integer.parseInt(strNumber);
				
				try {
					danhGiaService.insertDanhGia(user, id, number);
				} catch (Exception e) {
					result = RATING_FAIL;
				}
			}
		}
		else {
			result = NO_LOGIN;
		}
		JsonHandler.writeJson(result);		

		return JSON;
	}
	
	public String sendComment(){
		Integer result = RATING_SUCCESS;
		NguoiDung user = SecurityHelper.getUser();
		if (user != null){
			String strId = request.getParameter("id");		
			String msg = request.getParameter("msg");	
			if (Util.tryParseInt(strId)){
				int id = Integer.parseInt(strId);				
				try {
					SanPham sp = sanPhamService.getSanPhamTheoId(id);
					BinhLuan bl = new BinhLuan(sp, user, msg, new Date());
					binhLuanService.insertBinhLuan(bl);
				} catch (Exception e) {
					result = RATING_FAIL;
				}
			}
		}
		else {
			result = NO_LOGIN;
		}
		JsonHandler.writeJson(result);		
		
		return JSON;
	}
	
	public String getComments(){
		String strId = request.getParameter("id");
		if (Util.tryParseInt(strId)){
			int id = Integer.parseInt(strId);				
			List<BinhLuan> list = binhLuanService.getListBinhLuanTheoMaSP(id, 0, 10);
			request.setAttribute("list", list);
			
			return SUCCESS;
		}
				
		return ERROR;
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;		
	}
}
