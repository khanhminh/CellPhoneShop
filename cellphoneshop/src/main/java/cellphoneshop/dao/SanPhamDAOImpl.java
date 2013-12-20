package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.CtDonHang;
import cellphoneshop.model.CtSanPham;
import cellphoneshop.model.HeDieuHanh;
import cellphoneshop.model.HinhAnhSp;
import cellphoneshop.model.NhaSanXuat;
import cellphoneshop.model.ProductFilter;
import cellphoneshop.model.SanPham;

@Repository
public class SanPhamDAOImpl implements SanPhamDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Logger log = Logger.getLogger(SanPhamDAOImpl.class);

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertSanPham(SanPham sp) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.save(sp); // TODO: Neu san pham da co trong CSDL?
		} catch (Exception ex) {
			System.err
					.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public SanPham getSanPhamTheoId(Integer maSp) {
		SanPham result = null;
		Session session = sessionFactory.getCurrentSession();

		try {
			result = (SanPham) session.get(SanPham.class, maSp);
			Hibernate.initialize(result.getNhaSanXuat());
		} catch (Exception ex) {
			System.err
					.println(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@Transactional
	public void updateSanPham(SanPham sp) {
		Session session = sessionFactory.getCurrentSession();

		try {
			session.update(sp); // TODO: Neu san pham chua co trong CSDL?
		} catch (Exception ex) {
			System.err
					.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public List<SanPham> getListSanPhamTheoNgayNhap(Date ngayBatDau,
			int ketQuaDauTien, int soKetQuaToiDa) {
		List<SanPham> result = new ArrayList<SanPham>();
		Session session = sessionFactory.getCurrentSession();

		try {
			String hql = "select SP from SanPham as SP where SP.ngayNhap <= :ngayBatDau";
			Query query = session.createQuery(hql);
			query.setDate("ngayBatDau", ngayBatDau);

			query.setFirstResult(ketQuaDauTien);
			query.setMaxResults(soKetQuaToiDa);

			result = query.list();
		} catch (Exception ex) {
			System.err
					.println(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@Transactional(readOnly = true)
	public int demSoSanPhamTheoNgayNhap(Date ngayBatDau) {
		Session session = sessionFactory.getCurrentSession();

		try {
			String hql = "select count(*) from SanPham as SP where SP.ngayNhap <= :ngayBatDau";
			Query query = session.createQuery(hql);
			query.setDate("ngayBatDau", ngayBatDau);

			return ((Long) query.iterate().next()).intValue();
		} catch (Exception ex) {
			System.err
					.println(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return 0;
	}

	@Transactional(readOnly = true)
	public List<SanPham> getListSanPhamTheoNgayNhap(Date ngay1, Date ngay2,
			int kqDauTien, int soKqToiDa) {
		List<SanPham> result = new ArrayList<SanPham>();
		Session session = sessionFactory.getCurrentSession();

		try {
			String hql = "select SP from SanPham as SP where (:ngay1 <= SP.ngayNhap) and (SP.ngayNhap <= :ngay2)";
			Query query = session.createQuery(hql);
			query.setDate("ngay1", ngay1);
			query.setDate("ngay2", ngay2);

			query.setFirstResult(kqDauTien);
			query.setMaxResults(soKqToiDa);

			result = query.list();
		} catch (Exception ex) {
			System.err
					.println(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@Transactional(readOnly = true)
	public int demSoSanPhamTheoNgayNhap(Date ngay1, Date ngay2) {
		Session session = sessionFactory.getCurrentSession();

		try {
			String hql = "select count(*) from SanPham as SP where (:ngay1 <= SP.ngayNhap) and (SP.ngayNhap <= :ngay2)";
			Query query = session.createQuery(hql);
			query.setDate("ngay1", ngay1);
			query.setDate("ngay2", ngay2);

			return ((Long) query.iterate().next()).intValue();
		} catch (Exception ex) {
			System.err
					.println(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return 0;
	}

	@Transactional(readOnly = true)
	public List<SanPham> timKiemSanPhamTheoTen(String tuKhoa, int kqDauTien,
			int soKqToiDa) {
		if (tuKhoa == null) {
			tuKhoa = "";
		}
		List<SanPham> result = new ArrayList<SanPham>();
		Session session = sessionFactory.getCurrentSession();

		try {
			String hql = "select SP from SanPham as SP where SP.tenSp like '%" + tuKhoa + "%'";
			Query query = session.createQuery(hql);
			query.setFirstResult(kqDauTien);
			query.setMaxResults(soKqToiDa);
			result = query.list();
		} catch (Exception ex) {
			System.err
					.println(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@Transactional(readOnly = true)
	public int demSoSanPhamKhiTimKiemTheoTen(String tuKhoa) {
		if (tuKhoa == null) {
			tuKhoa = "";
		}
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) from SanPham as SP where SP.tenSp like '%"
				+ tuKhoa + "%'";

		try {
			Query query = session.createQuery(hql);
			return ((Long) query.iterate().next()).intValue();
		} catch (Exception ex) {
			System.err
					.println(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return 0;
	}

	@Transactional(readOnly = true)
	public List<SanPham> getListSanPhamTheoLoai(Integer maloai,
			Integer positionStart, Integer amount, String qualification, boolean isAsc) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select SP from SanPham as SP where SP.loaiSanPham.maLoaiSp=:maloai";
		if (qualification != null) {
			if (qualification.equals("name")) {
				hql += " order by SP.tenSp";
			} else {
				hql += " order by SP.gia";
			}
		} else {
			hql += " order by SP.gia";
		}

		if (isAsc) {
			hql += " asc";
		} else {
			hql += " desc";
		}
		List<SanPham> result = new ArrayList<SanPham>();
		try {
			Query query = session.createQuery(hql);
			query.setInteger("maloai", maloai);
			query.setFirstResult((int) positionStart);
			query.setMaxResults((int) amount);
			result = query.list();
		} catch (Exception ex) {
			System.err
					.println(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@Transactional(readOnly = true)
	public SanPham getSanPhamCungChiTietTheoId(Integer maSp) {
		SanPham result = null;
		Session session = sessionFactory.getCurrentSession();

		try {
			result = (SanPham) session.get(SanPham.class, maSp);
			
			if (result != null) {
				Iterator itrCtSP = result.getCtSanPhams().iterator();
				if (itrCtSP.hasNext()) {
					CtSanPham ctSP = (CtSanPham) itrCtSP.next();
					Hibernate.initialize(ctSP);
					Hibernate.initialize(ctSP.getHeDieuHanh());
					
					Iterator itrHinhAnhSp = ctSP.getHinhAnhSps().iterator();
					while (itrHinhAnhSp.hasNext()) {
						HinhAnhSp hinhAnh = (HinhAnhSp) itrHinhAnhSp.next();
						Hibernate.initialize(hinhAnh);
					}
				}
				
				Hibernate.initialize(result.getNhaSanXuat());
				Hibernate.initialize(result.getLoaiSanPham());
			}
		} catch (Exception ex) {
			System.err
					.println(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@Transactional(readOnly = true)
	public List<SanPham> getListSanPham(ProductFilter productFilter, int kqDauTien, int soKqToiDa,
			String order, boolean isAsc) {
		List<SanPham> result = new ArrayList<SanPham>();
		Session session = sessionFactory.getCurrentSession();
		String s = isAsc ? "asc" : "desc";
		try {
			String hql = taoTruyVanHQLDeLaySP(productFilter, false) + " order by sp." + order + " " + s;
			Query query = session.createQuery(hql);
			
			query.setFirstResult(kqDauTien);
			query.setMaxResults(soKqToiDa);
			
			result = query.list();
			
			if (result != null) {
				for (SanPham sanPham : result) {
					Hibernate.initialize(sanPham.getNhaSanXuat());
					Iterator itrCTSanPham = sanPham.getCtSanPhams().iterator();
					if (itrCTSanPham.hasNext()) {
						CtSanPham ctSanPham = (CtSanPham) itrCTSanPham.next();
						Hibernate.initialize(ctSanPham);
						Hibernate.initialize(ctSanPham.getHeDieuHanh());
					}
				}
			}
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
	
	
	private String taoTruyVanHQLDeLaySP(ProductFilter productFilter, boolean isCountQuery) {
		String selectFromClause;
		
		if (isCountQuery == false) {
			selectFromClause = "select distinct sp from SanPham as sp, CtSanPham as ct ";
		} else {
			selectFromClause = "select count(*) from SanPham as sp inner join sp.ctSanPhams as ct ";
		}
		
		// NhaSanXuat
		String productCon = "";
		for (int i = 0; i < productFilter.producerList.size(); i++) {
			if (i > 0) {
				productCon += " or ";
			}
			productCon += " (sp.nhaSanXuat.maNhaSx =  " + productFilter.producerList.get(i).getMaNhaSx() + ") ";
		}
		
		// RatingList
		String ratingCon = "";
		for (int i = 0; i < productFilter.ratingList.size(); i++) {
			if (i > 0) {
				ratingCon += " or ";
			}
			ratingCon += " (sp.diemDanhGiaTb = " + productFilter.ratingList.get(i) + ") ";
		}
		
		// HeDieuHanh
		String osCon = "";
		for (int i = 0; i < productFilter.osList.size(); i++) {
			if (i > 0) {
				osCon += " or ";
			} else {
				
			}
			//osCon += " (sp.maSp = ct.sanPham.maSp and ct.heDieuHanh.maHdh = " + productFilter.osList.get(i).getMaHdh() + ") ";
			osCon += " (ct.heDieuHanh.maHdh = " + productFilter.osList.get(i).getMaHdh() + ") ";
		}
		
		// Gia san pham
		String priceCon = "";
		for (int i = 0; i < productFilter.priceConstraintList.size(); i++) {
			if (i > 0) {
				priceCon += " or ";
			}
			priceCon += "(" + productFilter.priceConstraintList.get(i).getMinPrice() + " < sp.gia and sp.gia < " + productFilter.priceConstraintList.get(i).getMaxPrice() + ") ";
		}
		
		
		
		String whereClause = " where "; // the length is 7
		
		if (!productCon.isEmpty()) {
			whereClause += " (" + productCon + ") ";
		}
		
		if (!ratingCon.isEmpty()) {
			if (whereClause.length() > 7) {
				whereClause += " and ";
			}
			whereClause += " (" + ratingCon + ") ";
		}
		
		if (!osCon.isEmpty()) {
			if (whereClause.length() > 7) {
				whereClause += " and ";
			}
			whereClause += " (" + osCon + ") ";
		}
		
		if (!priceCon.isEmpty()) {
			if (whereClause.length() > 7) {
				whereClause += " and ";
			}
			whereClause += " (" + priceCon + ") ";
		}
		
		return selectFromClause + whereClause;
	}

	@Transactional(readOnly = true)
	public int demSoSanPhamKhiGetListSanPham(ProductFilter productFilter) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = taoTruyVanHQLDeLaySP(productFilter, true);
			Query query = session.createQuery(hql);
			return ((Long) query.iterate().next()).intValue();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return 0;
	}
	
	@Transactional(readOnly = true)
	public List<SanPham> getListSanPham(int kqDauTien, int soKqToiDa,
			String order, boolean isAsc) {
		List<SanPham> result = new ArrayList<SanPham>();
		Session session = sessionFactory.getCurrentSession();
		
		String s = isAsc ? "asc" : "desc";
		try {
			String hql = "from SanPham sp order by sp." + order + " " + s;
			Query query = session.createQuery(hql);			
			query.setFirstResult(kqDauTien);
			query.setMaxResults(soKqToiDa);
			
			result = query.list();
			
			if (result != null) {
				for (SanPham sanPham : result) {
					Hibernate.initialize(sanPham.getNhaSanXuat());
					Iterator itrCTSanPham = sanPham.getCtSanPhams().iterator();
					if (itrCTSanPham.hasNext()) {
						CtSanPham ctSanPham = (CtSanPham) itrCTSanPham.next();
						Hibernate.initialize(ctSanPham);
						Hibernate.initialize(ctSanPham.getHeDieuHanh());
					}
				}
			}
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}			
		return result;
	}
	
	public List<SanPham> getListSanPhamBanChayNhat(int soSanPham) {
		List<SanPham> result = new ArrayList<SanPham>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			List<Integer> productIdList = session.createCriteria(CtDonHang.class)
			.setProjection(Projections.projectionList().add(Projections.groupProperty("sanPham.maSp")))
			.setFirstResult(0)
			.setMaxResults(soSanPham)
			.list();
			
			if (productIdList != null) {
				for (Integer id : productIdList) {
					result.add(getSanPhamTheoId(id));
				}
			}
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public int demSoSanPham() {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select count(*) from SanPham";
			Query query = session.createQuery(hql);
			return ((Long) query.iterate().next()).intValue();
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return 0;
	}
}