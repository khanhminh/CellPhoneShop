package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.Donhang;

@Repository
public class DonHangDAOImpl implements DonHangDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertDonHang(Donhang donHangMoi) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(donHangMoi);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Donhang getDonHang(Long maDonHang) {
		Donhang result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (Donhang) session.get(Donhang.class, maDonHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public void updateDonHang(Donhang donHang) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(donHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public List<Donhang> getListDonHangTheoNguoiDung(int maNguoiDung) {
		List<Donhang> result = new ArrayList<Donhang>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select DH from Donhang as DH where DH.nguoidung.maNd = " + maNguoiDung;
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
