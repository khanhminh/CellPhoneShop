package cellphoneshop.service;

import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.KhuyenMaiDAO;
import cellphoneshop.dao.SanPhamDAO;
import cellphoneshop.model.KhuyenMai;
import cellphoneshop.model.SanPham;

@Service
public class KhuyenMaiServiceImpl implements KhuyenMaiService {
	@Autowired
	private KhuyenMaiDAO khuyenMaiDAO;
	@Autowired
	private SanPhamDAO sanPhamDAO;
	private Logger log = Logger.getLogger(KhuyenMaiServiceImpl.class);

	public boolean insertKhuyenMai(KhuyenMai khuyenMai) {
		return khuyenMaiDAO.insertKhuyenMai(khuyenMai);
	}

	public KhuyenMai getKhuyenMai(Integer maKhuyenMai) {
		return khuyenMaiDAO.getKhuyenMai(maKhuyenMai);
	}

	public boolean updateKhuyenMai(KhuyenMai khuyenMai) {
		return khuyenMaiDAO.updateKhuyenMai(khuyenMai);
	}

	public List<KhuyenMai> getListKhuyenMai() {
		return khuyenMaiDAO.getListKhuyenMai();
	}

	public List<KhuyenMai> getListKhuyenMaiChuaDong() {
		return khuyenMaiDAO.getListKhuyenMaiChuaDong();
	}

	public List<KhuyenMai> getListKhuyenMai(Integer vitriBD, Integer soluongKM) {
		return khuyenMaiDAO.getListKhuyenMai(vitriBD, soluongKM);
	}

	public Integer countKhuyenMai() {
		return khuyenMaiDAO.countKhuyenMai();
	}

	public List<KhuyenMai> getListKhuyenMail(String query, String option,
			Integer vitriBD, Integer soluongKM) {
		return khuyenMaiDAO
				.getListKhuyenMail(query, option, vitriBD, soluongKM);
	}

	public Integer countKhuyenMail(String value, String option) {
		return khuyenMaiDAO.countKhuyenMail(value, option);
	}

	public boolean ApdungKhuyenMaiChoSanPham(Integer maSp, Integer maKm) {
		if (maSp == null || maKm == null) {
			return false;
		}

		KhuyenMai khuyenmai = khuyenMaiDAO.getKhuyenMai(maKm);
		SanPham sp = sanPhamDAO.getSanPhamTheoId(maSp);

		if (khuyenmai == null || sp == null) {
			return false;
		}

		try {

			Iterator<SanPham> iterator = khuyenmai.getSanPhams().iterator();
			while (iterator.hasNext()) {
				SanPham sanpham = (SanPham) iterator.next();
				if (sanpham.getMaSp().intValue() == maSp) {
					return false;
				}
			}

			khuyenmai.getSanPhams().add(sp);
		} catch (Exception e) {
			log.error("Loi trong ap dung khuyen mai cho san pham" + e.getMessage());
			return false;
		}
		return khuyenMaiDAO.updateKhuyenMai(khuyenmai);

	}

	public boolean HuyApDungKhuyenMaiChoSanPham(Integer masP, Integer maKm) {
		if(masP == null || maKm == null){
			return false;
		}
		KhuyenMai khuyenMai = khuyenMaiDAO.getKhuyenMai(maKm);
		SanPham sp = sanPhamDAO.getSanPhamTheoId(masP);
		
		if(sp == null || khuyenMai == null){
			return false;
		}
		
		Iterator iterator = khuyenMai.getSanPhams().iterator();
		while(iterator.hasNext()){
			SanPham sanPham = (SanPham) iterator.next();
			if(sanPham.getMaSp() == masP){
				khuyenMai.getSanPhams().remove(sanPham);
				return khuyenMaiDAO.updateKhuyenMai(khuyenMai);
			}
		}
		
		return false;
	}

}
