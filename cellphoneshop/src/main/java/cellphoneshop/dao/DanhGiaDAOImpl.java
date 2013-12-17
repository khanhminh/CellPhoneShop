package cellphoneshop.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.DanhGia;
import cellphoneshop.model.SanPham;;

@Repository
public class DanhGiaDAOImpl implements DanhGiaDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private SanPhamDAO sanPhamDAO;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertDanhGia(DanhGia danhGia) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.save(danhGia);
			
			// cap nhap danh gia san pham
			final String hql = "select avg(DG.diem) from DanhGia as DG where DG.sanPham.maSp = :maSanPham";
			Query query = session.createQuery(hql);
			query.setLong("maSanPham", danhGia.getSanPham().getMaSp());
			final float diemTB = ((Double)query.list().iterator().next()).floatValue();
			
			SanPham sanPham = sanPhamDAO.getSanPhamTheoId(danhGia.getSanPham().getMaSp());
			sanPham.setDiemDanhGiaTb(diemTB);
			sanPhamDAO.updateSanPham(sanPham); // TODO: Co cach lam nao khac tot hon la phai goi ham nay
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}

	@Transactional(readOnly = true)
	public DanhGia getDanhGia(Integer maSanPham, Integer maNguoiDung) {
		DanhGia result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			 String hql = "select DG from DanhGia DG where DG.id.maSp = :maSanPham and DG.id.maNd = :maNguoiDung";
			 Query query = session.createQuery(hql);
			 query.setLong("maSanPham", maSanPham);
			 query.setInteger("maSanPham", maNguoiDung);
			 result = (DanhGia) query.uniqueResult();
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public void updateDanhGia(DanhGia danhGia) {
		Session session = sessionFactory.getCurrentSession();
		
		try {
			session.update(danhGia);
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
	}
}
