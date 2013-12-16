package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cellphoneshop.model.CtDonHang;

@Repository
public class CTDonHangDAOImpl implements CTDonHangDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertCTDonHang(CtDonHang ctDonHang) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(ctDonHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public CtDonHang getCTDonHang(Integer maCTDonHang) {
		CtDonHang result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (CtDonHang) session.get(CtDonHang.class, maCTDonHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public void updateCTDonHang(CtDonHang ctDonHang) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(ctDonHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public List<CtDonHang> getListCTDonHangTheoMaDonHang(Integer maDonHang) {
		List<CtDonHang> result = new ArrayList<CtDonHang>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select CT from CtDonHang as CT where CT.donHang.maDonHang = " + maDonHang;
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}