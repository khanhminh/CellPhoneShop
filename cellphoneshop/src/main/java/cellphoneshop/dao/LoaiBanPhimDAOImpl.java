package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.Loaibanphim;

@Repository
public class LoaiBanPhimDAOImpl implements LoaiBanPhimDAO {
	 @Autowired
	 private SessionFactory sessionFactory;
	 
	 public void setSessionFactory(SessionFactory sessionFactory) {
		 this.sessionFactory = sessionFactory;
	 }

	@Transactional
	public void insertLoaiBanPhim(Loaibanphim loaiBP) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(loaiBP);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Loaibanphim getLoaiBanPhimById(Short maLoaiBP) {
		Loaibanphim result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (Loaibanphim) session.get(Loaibanphim.class, maLoaiBP);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
	
	@Transactional(readOnly = true)
	public List<Loaibanphim> getListLoaiBanPhim() {
		List<Loaibanphim> result = new ArrayList<Loaibanphim>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "from Loaibanphim";
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
