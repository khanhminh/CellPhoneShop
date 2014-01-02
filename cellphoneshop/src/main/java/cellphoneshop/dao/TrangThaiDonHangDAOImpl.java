package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.TrangThaiDonHang;

@Repository
public class TrangThaiDonHangDAOImpl implements TrangThaiDonHangDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(TrangThaiDonHangDAOImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public boolean insertTrangThaiDonHang(TrangThaiDonHang ttDonHang) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(ttDonHang);
			result = true;
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public TrangThaiDonHang getTrangThaiDonHang(Integer maTrangThai) {
		TrangThaiDonHang result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (TrangThaiDonHang) session.get(TrangThaiDonHang.class, maTrangThai);
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<TrangThaiDonHang> getListTrangThaiDonHang() {
		List<TrangThaiDonHang> result = new ArrayList<TrangThaiDonHang>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = session.createQuery("from TrangThaiDonHang").list();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
