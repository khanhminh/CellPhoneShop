package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import cellphoneshop.model.Ptgiaohang;

@Repository
public class PTGiaoHangDAOImpl implements PTGiaoHangDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertPTGiaoHang(Ptgiaohang ptGiaoHang) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(ptGiaoHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Ptgiaohang getPTGiaoHang(Short maPtGiaoHang) {
		Ptgiaohang result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (Ptgiaohang) session.get(Ptgiaohang.class, maPtGiaoHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<Ptgiaohang> getListPTGiaoHang() {
		List<Ptgiaohang> result = new ArrayList<Ptgiaohang>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = session.createQuery("from Ptgiaohang").list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
