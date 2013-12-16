package cellphoneshop.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.SanPhamDAO;
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
}
