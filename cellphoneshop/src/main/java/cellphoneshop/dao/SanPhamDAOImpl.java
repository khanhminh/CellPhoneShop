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
			if (getSanPhamTheoId(sp.getMaSp()) != null) {
				throw new HibernateException("San pham da co trong CSDL"); //TODO: Tạo loại exception mới?
			}
			session.save(sp);
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
			if (getSanPhamTheoId(sp.getMaSp()) == null) {
				throw new HibernateException("San pham chua co trong CSDL"); //TODO: Tạo loại exception mới?
			}
			session.update(sp);
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
	public List<Sanpham> getListSanPhamMoi(Date ngayBatDau, int ketQuaDauTien, int soKetQuaToiDa) {
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
	public long demSoSanPhamMoi(Date ngayBatDau) {
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
}