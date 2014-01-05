package cellphoneshop.dao;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.CtSanPham;

@Repository
public class CTSanPhamDAOImpl implements CTSanPhamDAO {

	@Autowired
	private SessionFactory sessionFactory;
		
	private Logger log = Logger.getLogger(CTSanPhamDAOImpl.class);
	
	public void sessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public boolean insertCTSanPham(CtSanPham ctSanPham) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(ctSanPham);
			result = true;
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public CtSanPham getCTSanPhamTheoId(Integer maCtSP) {
		CtSanPham result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (CtSanPham) session.get(CtSanPham.class, maCtSP);
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public CtSanPham getCTSanPhamTheoMaSP(Integer maSanPham) {
		CtSanPham result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select ct from CtSanPham as ct where ct.sanPham.maSp = " + maSanPham;
			Query query = session.createQuery(hql);
			result = (CtSanPham) query.uniqueResult();
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	public boolean updateCTSanPham(CtSanPham ctSanPham) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(ctSanPham);
			result = true;
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
