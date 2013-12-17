package cellphoneshop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.NguoiDung;
import cellphoneshop.service.HinhAnhSPService;
import cellphoneshop.service.SanPhamService;


import cellphoneshop.viewmodel.ProductDetail;

import com.google.gson.Gson;
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
		
		//boolean result = ng != null ? false : true;
		//returnJsonData(result);

		return "json";
	}
	
	private void returnJsonData(Object obj){
		Gson gson = new Gson();
		String json = gson.toJson(obj);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.write(json);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			
		}
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;		
	}
}
