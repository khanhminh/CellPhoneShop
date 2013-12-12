package cellphoneshop.dao;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.Thongsosmartphone;

@Repository
public class ThongSoSmartphoneDAOImpl implements ThongSoSmartphoneDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertThongSoSmartphone(Thongsosmartphone tsSmartphone) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(tsSmartphone);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + " :" + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Thongsosmartphone getThongSoSmartphoneTheoMaCTSP(Long maChiTietSp) {
		Thongsosmartphone result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select TS from Thongsosmartphone as TS where TS.ctsanpham.maCtsp = " + maChiTietSp;
			Query query = session.createQuery(hql);
			result = (Thongsosmartphone) query.uniqueResult();
			Hibernate.initialize(result.getHedieuhanh());
			Hibernate.initialize(result.getLoaibanphim());
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + " :" + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public void updateThongSoSmartphone(Thongsosmartphone tsSmartphone) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(tsSmartphone);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + " :" + ex.getMessage());
		}
	}
}
