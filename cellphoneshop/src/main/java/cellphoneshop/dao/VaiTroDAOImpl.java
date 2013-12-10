package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.Vaitro;

@Repository
public class VaiTroDAOImpl implements VaiTroDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<Vaitro> getListVaiTro() {
		List<Vaitro> list = new ArrayList<Vaitro>();
		Session session = sessionFactory.getCurrentSession();
		try {
			String hql = "from Vaitro";
			Query query = session.createQuery(hql);
			list = query.list();
		} catch (HibernateException ex) {
			System.err.println(ex.getMessage());
		}
		
		return list;
	}

}
