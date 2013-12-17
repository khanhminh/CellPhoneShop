package cellphoneshop.dao;

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
	
	public void sessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertCTSanPham(CtSanPham ctSanPham) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(ctSanPham);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public CtSanPham getCTSanPhamTheoId(Integer maCtSP) {
		CtSanPham result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (CtSanPham) session.get(CtSanPham.class, maCtSP);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
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
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	public void updateCTSanPham(CtSanPham ctSanPham) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(ctSanPham);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}
}
