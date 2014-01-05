package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cellphoneshop.model.TrangThaiKhuyenMai;

@Repository
public class TrangThaiKhuyenMaiDAOImpl implements TrangThaiKhuyenMaiDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(TrangThaiKhuyenMaiDAOImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public boolean insertTrangThaiKM(TrangThaiKhuyenMai ttkm) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(ttkm);
			return true;
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return false;
	}

	@Transactional(readOnly = true)
	public TrangThaiKhuyenMai getTrangThaiKM(Integer maTrangThaiKM) {
		TrangThaiKhuyenMai result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (TrangThaiKhuyenMai) session.get(TrangThaiKhuyenMai.class, maTrangThaiKM);
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public TrangThaiKhuyenMai getTrangThaiKM(String tenTrangThaiKM) {
		Session session = sessionFactory.getCurrentSession();
		TrangThaiKhuyenMai result = null;
		
		try {
			String hql = "select t from TrangThaiKhuyenMai as t where t.tenTrangThai like '" + tenTrangThaiKM + "'";
			Query query = session.createQuery(hql);
			result = (TrangThaiKhuyenMai) query.uniqueResult();
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<TrangThaiKhuyenMai> getListTrangThaiKM() {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			return session.createQuery("from TrangThaiKhuyenMai").list();
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return new ArrayList<TrangThaiKhuyenMai>();
	}
}
