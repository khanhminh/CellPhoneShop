package cellphoneshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.Hedieuhanh;
import cellphoneshop.model.Loaibanphim;
import cellphoneshop.model.Loainguoidung;
import cellphoneshop.model.Loaisanpham;
import cellphoneshop.model.Nhasanxuat;
import cellphoneshop.service.HeDieuHanhService;
import cellphoneshop.service.LoaiBanPhimService;
import cellphoneshop.service.LoaiNguoiDungService;
import cellphoneshop.service.LoaiSanPhamService;
import cellphoneshop.service.NhaSanXuatService;
import cellphoneshop.service.VaiTroService;

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
	private HeDieuHanhService hdhService;
	
	@Autowired
	private LoaiBanPhimService loaiBpService;
	
	@Autowired
	private LoaiNguoiDungService loaiNdService;
	
	@Autowired
	private LoaiSanPhamService loaiSpService;
	
	public String demo(){
		HttpServletRequest request = ServletActionContext.getRequest();
		
		List<Hedieuhanh> hdh = hdhService.getListHeDieuHanh();
		List<Loaibanphim> lbp = loaiBpService.getListLoaiBanPhim();
		List<Loainguoidung> lnd = loaiNdService.getListLoaiNguoiDung();
		List<Loaisanpham> lsp = loaiSpService.getListLoaiSP();
		
		for (Hedieuhanh h : hdh) {
			System.out.println(h.getTenHdh());
		}
		for (Loaibanphim b : lbp) {
			System.out.println(b.getTenLoaiBanPhim());
		}
		for (Loainguoidung n : lnd) {
			System.out.println(n.getTenLoaiNd());
		}
		for (Loaisanpham p : lsp) {
			System.out.println(p.getTenLoaiSp());
		}
		
		return SUCCESS;		
	}
}
