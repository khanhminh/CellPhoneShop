package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.CtDonHang;
import cellphoneshop.model.DonHang;

@Repository
public class DonHangDAOImpl implements DonHangDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(DonHangDAOImpl.class);

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertDonHang(DonHang donHangMoi) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(donHangMoi);
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public DonHang getDonHang(Integer maDonHang) {
		DonHang result = null;
		Session session = sessionFactory.getCurrentSession();

		try {
			result = (DonHang) session.get(DonHang.class, maDonHang);
			if (result != null){
				Hibernate.initialize(result.getNguoiDung());
				Hibernate.initialize(result.getTrangThaiDonHang());
			}
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@Transactional
	public void updateDonHang(DonHang donHang) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.update(donHang);
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Integer getMaDonHang(Integer maNguoiDung, Date ngayDatHang) {
		if (maNguoiDung == null || ngayDatHang == null) {
			return -1;
		}

		Session session = sessionFactory.getCurrentSession();
		try {
			String hql = "select D.maDonHang from DonHang as D where D.nguoiDung.maNd = :maNguoiDung and ngayDatHang = :ngayDatHang";
			Query query = session.createQuery(hql);
			query.setInteger("maNguoiDung", maNguoiDung);
			query.setDate("ngayDatHang", ngayDatHang);
			return (Integer) query.uniqueResult();
		} catch (HibernateException ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return -1;
	}

	@Transactional(readOnly = true)
	public DonHang getDonHangCungChiTietTheoId(Integer maDonHang) {
		DonHang result = null;
		Session session = sessionFactory.getCurrentSession();

		try {
			result = (DonHang) session.get(DonHang.class, maDonHang);

			if (result != null) {
				Hibernate.initialize(result.getPtGiaoHang());
				Hibernate.initialize(result.getPtThanhToan());
				Hibernate.initialize(result.getNguoiDung());
				Hibernate.initialize(result.getNguoiNhan());
				Hibernate.initialize(result.getTrangThaiDonHang());

				Iterator itrCTDonHang = result.getCtDonHangs().iterator();
				while (itrCTDonHang.hasNext()) {
					CtDonHang ctDonHang = (CtDonHang) itrCTDonHang.next();
					Hibernate.initialize(ctDonHang);
					Hibernate.initialize(ctDonHang.getSanPham());
				}
			}
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@Transactional(readOnly = true)
	public List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung,
			boolean isAsc, Integer maStatus, int kqDautien, int kqToiDa) {

		List<DonHang> result = new ArrayList<DonHang>();
		Session session = sessionFactory.getCurrentSession();

		try {
			String hql = "select DH from DonHang as DH where DH.nguoiDung.maNd = :maNguoiDung "
					+ "and DH.trangThaiDonHang.maTrangThai = :maStatus";

			if (!isAsc) {
				hql += " order by DH.maDonHang desc";
			} else {
				hql += " order by DH.maDonHang asc";
			}

			Query query = session.createQuery(hql);
			query.setInteger("maNguoiDung", maNguoiDung);
			query.setInteger("maStatus", maStatus);
			query.setFirstResult(kqDautien);
			query.setMaxResults(kqToiDa);
			result = query.list();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung,
			Integer maStatus) {
		List<DonHang> result = new ArrayList<DonHang>();
		Session session = sessionFactory.getCurrentSession();

		try {
			String hql = "select DH from DonHang as DH where DH.nguoiDung.maNd = :maNguoiDung "
					+ "and DH.trangThaiDonHang.maTrangThai = :maStatus";

			Query query = session.createQuery(hql);
			query.setInteger("maStatus", maStatus);
			query.setInteger("maNguoiDung", maNguoiDung);
			result = query.list();
			if (result != null) {
				for (DonHang dh : result) {
					Hibernate.initialize(dh.getTrangThaiDonHang());
				}
			}
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<DonHang> getListDonHangTheoNguoiDung(Integer maNguoiDung) {
		List<DonHang> result = new ArrayList<DonHang>();
		Session session = sessionFactory.getCurrentSession();

		try {
			String hql = "select DH from DonHang as DH where DH.nguoiDung.maNd = :maNguoiDung";

			Query query = session.createQuery(hql);
			query.setInteger("maNguoiDung", maNguoiDung);
			result = query.list();
			if (result != null) {
				for (DonHang dh : result) {
					Hibernate.initialize(dh.getTrangThaiDonHang());
				}
			}
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<DonHang> getListDonHang(String by, boolean asc, int start, int count) {
		List<DonHang> result = new ArrayList<DonHang>();
		Session session = sessionFactory.getCurrentSession();

		String order = asc ? " asc" : " desc";
		try {
			String hql = "from DonHang dh order by " + by + order;

			Query query = session.createQuery(hql);
			query.setFirstResult(start);
			query.setMaxResults(count);
			result = query.list();
			if (result != null) {
				for (DonHang dh : result) {
					Hibernate.initialize(dh.getTrangThaiDonHang());
					Hibernate.initialize(dh.getNguoiDung());
				}
			}
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<DonHang> getListDonHang(Integer maStatus, String by, boolean asc, int start, int count) {
		List<DonHang> result = new ArrayList<DonHang>();
		Session session = sessionFactory.getCurrentSession();

		String order = asc ? " asc" : " desc";
		try {
			String hql = "from DonHang dh where dh.trangThaiDonHang.maTrangThai=:maStatus order by " + by + order;

			Query query = session.createQuery(hql);
			query.setInteger("maStatus", maStatus);
			query.setFirstResult(start);
			query.setMaxResults(count);
			result = query.list();
			if (result != null) {
				for (DonHang dh : result) {
					Hibernate.initialize(dh.getTrangThaiDonHang());
					Hibernate.initialize(dh.getNguoiDung());
				}
			}
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@Transactional(readOnly = true)
	public int demSoDonHang() {
		Session session = sessionFactory.getCurrentSession();

		try {
			String hql = "select count(*) from DonHang as dh";
			Query query = session.createQuery(hql);
			
			return ((Long) query.iterate().next()).intValue();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return 0;
	}

	@Transactional(readOnly = true)
	public int demSoDonHang(Integer maStatus) {
		Session session = sessionFactory.getCurrentSession();

		try {
			String hql = "select count(*) from DonHang as dh where dh.trangThaiDonHang.maTrangThai=:maStatus";
			Query query = session.createQuery(hql);
			query.setInteger("maStatus", maStatus);

			return ((Long) query.iterate().next()).intValue();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return 0;
	}
	
	@Transactional
	public boolean xoaDonHang(Integer maDonHang) {
		boolean result = true;
		Session session = sessionFactory.getCurrentSession();
		try {				
			DonHang dh = (DonHang) session.get(DonHang.class, maDonHang);
			if (dh != null){
				session.delete(dh);
			}
		} catch (Exception ex) {
			result = false;
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
}
