package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.Trangthaidonhang;

@Repository
public class TrangThaiDonHangDAOImpl implements TrangThaiDonHangDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertTrangThaiDonHang(Trangthaidonhang ttDonHang) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(ttDonHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Trangthaidonhang getTrangThaiDonHang(Short maTrangThai) {
		Trangthaidonhang result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (Trangthaidonhang) session.get(Trangthaidonhang.class, maTrangThai);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<Trangthaidonhang> getListTrangThaiDonHang() {
		List<Trangthaidonhang> result = new ArrayList<Trangthaidonhang>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = session.createQuery("from Trangthaidonhang").list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
