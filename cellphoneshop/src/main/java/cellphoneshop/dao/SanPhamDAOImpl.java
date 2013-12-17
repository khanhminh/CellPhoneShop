package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.CtSanPham;
import cellphoneshop.model.HinhAnhSp;
import cellphoneshop.model.SanPham;

@Repository
public class SanPhamDAOImpl implements SanPhamDAO {
	@Autowired
	private SessionFactory sessionFactory;

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
			// TODO: handle exception
			System.err
					.println(ex.getClass().getName() + ": " + ex.getMessage());
		}

		// TODO Auto-generated method stub
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

}