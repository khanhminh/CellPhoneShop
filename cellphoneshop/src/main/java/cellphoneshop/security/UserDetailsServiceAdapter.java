package cellphoneshop.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import cellphoneshop.dao.NguoidungDAO;
import cellphoneshop.model.NguoiDung;


@Service
public class UserDetailsServiceAdapter implements UserDetailsService {

	@Autowired
	private NguoidungDAO nguoidungDAO;

	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {
		NguoiDung account = nguoidungDAO.getNguoidung(username);
		if (account == null) {
			throw new UsernameNotFoundException("No such user: " + username);
		}
		
		UserDetailsAdapter user = new UserDetailsAdapter(account);
		return user;
	}

}
