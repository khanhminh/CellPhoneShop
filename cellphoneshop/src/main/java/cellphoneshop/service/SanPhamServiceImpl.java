package cellphoneshop.service;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.SanPhamDAO;
import cellphoneshop.model.CtSanPham;
import cellphoneshop.model.HinhAnhSp;
import cellphoneshop.model.ProductDetail;
import cellphoneshop.model.SanPham;

@Service
public class SanPhamServiceImpl implements SanPhamService {

	@Autowired
	private SanPhamDAO spDAO;
	
	public void insertSanPham(SanPham sp) {
		spDAO.insertSanPham(sp);
	}

	public SanPham getSanPhamTheoId(Integer maSp) {
		return spDAO.getSanPhamTheoId(maSp);
	}

	public void updateSanPham(SanPham sp) {
		spDAO.updateSanPham(sp);
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
}
