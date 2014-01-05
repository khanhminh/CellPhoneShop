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

import cellphoneshop.model.LoaiNguoiDung;

@Repository
public class LoaiNguoiDungDAOImpl implements LoaiNguoiDungDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(LoaiNguoiDungDAOImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public boolean insertLoaiNguoiDung(LoaiNguoiDung loaiND) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(loaiND);
			result = true;
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public LoaiNguoiDung getLoaiNguoiDungTheoId(Integer maLoaiND) {
		LoaiNguoiDung result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (LoaiNguoiDung) session.get(LoaiNguoiDung.class, maLoaiND);
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<LoaiNguoiDung> getListLoaiNguoiDung() {
		List<LoaiNguoiDung> result = new ArrayList<LoaiNguoiDung>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "from LoaiNguoiDung";
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
