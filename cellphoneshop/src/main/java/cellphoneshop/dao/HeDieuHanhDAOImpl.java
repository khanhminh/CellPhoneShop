package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.Hedieuhanh;

@Repository
public class HeDieuHanhDAOImpl implements HeDieuHanhDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public void insertHeDieuHanh(Hedieuhanh hdh) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(hdh);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Hedieuhanh getHeDieuHanhTheoId(Short maHDH) {
		Hedieuhanh result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (Hedieuhanh) session.get(Hedieuhanh.class, maHDH);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<Hedieuhanh> getListHeDieuHanh() {
		List<Hedieuhanh> result = new ArrayList<Hedieuhanh>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "from Hedieuhanh";
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
		}
		
		return result;
	}

}