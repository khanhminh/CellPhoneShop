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

import cellphoneshop.model.CtDonHang;

@Repository
public class CTDonHangDAOImpl implements CTDonHangDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(CTDonHangDAOImpl.class);	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public boolean insertCTDonHang(CtDonHang ctDonHang) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(ctDonHang);
			result = true;
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public CtDonHang getCTDonHang(Integer maCTDonHang) {
		CtDonHang result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (CtDonHang) session.get(CtDonHang.class, maCTDonHang);
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public boolean updateCTDonHang(CtDonHang ctDonHang) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(ctDonHang);
			result = true;
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<CtDonHang> getListCTDonHangTheoMaDonHang(Integer maDonHang) {
		List<CtDonHang> result = new ArrayList<CtDonHang>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select CT from CtDonHang as CT where CT.donHang.maDonHang = " + maDonHang;
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public boolean xoaCTDonHang(Integer maDonHang) {
		boolean result = true;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			List<CtDonHang> list = null;
			String hql = "select CT from CtDonHang as CT where CT.donHang.maDonHang=:maDonHang";
			Query query = session.createQuery(hql);
			query.setInteger("maDonHang", maDonHang);
			list = query.list();
			if (list != null){
				for (CtDonHang ctdh : list){
					session.delete(ctdh);
				}
			}
		} catch (Exception ex) {
			result = false;
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}		
		
		return result;
	}
}