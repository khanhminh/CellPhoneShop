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

	@Transactional
	public Vaitro getVaitro(int maVaiTro) {
		Session session = sessionFactory.getCurrentSession();
		Vaitro vt = (Vaitro) session.get(Vaitro.class, maVaiTro);
		
		return vt;		
	}

	@Transactional
	public Vaitro getVaitro(String tenVaiTro) {
		List<Vaitro> list;
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Vaitro vt where vt.tenVaiTro=:tenVaiTro";
		Query query = session.createQuery(hql);
		query.setParameter("tenVaiTro", tenVaiTro);
		list = query.list();
		if (list.size() > 0){
			return list.get(0);
		}
		else {
			return null;
		}
	}

}
