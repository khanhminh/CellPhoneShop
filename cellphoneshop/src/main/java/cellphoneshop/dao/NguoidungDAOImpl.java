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
			System.err.println(ex.getClass().getName() + ": " + ex.getMessage());
		}
		
		return result;
	}

	@Transactional
	public Boolean insertNguoidung(NguoiDung user) {
		
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
	
	private String encodePassword(NguoiDung nguoidung){
		Object salt = saltSource.getSalt(new UserDetailsAdapter(nguoidung));
		String encPassword = passwordEncoder.encodePassword(nguoidung.getMatKhau(), salt);
		
		return encPassword;
	}
}
