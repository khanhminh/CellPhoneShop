package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

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

import cellphoneshop.model.Nguoidung;
import cellphoneshop.security.UserDetailsAdapter;

@Repository
public class NguoidungDAOImpl implements NguoidungDAO {

	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private SaltSource saltSource;

	@SuppressWarnings("unchecked")
	@Transactional
	public Nguoidung getNguoidung(String email) {
		List<Nguoidung> userList = new ArrayList<Nguoidung>();
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from Nguoidung nd where nd.email = :email");
		query.setParameter("email", email);
		userList = query.list();
		if (userList.size() > 0) {
			Nguoidung user = userList.get(0);
			Hibernate.initialize(user.getVaitros());
			return user;
		} else {
			return null;
		}
	}
	
	@Transactional(readOnly = true)
	public Nguoidung getNguoiDung(Integer maNguoiDung) {
		Nguoidung result = null;
		Session session = sessionFactory.getCurrentSession();
		
		try {
			result = (Nguoidung) session.get(Nguoidung.class, maNguoiDung);
			if (result != null) {
				Hibernate.initialize(result.getVaitros());
			}
		} catch (Exception ex) {
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public Boolean insertNguoidung(Nguoidung user) {
		
		Session session = sessionFactory.getCurrentSession();
		if(getNguoidung(user.getEmail()) != null){
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

	public Boolean checkLogin(Nguoidung user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("from Nguoidung nd where nd.email = :email and nd.matKhau = :password");
		query.setParameter("email", user.getEmail());
		query.setParameter("password", user.getMatKhau());
		
		List<Nguoidung> list = query.list();
		if (list == null || list.isEmpty()) {
			return false;
		}

		return true;
		
	}
	
	private String encodePassword(Nguoidung nguoidung){
		Object salt = saltSource.getSalt(new UserDetailsAdapter(nguoidung));
		String encPassword = passwordEncoder.encodePassword(nguoidung.getMatKhau(), salt);
		
		return encPassword;
	}
}
