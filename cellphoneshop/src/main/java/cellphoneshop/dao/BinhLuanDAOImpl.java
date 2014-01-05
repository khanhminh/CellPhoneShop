package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.BinhLuan;

@Repository
public class BinhLuanDAOImpl implements BinhLuanDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(BinhLuanDAOImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public boolean insertBinhLuan(BinhLuan binhLuanMoi) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(binhLuanMoi);
			return true;
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return false;
	}

	@Transactional(readOnly = true)
	public BinhLuan getBinhLuan(Integer maBinhLuan) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			return (BinhLuan) session.get(BinhLuan.class, maBinhLuan);
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return null;
	}

	@Transactional
	public boolean updateBinhLuan(BinhLuan binhLuan) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(binhLuan);
			return true;
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return false;
	}

	@Transactional(readOnly = true)
	public List<BinhLuan> getListBinhLuanTheoMaSP(Integer maSanPham, int kqDauTien, int soKqToiDa) {
		List<BinhLuan> result = new ArrayList<BinhLuan>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select BL from BinhLuan as BL where BL.sanPham.maSp = " + maSanPham + " order by BL.maBinhLuan desc";
			Query query = session.createQuery(hql);
			query.setFirstResult(kqDauTien);
			query.setMaxResults(soKqToiDa);
			result = query.list();
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public int demSoBinhLuanCuaSanPham(Integer maSanPham) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select count(*) from BinhLuan as BL where BL.sanPham.maSp = " + maSanPham;
			Query query = session.createQuery(hql);
			return ((Long)query.iterate().next()).intValue();
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return 0;
	}

	@Transactional
	public boolean deleteBinhLuan(BinhLuan binhLuan) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.delete(binhLuan);
			return true;
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return false;
	}
}
