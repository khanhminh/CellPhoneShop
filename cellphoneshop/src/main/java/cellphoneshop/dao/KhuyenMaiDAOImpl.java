package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cellphoneshop.model.KhuyenMai;

@Repository
public class KhuyenMaiDAOImpl implements KhuyenMaiDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(KhuyenMaiDAOImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public boolean insertKhuyenMai(KhuyenMai khuyenMai) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
		 	session.save(khuyenMai);
		 	return true;
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return false;
	}

	@Transactional(readOnly = true)
	public KhuyenMai getKhuyenMai(Integer maKhuyenMai) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
		 	return (KhuyenMai) session.get(KhuyenMai.class, maKhuyenMai);
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return null;
	}

	@Transactional
	public boolean updateKhuyenMai(KhuyenMai khuyenMai) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(khuyenMai);
		 	return true;
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return false;
	}

	@Transactional(readOnly = true)
	public List<KhuyenMai> getListKhuyenMai() {
		Session session = sessionFactory.getCurrentSession();
		
		try {
		 	return session.createQuery("from KhuyenMai").list();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return new ArrayList<KhuyenMai>();
	}
	
	@Transactional
	public List<KhuyenMai> getListKhuyenMaiChuaDong() {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			return session.createQuery("select k from KhuyenMai as k where k.trangThaiKhuyenMai.maTrangThai = 1").list(); // TODO hard code
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return new ArrayList<KhuyenMai>();
	}
}
