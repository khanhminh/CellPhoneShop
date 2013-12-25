package cellphoneshop.service;

import java.util.ArrayList;
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
import cellphoneshop.model.TrangThaiDonHang;
import cellphoneshop.util.Util;
import cellphoneshop.viewmodel.SortBy;

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


	public Integer checkOut(Integer maND, List<CartItem> cartItemList, DonHang donHang) {
		
		NguoiDung nguoiDung = nguoidungDAO.getNguoiDung(maND);
		if (nguoiDung == null) {
			return -1;
		}
		
		if(cartItemList == null || 
				donHang.getNguoiNhan() == null || 
				donHang.getPtThanhToan() == null || 
				donHang.getPtGiaoHang() == null){
			return -1;
		}
		
		NguoiNhan nguoiNhan = donHang.getNguoiNhan();
		if (nguoiNhanDAO.getNguoiNhan(maND, nguoiNhan.getHoTen()) == null) {
			nguoiNhan.setNguoiDung(nguoiDung);
			nguoiNhanDAO.themNguoiNhan(nguoiNhan);
		}
		
		// Chen don hang
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

	public List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung) {
		return donHangDAO.getListDonHangTheoNguoiDung(maNguoiDung);
	}
	
	public List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung, Integer maStatus){
		return donHangDAO.getListDonHangTheoNguoiDung(maNguoiDung, maStatus);
	}

	public List<DonHang> getListDonHang(Integer maStatus, SortBy sortby, int start, int count) {
		
		TrangThaiDonHang ttdh = trangThaiDonHangDAO.getTrangThaiDonHang(maStatus);
		if (ttdh == null){
			return donHangDAO.getListDonHang(sortby.getBy(), sortby.isAsc(), start, count);
		}		
		
		return donHangDAO.getListDonHang(maStatus, sortby.getBy(), sortby.isAsc(), start, count);
	}

	public int demoSoDonHang(Integer maStatus) {
		TrangThaiDonHang ttdh = trangThaiDonHangDAO.getTrangThaiDonHang(maStatus);
		if (ttdh == null){
			return donHangDAO.demSoDonHang();
		}		
		
		return donHangDAO.demSoDonHang(maStatus);		
	}

	public boolean xoaDonHang(Integer maDonHang) {
		
		if (ctDonHangDAO.xoaCTDonHang(maDonHang)){
			return donHangDAO.xoaDonHang(maDonHang);
		}
		
		return false;
	}

	public boolean capnhatDonHang(DonHang donHang) {
		DonHang oldOrder = donHangDAO.getDonHangCungChiTietTheoId(donHang.getMaDonHang());
		if (oldOrder != null){
			NguoiNhan nguoinhan = donHang.getNguoiNhan();
			oldOrder.getNguoiNhan().setDiaChi(nguoinhan.getDiaChi());
			oldOrder.getNguoiNhan().setHoTen(nguoinhan.getHoTen());
			oldOrder.getNguoiNhan().setSoDienThoai(nguoinhan.getSoDienThoai());
			if (nguoiNhanDAO.capNhatNguoiNhan(oldOrder.getNguoiNhan())){
				oldOrder.setTrangThaiDonHang(donHang.getTrangThaiDonHang());
				oldOrder.setPtGiaoHang(donHang.getPtGiaoHang());
				oldOrder.setPtThanhToan(donHang.getPtThanhToan());
				
				return donHangDAO.updateDonHang(oldOrder);
			}			
			else {
				return false;
			}			
		}
		
		return false;
	}

	public List<DonHang> getListDonHang(String key, String option, int start,
			int view) {
		
		if (key == null || option == null){
			return null;
		}
		List<DonHang> result = new ArrayList<DonHang>();
		
		if (option.equalsIgnoreCase("id_order") && Util.tryParseInt(key)){
			int id = Integer.parseInt(key);
			DonHang dh = donHangDAO.getDonHang(id);
			if (dh != null){
				result.add(dh);
			}
		}
		else if (option.equalsIgnoreCase("id") ||
				option.equalsIgnoreCase("email")){
			List<NguoiDung> list = nguoidungDAO.getListNguoiDung(key, option, 0, 1);
			if (list != null && list.size() > 0){
				NguoiDung nd = list.get(0);
				result = donHangDAO.getListDonHangTheoNguoiDung(nd.getMaNd(), start, view);
			}
		}
		
		return result;
	}

	public int demSoDonHang(String key, String option) {
		if (key == null || option == null){
			return 0;
		}
		int result = 0;
		
		if (option.equalsIgnoreCase("id_order") && Util.tryParseInt(key)){
			int id = Integer.parseInt(key);
			DonHang dh = donHangDAO.getDonHang(id);
			if (dh != null){
				result = 1;
			}
		}
		else if (option.equalsIgnoreCase("id") ||
				option.equalsIgnoreCase("email")){
			List<NguoiDung> list = nguoidungDAO.getListNguoiDung(key, option, 0, 1);
			if (list != null && list.size() > 0){
				NguoiDung nd = list.get(0);
				result = donHangDAO.demSoDonHangTheoNguoiDung(nd.getMaNd());
			}
		}
		
		return result;
	}
}
