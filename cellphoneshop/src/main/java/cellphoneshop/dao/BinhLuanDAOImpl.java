package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cellphoneshop.model.Binhluan;

@Repository
public class BinhLuanDAOImpl implements BinhLuanDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertBinhLuan(Binhluan binhLuanMoi) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(binhLuanMoi);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Binhluan getBinhLuan(Long maBinhLuan) {
		Binhluan result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (Binhluan) session.get(Binhluan.class, maBinhLuan);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public void updateBinhLuan(Binhluan binhLuan) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(binhLuan);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public List<Binhluan> getListBinhLuanTheoMaSP(Long maSanPham, int kqDauTien, int soKqToiDa) {
		List<Binhluan> result = new ArrayList<Binhluan>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select BL from Binhluan as BL where BL.sanpham.maSp = " + maSanPham;
			Query query = session.createQuery(hql);
			query.setFirstResult(kqDauTien);
			query.setMaxResults(soKqToiDa);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public int demSoBinhLuanCuaSanPham(Long maSanPham) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select count(*) from Binhluan as BL where BL.sanpham.maSp = " + maSanPham;
			Query query = session.createQuery(hql);
			return ((Long)query.iterate().next()).intValue();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return 0;
	}
}
