package cellphoneshop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.Nhasanxuat;

@Repository
public class NhaSanXuatImpl implements NhaSanXuatDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public List<Nhasanxuat> getListNhaSanXuat() {
		List<Nhasanxuat> result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "from Nhasanxuat";
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
		
		return result;
	}	
}
