package cellphoneshop.dao;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.NguoiNhan;

@Repository
public class NguoiNhanDAOImpl implements NguoiNhanDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(PTThanhToanDAOImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public boolean themNguoiNhan(NguoiNhan nguoiNhan) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(nguoiNhan);
			result = true;
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return false;
	}
	
	@Transactional
	public boolean capNhatNguoiNhan(NguoiNhan nguoiNhan) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(nguoiNhan);
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
			return false;
		}
		
		return true;
	}

	@Transactional
	public NguoiNhan getNguoiNhan(Integer maNguoiDung, String hoTenNguoiNhan) {
		NguoiNhan result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select N from NguoiNhan as N where N.nguoiDung.maNd = :maNguoiDung and N.hoTen = :hoTenNguoiNhan";
			Query query = session.createQuery(hql);
			query.setInteger("maNguoiDung", maNguoiDung);
			query.setString("hoTenNguoiNhan", hoTenNguoiNhan);
			result = (NguoiNhan) query.uniqueResult();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public boolean xoaNguoiNhan(NguoiNhan nguoiNhan) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.delete(nguoiNhan);
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
			return false;
		}
		
		return true;
	}
}
