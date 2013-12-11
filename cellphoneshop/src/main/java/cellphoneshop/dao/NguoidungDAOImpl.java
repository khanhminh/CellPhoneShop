package cellphoneshop.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cellphoneshop.model.Nguoidung;

@Repository
public class NguoidungDAOImpl implements NguoidungDAO {

	@Autowired
	private SessionFactory sessionFactory;

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
}
