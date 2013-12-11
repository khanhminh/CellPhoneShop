package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.Loainguoidung;

@Repository
public class LoaiNguoiDungDAOImpl implements LoaiNguoiDungDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertLoaiNguoiDung(Loainguoidung loaiND) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(loaiND);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Loainguoidung getLoaiNguoiDungTheoId(Short maLoaiND) {
		Loainguoidung result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (Loainguoidung) session.get(Loainguoidung.class, maLoaiND);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<Loainguoidung> getListLoaiNguoiDung() {
		List<Loainguoidung> result = new ArrayList<Loainguoidung>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "from Loainguoidung";
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
