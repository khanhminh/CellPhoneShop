package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.Sanpham;

@Repository
public class SanPhamDAOImpl implements SanPhamDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertSanPham(Sanpham sp) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(sp); //TODO: Neu san pham da co trong CSDL?
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public Sanpham getSanPhamTheoId(Long maSp) {
		Sanpham result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (Sanpham) session.get(Sanpham.class, maSp);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public void updateSanPham(Sanpham sp) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(sp); //TODO: Neu san pham chua co trong CSDL?
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	/**
	 * Lấy danh sách sản phẩm có ngày nhập trước một ngày nào đó. 
	 * @param ngayBatDau Ngày bắt đầu tính.
	 * @param ketQuaDauTien Số thứ tự sản phẩm đầu tiên tìm trong CSDL.
	 * @param soKetQua Số kết quả tối đa mong muốn trả về.
	 * @return Danh sách sản phẩm
	 */
	@Transactional(readOnly = true)
	public List<Sanpham> getListSanPhamTheoNgayNhap(Date ngayBatDau, int ketQuaDauTien, int soKetQuaToiDa) {
		List<Sanpham> result = new ArrayList<Sanpham>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select SP from Sanpham as SP where SP.ngayNhap <= :ngayBatDau";
			Query query = session.createQuery(hql);
			query.setDate("ngayBatDau", ngayBatDau);
			
			query.setFirstResult(ketQuaDauTien);
			query.setMaxResults(soKetQuaToiDa);
			
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}
	
	@Transactional(readOnly = true)
	public long demSoSanPhamTheoNgayNhap(Date ngayBatDau) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select count(*) from Sanpham as SP where SP.ngayNhap <= :ngayBatDau";
			Query query = session.createQuery(hql);
			query.setDate("ngayBatDau", ngayBatDau);
			
			return ((Long)query.iterate().next()).longValue();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return 0;
	}

	@Transactional(readOnly = true)
	public List<Sanpham> getListSanPhamTheoNgayNhap(Date ngay1, Date ngay2,
			int kqDauTien, int soKqToiDa) {
		List<Sanpham> result = new ArrayList<Sanpham>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select SP from Sanpham as SP where (:ngay1 <= SP.ngayNhap) and (SP.ngayNhap <= :ngay2)";
			Query query = session.createQuery(hql);
			query.setDate("ngay1", ngay1);
			query.setDate("ngay2", ngay2);
			
			query.setFirstResult(kqDauTien);
			query.setMaxResults(soKqToiDa);
			
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional(readOnly = true)
	public long demSoSanPhamTheoNgayNhap(Date ngay1, Date ngay2) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select count(*) from Sanpham as SP where (:ngay1 <= SP.ngayNhap) and (SP.ngayNhap <= :ngay2)"; //TODO Chi lay nhung truong nao can thiet
			Query query = session.createQuery(hql);
			query.setDate("ngay1", ngay1);
			query.setDate("ngay2", ngay2);
			
			return ((Long)query.iterate().next()).longValue();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return 0;
	}

	@Transactional(readOnly = true)
	public List<Sanpham> timKiemSanPhamTheoTen(String tuKhoa, int kqDauTien,
			int soKqToiDa) {
		if (tuKhoa == null) {
			tuKhoa = "";
		}
		List<Sanpham> result = new ArrayList<Sanpham>();
		Session session = sessionFactory.getCurrentSession();
		
		try {
			String hql = "select SP from Sanpham as SP where SP.tenSp like '%" + tuKhoa + "%'";
			Query query = session.createQuery(hql);
			query.setFirstResult(kqDauTien);
			query.setMaxResults(soKqToiDa);
			result = query.list();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		
		return result;
	}

	@Transactional(readOnly = true)
	public long demSoSanPhamKhiTimKiemTheoTen(String tuKhoa) {
		if (tuKhoa == null) {
			tuKhoa = "";
		}
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(*) from Sanpham as SP where SP.tenSp like '%" + tuKhoa + "%'";
		
		try {
			Query query = session.createQuery(hql);
			return ((Long)query.iterate().next()).longValue();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return 0;
	}
}