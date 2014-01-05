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

import cellphoneshop.model.LoaiSanPham;

@Repository
public class LoaiSanPhamDAOImpl implements LoaiSanPhamDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	private Logger log = Logger.getLogger(LoaiSanPhamDAOImpl.class);
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public boolean insertLoaiSP(LoaiSanPham loaiSP) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(loaiSP);
			result = true;
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + " : " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public LoaiSanPham getLoaiSPTheoId(Integer maLoaiSP) {
		LoaiSanPham result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (LoaiSanPham) session.get(LoaiSanPham.class, maLoaiSP);
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + " : " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<LoaiSanPham> getListLoaiSP() {
		List<LoaiSanPham> result = new ArrayList<LoaiSanPham>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "from LoaiSanPham";
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			log.warn(ex.getClass().getName() + " : " + ex.getMessage());
		}
		
		return result;
	}

}