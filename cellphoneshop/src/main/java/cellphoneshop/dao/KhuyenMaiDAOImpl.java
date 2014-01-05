package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.KhuyenMai;

@Repository
public class KhuyenMaiDAOImpl implements KhuyenMaiDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(KhuyenMaiDAOImpl.class);

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public boolean insertKhuyenMai(KhuyenMai khuyenMai) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(khuyenMai);
			return true;
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return false;
	}

	@Transactional(readOnly = true)
	public KhuyenMai getKhuyenMai(Integer maKhuyenMai) {
		Session session = sessionFactory.getCurrentSession();

		try {
			KhuyenMai khuyenMai = (KhuyenMai) session.get(KhuyenMai.class,
					maKhuyenMai);
			Hibernate.initialize(khuyenMai.getTrangThaiKhuyenMai());
			Hibernate.initialize(khuyenMai.getSanPhams());
			return khuyenMai;
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return null;
	}

	@Transactional
	public boolean updateKhuyenMai(KhuyenMai khuyenMai) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.update(khuyenMai);
			return true;
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return false;
	}

	@Transactional(readOnly = true)
	public List<KhuyenMai> getListKhuyenMai() {
		Session session = sessionFactory.getCurrentSession();
		List<KhuyenMai> khuyenmailList = new ArrayList<KhuyenMai>();

		try {
			khuyenmailList = session.createQuery("from KhuyenMai").list();
			 for(KhuyenMai km : khuyenmailList){
				 Hibernate.initialize(km.getTrangThaiKhuyenMai());
				 Hibernate.initialize(km.getSanPhams());
			 }
			return khuyenmailList;

		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return new ArrayList<KhuyenMai>();
	}

	@Transactional(readOnly = true)
	public List<KhuyenMai> getListKhuyenMaiChuaDong() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select km from KhuyenMai as km where km.trangThaiKhuyenMai.maTrangThai = :trangthai and km.ngayKetThuc >= :ngayHienTai and km.ngayBatDau <= :ngayHienTai";
		Date nowTime = new Date();
		try {
			Query query = session.createQuery(hql);
			query.setInteger("trangthai", 1);
			query.setDate("ngayHienTai", nowTime);

			return query.list();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return new ArrayList<KhuyenMai>();
	}

	@Transactional(readOnly = true)
	public List<KhuyenMai> getListKhuyenMai(Integer vitriBD, Integer soluongKM) {
		Session session = sessionFactory.getCurrentSession();
		List<KhuyenMai> khuyenmailList = new ArrayList<KhuyenMai>();

		try {
			String hql = "from KhuyenMai";
			Query query = session.createQuery(hql);
			query.setFirstResult(vitriBD);
			query.setMaxResults(soluongKM);
			khuyenmailList = query.list();
			for (KhuyenMai km : khuyenmailList) {
				Hibernate.initialize(km.getTrangThaiKhuyenMai());
			}
			return khuyenmailList;
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return new ArrayList<KhuyenMai>();
	}

	@Transactional(readOnly = true)
	public Integer countKhuyenMai() {
		Session session = sessionFactory.getCurrentSession();

		try {
			String hql = "select count(*) from KhuyenMai";
			Query query = session.createQuery(hql);
			return ((Long) query.iterate().next()).intValue();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return null;
	}

	@Transactional(readOnly = true)
	public List<KhuyenMai> getListKhuyenMail(String value, String option,
			Integer vitriBD, Integer soluongKM) {

		List<KhuyenMai> khuyenMailList = new ArrayList<KhuyenMai>();
		if (value == null || option == null) {
			return khuyenMailList;
		}

		Session session = sessionFactory.getCurrentSession();
		String hql = "";
		if (option.equals("status")) {
			hql += "from KhuyenMai km where km.trangThaiKhuyenMai.maTrangThai =:value";
		} else {
			if (option.equals("id")) {
				hql += "from KhuyenMai km where km.maKm =:value";
			} else {
				if (option.equals("name")) {
					hql += "from KhuyenMai km where km.tieuDe like :value";
				}
			}

		}

		try {
			Query query = session.createQuery(hql);
			if (option.equals("name")) {
				query.setString("value", "%" + value + "%");
			} else {
				query.setString("value", value);
			}

			if(vitriBD != null){
				query.setFirstResult(vitriBD);
			}
			if(soluongKM != null ){
				query.setMaxResults(soluongKM);
			}
		
			khuyenMailList = query.list();
			if (khuyenMailList == null) {
				return new ArrayList<KhuyenMai>();
			}
			for (KhuyenMai km : khuyenMailList) {
				Hibernate.initialize(km.getTrangThaiKhuyenMai());
			}

			return khuyenMailList;

		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return new ArrayList<KhuyenMai>();
	}

	@Transactional(readOnly = true)
	public Integer countKhuyenMail(String value, String option) {
		if (value == null || option == null) {
			return null;
		}
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) ";
		if (option.equals("status")) {
			hql += "from KhuyenMai km where km.trangThaiKhuyenMai.maTrangThai =:value";
		} else {
			if (option.equals("id")) {
				hql += "from KhuyenMai km where km.maKm =:value";
			} else {
				if (option.equals("name")) {
					hql += "from KhuyenMai km where km.tieuDe like :value";
				}
			}

		}

		try {
			Query query = session.createQuery(hql);
			if (option.equals("name")) {
				query.setString("value", "%" + value + "%");
			} else {
				query.setString("value", value);
			}

			return ((Long) query.iterate().next()).intValue();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return null;
	}

	public void updateKhuyenMaiTable() {
		// TODO Auto-generated method stub

	}

}
