package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.DonHang;

@Repository
public class DonHangDAOImpl implements DonHangDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertDonHang(DonHang donHangMoi) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(donHangMoi);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public DonHang getDonHang(Integer maDonHang) {
		DonHang result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (DonHang) session.get(DonHang.class, maDonHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public void updateDonHang(DonHang donHang) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(donHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public List<DonHang> getListDonHangTheoNguoiDung(int maNguoiDung) {
		List<DonHang> result = new ArrayList<DonHang>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select DH from DonHang as DH where DH.nguoiDung.maNd = " + maNguoiDung;
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
