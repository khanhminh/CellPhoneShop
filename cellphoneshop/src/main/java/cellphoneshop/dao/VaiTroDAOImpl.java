package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.VaiTro;

@Repository
public class VaiTroDAOImpl implements VaiTroDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Logger log = Logger.getLogger(VaiTroDAOImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<VaiTro> getListVaiTro() {
		List<VaiTro> list = new ArrayList<VaiTro>();
		Session session = sessionFactory.getCurrentSession();
		try {
			String hql = "from VaiTro";
			Query query = session.createQuery(hql);
			list = query.list();
		} catch (HibernateException ex) {
			log.warn(ex.getMessage());
		}
		
		return list;
	}

	@Transactional
	public VaiTro getVaitro(int maVaiTro) {
		Session session = sessionFactory.getCurrentSession();
		VaiTro vt = (VaiTro) session.get(VaiTro.class, maVaiTro);
		
		return vt;		
	}

	@Transactional
	public VaiTro getVaitro(String tenVaiTro) {
		List<VaiTro> list;
		Session session = sessionFactory.getCurrentSession();
		String hql = "from VaiTro vt where vt.tenVaiTro=:tenVaiTro";
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

	@Transactional
	public VaiTro getVaiTro(Integer maVaiTro) {
		List<VaiTro> list;
		Session session = sessionFactory.getCurrentSession();
		String hql = "from VaiTro vt where vt.maVaiTro=:maVaiTro";
		Query query = session.createQuery(hql);
		query.setInteger("maVaiTro", maVaiTro);
		list = query.list();
		if (list.size() > 0){
			return list.get(0);
		}
		else {
			return null;
		}
	}

}
