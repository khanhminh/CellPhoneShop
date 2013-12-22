package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.NguoiDung;
import cellphoneshop.security.UserDetailsAdapter;

@Repository
public class NguoidungDAOImpl implements NguoidungDAO {

	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private SaltSource saltSource;

	Logger log = Logger.getLogger(NguoidungDAOImpl.class);

	@SuppressWarnings("unchecked")
	@Transactional
	public NguoiDung getNguoidung(String email) {
		List<NguoiDung> userList = new ArrayList<NguoiDung>();
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from NguoiDung nd where nd.email = :email");
		query.setParameter("email", email);
		userList = query.list();
		if (userList.size() > 0) {
			NguoiDung user = userList.get(0);
			Hibernate.initialize(user.getVaiTros());
			return user;
		} else {
			return null;
		}
	}

	@Transactional(readOnly = true)
	public NguoiDung getNguoiDung(Integer maNguoiDung) {
		NguoiDung result = null;
		Session session = sessionFactory.getCurrentSession();

		try {
			result = (NguoiDung) session.get(NguoiDung.class, maNguoiDung);
			if (result != null) {
				Hibernate.initialize(result.getVaiTros());
			}
		} catch (Exception ex) {
			log.error(ex.getClass().getName() + ": " + ex.getMessage());
		}

		return result;
	}

	@Transactional
	public Boolean insertNguoidung(NguoiDung user) {

		Session session = sessionFactory.getCurrentSession();
		if (getNguoidung(user.getEmail()) != null) {
			return false;
		}

		try {
			session.save(user);
			String pass = encodePassword(user);
			user.setMatKhau(pass);
			session.update(user);
		} catch (HibernateException e) {
			return false;
		}

		return true;
	}

	public Boolean checkLogin(NguoiDung user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from NguoiDung nd where nd.email = :email and nd.matKhau = :password");
		query.setParameter("email", user.getEmail());
		query.setParameter("password", user.getMatKhau());

		List<NguoiDung> list = query.list();
		if (list == null || list.isEmpty()) {
			return false;
		}

		return true;

	}

	private String encodePassword(NguoiDung nguoidung) {
		Object salt = saltSource.getSalt(new UserDetailsAdapter(nguoidung));
		String encPassword = passwordEncoder.encodePassword(
				nguoidung.getMatKhau(), salt);

		return encPassword;
	}

	@Transactional(readOnly = true)
	public List<NguoiDung> getListNguoiDung(int ketquadautien, int soluong) {
		List<NguoiDung> userList = new ArrayList<NguoiDung>();
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from NguoiDung nd");
		query.setFirstResult(ketquadautien);
		query.setMaxResults(soluong);
		userList = query.list();

		for (NguoiDung user : userList) {
			Hibernate.initialize(user.getVaiTros());
		}

		if (userList == null || userList.isEmpty()) {
			return null;
		}

		return userList;
	}

	@Transactional
	public Boolean updateNguoidung(NguoiDung user) {
		Session session = sessionFactory.openSession();
		if (user == null) {
			return false;
		}

		if (this.getNguoiDung(user.getMaNd()) == null) {
			return false;
		}

		try {
			session.update(user);
			session.flush();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			log.error("Error Update: " + e.getMessage());
			return false;
		} finally {
			session.close();
		}
	}
}
