package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.DanhSachMongMuon;
import cellphoneshop.model.SanPham;

@Repository
public class DSMongMuonDAOImpl implements DSMongMuonDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(DSMongMuonDAOImpl.class);
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertDSMongMuon(DanhSachMongMuon dsmm) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(dsmm);
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public List<DanhSachMongMuon> getListDSMongMuon(Integer maNguoiDung) {
		List<DanhSachMongMuon> result = new ArrayList<DanhSachMongMuon>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select D from DanhSachMonMuon D where D.nguoiDung.maNd = " + maNguoiDung;
			Query query = session.createQuery(hql);
			result = query.list();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public DanhSachMongMuon getDSMongMuon(Integer maDSMongMuon) {
		DanhSachMongMuon result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (DanhSachMongMuon) session.get(DanhSachMongMuon.class, maDSMongMuon);
			if (result != null) {
				Iterator itr = result.getSanPhams().iterator();
				while (itr.hasNext()) {
					SanPham sanPham = (SanPham) itr.next();
					Hibernate.initialize(sanPham);
				}
			}
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
