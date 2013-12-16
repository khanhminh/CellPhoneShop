package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.HeDieuHanh;

@Repository
public class HeDieuHanhDAOImpl implements HeDieuHanhDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public void insertHeDieuHanh(HeDieuHanh hdh) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(hdh);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public HeDieuHanh getHeDieuHanhTheoId(Integer maHDH) {
		HeDieuHanh result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (HeDieuHanh) session.get(HeDieuHanh.class, maHDH);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<HeDieuHanh> getListHeDieuHanh() {
		List<HeDieuHanh> result = new ArrayList<HeDieuHanh>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "from HeDieuHanh";
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
		}
		
		return result;
	}

}