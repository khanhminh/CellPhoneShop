package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.PtGiaoHang;

@Repository
public class PTGiaoHangDAOImpl implements PTGiaoHangDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(PTGiaoHangDAOImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertPTGiaoHang(PtGiaoHang ptGiaoHang) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(ptGiaoHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public PtGiaoHang getPTGiaoHang(Integer maPtGiaoHang) {
		PtGiaoHang result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (PtGiaoHang) session.get(PtGiaoHang.class, maPtGiaoHang);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<PtGiaoHang> getListPTGiaoHang() {
		List<PtGiaoHang> result = new ArrayList<PtGiaoHang>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = session.createQuery("from PtGiaoHang").list();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
