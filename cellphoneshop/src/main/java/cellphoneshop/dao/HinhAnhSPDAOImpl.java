package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cellphoneshop.model.Hinhanhsp;

@Repository
public class HinhAnhSPDAOImpl implements HinhAnhSPDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertHinhAnhSP(Hinhanhsp hinhSp) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(hinhSp);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional
	public void updateHinhAnhSp(Hinhanhsp hinhSp) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(hinhSp);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public List<Hinhanhsp> getListHinhAnhSPTheoMaCTSP(Long maChiTietSP) {
		List<Hinhanhsp> result = new ArrayList<Hinhanhsp>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select ha from Hinhanhsp as ha where ha.ctsanpham.maCtsp = " + maChiTietSP;
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
