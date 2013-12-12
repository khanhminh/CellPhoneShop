package cellphoneshop.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cellphoneshop.model.Ctsanpham;

@Repository
public class CTSanPhamDAOImpl implements CTSanPhamDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void sessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertCTSanPham(Ctsanpham ctSanPham) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(ctSanPham);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Ctsanpham getCTSanPhamTheoId(Long maCtSP) {
		Ctsanpham result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (Ctsanpham) session.get(Ctsanpham.class, maCtSP);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public Ctsanpham getCTSanPhamTheoMaSP(Long maSanPham) {
		Ctsanpham result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select ct from Ctsanpham as ct where ct.sanpham.maSp = " + maSanPham;
			Query query = session.createQuery(hql);
			result = (Ctsanpham) query.uniqueResult();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	public void updateCTSanPham(Ctsanpham ctSanPham) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(ctSanPham);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}
}
