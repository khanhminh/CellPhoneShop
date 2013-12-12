package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cellphoneshop.model.Ctdonhang;

@Repository
public class CTDonHangDAOImpl implements CTDonHangDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertCTDonHang(Ctdonhang ctDonHang) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(ctDonHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Ctdonhang getCTDonHang(Long maCTDonHang) {
		Ctdonhang result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (Ctdonhang) session.get(Ctdonhang.class, maCTDonHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public void updateCTDonHang(Ctdonhang ctDonHang) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(ctDonHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public List<Ctdonhang> getListCTDonHangTheoMaDonHang(Long maDonHang) {
		List<Ctdonhang> result = new ArrayList<Ctdonhang>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select CT from Ctdonhang as CT where CT.donhang.maDonHang = " + maDonHang;
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}