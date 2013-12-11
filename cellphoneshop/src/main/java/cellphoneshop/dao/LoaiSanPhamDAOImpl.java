package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cellphoneshop.model.Loaisanpham;

@Repository
public class LoaiSanPhamDAOImpl implements LoaiSanPhamDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public void insertLoaiSP(Loaisanpham loaiSP) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(loaiSP);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Loaisanpham getLoaiSPTheoId(Short maLoaiSP) {
		Loaisanpham result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (Loaisanpham) session.get(Loaisanpham.class, maLoaiSP);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<Loaisanpham> getListLoaiSP() {
		List<Loaisanpham> result = new ArrayList<Loaisanpham>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "from Loaisanpham";
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
		}
		
		return result;
	}

}