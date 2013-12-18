package cellphoneshop.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.CTDonHangDAO;
import cellphoneshop.dao.DonHangDAO;
import cellphoneshop.dao.NguoiNhanDAO;
import cellphoneshop.dao.NguoidungDAO;
import cellphoneshop.dao.TrangThaiDonHangDAO;
import cellphoneshop.model.CartItem;
import cellphoneshop.model.CtDonHang;
import cellphoneshop.model.DonHang;
import cellphoneshop.model.NguoiDung;
import cellphoneshop.model.NguoiNhan;
import cellphoneshop.model.PtGiaoHang;
import cellphoneshop.model.PtThanhToan;
import cellphoneshop.model.TrangThaiDonHang;

@Service
public class DonHangServiceImpl implements DonHangService {
	@Autowired
	private DonHangDAO donHangDAO;

	@Autowired
	private NguoidungDAO nguoidungDAO;
	
	@Autowired
	private TrangThaiDonHangDAO trangThaiDonHangDAO;

	@Autowired
	private NguoiNhanDAO nguoiNhanDAO;
	
	@Autowired
	private CTDonHangDAO ctDonHangDAO;
	
	public void insertDonHang(DonHang donHangMoi) {
		donHangDAO.insertDonHang(donHangMoi);
	}

	public DonHang getDonHang(Integer maDonHang) {
		return donHangDAO.getDonHang(maDonHang);
	}

	public void updateDonHang(DonHang donHang) {
		donHangDAO.updateDonHang(donHang);
	}


	public Integer checkOut(Integer maND, List<CartItem> cartItemList,
			NguoiNhan nguoiNhan, PtThanhToan ptThanhToan, PtGiaoHang ptGiaoHang) {
		
		NguoiDung nguoiDung = nguoidungDAO.getNguoiDung(maND);
		if (nguoiDung == null) {
			return -1;
		}
		
		if(cartItemList == null || nguoiNhan == null || ptThanhToan == null || ptGiaoHang == null){
			return -1;
		}
		
		if (nguoiNhanDAO.getNguoiNhan(maND, nguoiNhan.getHoTen()) == null) {
			nguoiNhan.setNguoiDung(nguoiDung);
			nguoiNhanDAO.themNguoiNhan(nguoiNhan);
		}
		
		// Chen don hang
		DonHang donHang = new DonHang();
		donHang.setPtGiaoHang(ptGiaoHang);
		donHang.setPtThanhToan(ptThanhToan);
		donHang.setNguoiNhan(nguoiNhan);
		donHang.setNguoiDung(nguoiDung);
		Date ngayDatHang = new Date();
		donHang.setNgayDatHang(ngayDatHang);
		
		Integer sumPrice = 0;
		for(CartItem iCartItem : cartItemList){
			sumPrice += iCartItem.getProduct().getGia() * iCartItem.getCount();
		}
		
		donHang.setTongGiaTri(sumPrice);
		//TODO Sua lai lay trang thai don hang theo ten
		TrangThaiDonHang trangThaiDonHang = trangThaiDonHangDAO.getTrangThaiDonHang(1);
		donHang.setTrangThaiDonHang(trangThaiDonHang);
		
		donHangDAO.insertDonHang(donHang);
		
		// chen chi tiet don hang
		for (CartItem item : cartItemList) {
			Integer tongGiaTri = item.getProduct().getGia() * item.getCount();
			CtDonHang ct = new CtDonHang(item.getProduct(), donHang, item.getProduct().getGia(), 0, item.getCount(), tongGiaTri);
			ctDonHangDAO.insertCTDonHang(ct);
		}
		
		return donHang.getMaDonHang();
	}

	public DonHang getDonHangCungChiTietTheoId(Integer maDonHang) {
		return donHangDAO.getDonHangCungChiTietTheoId(maDonHang);
	}

	public List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung,
			boolean isAsc, Integer maStatus, int kqDautien, int kqToiDa) {
		return donHangDAO.getListDonHangTheoNguoiDung(maNguoiDung, isAsc, maStatus, kqDautien, kqToiDa);
	}
}
