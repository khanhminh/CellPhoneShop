package cellphoneshop.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import cellphoneshop.model.LoaiSanPham;
import cellphoneshop.model.NhaSanXuat;
import cellphoneshop.model.SanPham;
import cellphoneshop.service.LoaiSanPhamService;
import cellphoneshop.service.NhaSanXuatService;
import cellphoneshop.service.SanPhamService;

import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class TestProductManagerController extends ActionSupport
		implements ServletRequestAware {
	private HttpServletRequest request;
	
	@Autowired
	private SanPhamService sanPhamService;
	private SanPham sanPham;
	
	@Autowired
	private NhaSanXuatService nhaSanXuatService;
	private List<NhaSanXuat> danhSachNhaSanXuat;
	
	@Autowired
	private LoaiSanPhamService loaiSanPhamService;
	private LoaiSanPham loaiSanPham;
	
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String insertProduct() {
		if (danhSachNhaSanXuat == null) {
			danhSachNhaSanXuat = nhaSanXuatService.getListNhaSanXuat();
			request.setAttribute("danhSachNhaSanXuat", danhSachNhaSanXuat);
		}
		
		if (sanPham != null) {
			final String strMaNhaSanXuat = (String) request.getAttribute("maNhaSanXuat");
			System.out.println("Ma nha san xuat = " + strMaNhaSanXuat);
			if (strMaNhaSanXuat != null) {
				final int maNhaSanXuat = Integer.parseInt(strMaNhaSanXuat);
				for (NhaSanXuat nsx : danhSachNhaSanXuat) {
					if (nsx.getMaNhaSx() == maNhaSanXuat) {
						sanPham.setNhaSanXuat(nsx);
						break;
					}
				}
			}
			
			if (loaiSanPham == null) {
				loaiSanPham = loaiSanPhamService.getLoaiSPTheoId(1);
			}
			sanPham.setLoaiSanPham(loaiSanPham);
			sanPham.setNgayNhap(new Date());
			sanPham.setDiemDanhGiaTb(0f);
			sanPhamService.insertSanPham(sanPham);
		}
		
		return SUCCESS;
	}
	
	public SanPham getSanPham() {
		return sanPham;
	}
	
	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
	
	public void validate() {
		if (sanPham == null) {
			return;
		}
		if (sanPham.getTenSp() == null) {
			addFieldError("sanPham.tenSp", "Vui lòng nhập tên sản phẩm");
		}
		if (sanPham.getTenSp().length() == 0) {
			addFieldError("sanPham.tenSp", "Vui lòng nhập tên sản phẩm");
		}
	}
}
