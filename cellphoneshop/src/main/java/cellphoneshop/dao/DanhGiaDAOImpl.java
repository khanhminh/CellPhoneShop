package cellphoneshop.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.Danhgia;

@Repository
public class DanhGiaDAOImpl implements DanhGiaDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertDanhGia(Danhgia danhGia) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(danhGia);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Danhgia getDanhGia(Long maSanPham, Integer maNguoiDung) {
		Danhgia result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			 String hql = "select DG from Danhgia DG where DG.id.maSp = :maSanPham and DG.id.maNd = :maNguoiDung";
			 Query query = session.createQuery(hql);
			 query.setLong("maSanPham", maSanPham);
			 query.setInteger("maSanPham", maNguoiDung);
			 result = (Danhgia) query.uniqueResult();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public void updateDanhGia(Danhgia danhGia) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(danhGia);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}
}
