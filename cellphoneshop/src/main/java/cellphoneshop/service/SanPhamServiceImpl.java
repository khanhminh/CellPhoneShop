package cellphoneshop.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.HeDieuHanhDAO;
import cellphoneshop.dao.NhaSanXuatDAO;
import cellphoneshop.dao.SanPhamDAO;
import cellphoneshop.model.CtSanPham;
import cellphoneshop.model.HinhAnhSp;
import cellphoneshop.model.ProductFilter;
import cellphoneshop.viewmodel.ProductDetail;
import cellphoneshop.viewmodel.SortBy;
import cellphoneshop.model.SanPham;

@Service
public class SanPhamServiceImpl implements SanPhamService {

	@Autowired
	private SanPhamDAO spDAO;
	
	@Autowired
	private HeDieuHanhDAO heDieuHanhDAO;
	
	@Autowired
	private NhaSanXuatDAO nhaSXDAO;
	
	
	public boolean insertSanPham(SanPham sp) {
		return spDAO.insertSanPham(sp);
	}

	public SanPham getSanPhamTheoId(Integer maSp) {
		return spDAO.getSanPhamTheoId(maSp);
	}

	public boolean updateSanPham(SanPham sp) {
		return spDAO.updateSanPham(sp);
	}
	
	public List<SanPham> getListSanPhamMoiTrongTuan(int ketQuaDauTien, int soKetQuaToiDa) {
		return spDAO.getListSanPhamTheoNgayNhap(layNgayDauTuan(), new Date(), ketQuaDauTien, soKetQuaToiDa);
	}
	
	public int demSoSanPhamMoiTrongTuan() {
		return (int)spDAO.demSoSanPhamTheoNgayNhap(layNgayDauTuan(), new Date());
	}

	public static Date layNgayDauTuan() {
		Date homNay = new Date();
		Calendar c = Calendar.getInstance(Locale.getDefault());
		
		c.setTime(homNay);
		c.add(Calendar.DAY_OF_MONTH, homNay.getDay() * -1);
		
		homNay = c.getTime();
		return homNay;
	}

	public List<SanPham> timKiemSanPhamTheoTen(String tuKhoa, int kqDauTien,
			int soKqToiDa) {
		return spDAO.timKiemSanPhamTheoTen(tuKhoa, kqDauTien, soKqToiDa);
	}

	public long demSoSanPhamKhiTimKiemTheoTen(String tuKhoa) {
		return spDAO.demSoSanPhamKhiTimKiemTheoTen(tuKhoa);
	}

	public List<SanPham> getListSanPhamTheoLoai(Integer maloai, Integer positionStart,
			Integer amount, String qualification, boolean isAsc) {
		return spDAO.getListSanPhamTheoLoai(maloai, positionStart, amount, qualification, isAsc);
	}

	public List<SanPham> getListSanPhamMoiTrongThang(int ketQuaDauTien,
			int soKetQuaToiDa) {
		Date ngayDauThang = new Date();
		ngayDauThang.setDate(1);
		Date homNay = new Date();
		
		return spDAO.getListSanPhamTheoNgayNhap(ngayDauThang, homNay, ketQuaDauTien, soKetQuaToiDa);
	}

	public int demSoSanPhamMoiTrongThang() {
		Date ngayDauThang = new Date();
		ngayDauThang.setDate(1);
		Date homNay = new Date();
		
		
		return spDAO.demSoSanPhamTheoNgayNhap(ngayDauThang, homNay);
	}

	public ProductDetail getSanPhamCungChiTietTheoId(Integer maSp) {
		SanPham sanPham = spDAO.getSanPhamCungChiTietTheoId(maSp);
		
		if (sanPham == null) {
			return null;
		}
		
		ProductDetail productDetail = new ProductDetail();
		productDetail.setProduct(sanPham);
		
		Iterator itrCtSP  = sanPham.getCtSanPhams().iterator();
		if (itrCtSP.hasNext()) {
			CtSanPham ctSP = (CtSanPham) itrCtSP.next();
			productDetail.setDetail(ctSP);
			
			Iterator itrHinhAnh = ctSP.getHinhAnhSps().iterator();
			while (itrHinhAnh.hasNext()) {
				productDetail.addImage((HinhAnhSp)itrHinhAnh.next());
			}
		}
		
		return productDetail;
	}

