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
import cellphoneshop.model.PtThanhToan;

@Repository
public class PTThanhToanDAOImpl implements PTThanhToanDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(PTThanhToanDAOImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public boolean insertPTThanhToan(PtThanhToan ptThanhToan) {
		boolean result = false;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(ptThanhToan);
			result = true;
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public PtThanhToan getPTThanhToanTheoId(Integer maPtThanhToan) {
		PtThanhToan result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (PtThanhToan) session.get(PtThanhToan.class, maPtThanhToan);
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public List<PtThanhToan> getListPTThanhToan() {
		List<PtThanhToan> result =  new ArrayList<PtThanhToan>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			Query query = session.createQuery("from PtThanhToan");
			result = query.list();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
