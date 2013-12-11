package cellphoneshop.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import cellphoneshop.model.Sanpham;
import cellphoneshop.service.SanPhamService;
import com.opensymphony.xwork2.ActionSupport;

public class DemoController extends ActionSupport{
	
	/*@Autowired
	private VaiTroService vaiTroService;
	
	public String demo(){
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("list", vaiTroService.getListVaiTro());
		
		return SUCCESS;		
	}*/
	
	@Autowired
	private SanPhamService spService;
	
	public String demo(){
		HttpServletRequest request = ServletActionContext.getRequest();
		
		Date ngayBatDau = new Date();
		ngayBatDau.setDate(10);
		ngayBatDau.setMonth(12);
		ngayBatDau.setYear(2013);
		List<Sanpham> list = spService.getListSanPhamMoi(ngayBatDau, 0, 5);
		request.setAttribute("list",list);
		
		return SUCCESS;		
	}
}