	public List<ProductDetail> getCompareList(List<Integer> productIdList) {
		List<ProductDetail> listProductDetails = new ArrayList<ProductDetail>();
		
		if(productIdList == null) {
			return listProductDetails;
		}
		
		for(Integer i : productIdList) {
			ProductDetail productDetail = getSanPhamCungChiTietTheoId(i);
			if(productDetail != null){
				listProductDetails.add(productDetail);
			}
		}
		return listProductDetails;
	}
	
	public ProductFilter layCacTieuChiLocDayDu() {
		ProductFilter productFilter = new ProductFilter();
		
		/*productFilter.osList = heDieuHanhDAO.getListHeDieuHanh();
		productFilter.producerList = nhaSXDAO.getListNhaSanXuat();
		
		productFilter.addRating(1f);
		productFilter.addRating(2f);
		productFilter.addRating(3f);
		productFilter.addRating(4f);
		productFilter.addRating(5f);
		
		//TODO Cau hinh gia ben ngoai
		productFilter.addPriceConstraint(0, 5000000);
		productFilter.addPriceConstraint(5000000, 8000000);
		productFilter.addPriceConstraint(8000000, 10000000);
		productFilter.addPriceConstraint(10000000, 12000000);
		productFilter.addPriceConstraint(12000000, 100000000);*/
		
		return productFilter;
	}
	
	public List<SanPham> getListSanPham(ProductFilter productFilter, int kqDauTien, int soKqToiDa, SortBy sortby) {
		String orderby = "gia";
		if (sortby.getBy().equalsIgnoreCase("price")){
			orderby = "gia";
		}
		else if (sortby.getBy().equalsIgnoreCase("name")){
			orderby = "tenSp";
		}
		
		return spDAO.getListSanPham(productFilter, kqDauTien, soKqToiDa, orderby, sortby.isAsc());
	}
	
	public int demSoSanPhamKhiGetListSanPham(ProductFilter productFilter) {
		return spDAO.demSoSanPhamKhiGetListSanPham(productFilter);
	}

	public List<SanPham> getListSanPham(int kqDauTien, int soKqToiDa, SortBy sortby) {
		String orderby = "gia";
		if (sortby.getBy().equalsIgnoreCase("price")){
			orderby = "gia";
		}
		else if (sortby.getBy().equalsIgnoreCase("name")){
			orderby = "tenSp";
		}else{
			if(sortby.getBy().equalsIgnoreCase("id")){
				orderby = "maSp";
			}
		}
		
		return spDAO.getListSanPham(kqDauTien, soKqToiDa, orderby, sortby.isAsc());
	}
	
	public int demSoSanPham() {
		return spDAO.demSoSanPham();
	}
		
	public List<SanPham> getListSanPhamBanChayNhat(int soSanPham) {
		return spDAO.getListSanPhamBanChayNhat(soSanPham);
	}

	public List<SanPham> getListSanPhamLienQuan(Integer maSanPham) {
		if(maSanPham == null){
			return null;
		}
		
		ProductDetail productDetail = getSanPhamCungChiTietTheoId(maSanPham);
		if(productDetail == null){
			return null;
		}
		
		return spDAO.getListSanPhamLienQuan(maSanPham, productDetail.getProduct().getNhaSanXuat().getMaNhaSx(), 
				productDetail.getDetail().getHeDieuHanh().getMaHdh());
	}

	public List<SanPham> getListSanPham(String order, boolean isAsc) {
		return spDAO.getListSanPham(order, isAsc);
	}
}
