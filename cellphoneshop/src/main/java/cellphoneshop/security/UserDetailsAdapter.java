package cellphoneshop.security;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;

import cellphoneshop.model.NguoiDung;
import cellphoneshop.model.VaiTro;

@SuppressWarnings("serial")
public class UserDetailsAdapter implements UserDetails {

	private NguoiDung nguoidung;
	
	public UserDetailsAdapter(NguoiDung nguoidung){
		this.nguoidung = nguoidung;
	}

	public NguoiDung getNguoidung() {
		return nguoidung;
	}

	@SuppressWarnings("unchecked")
	public Collection<GrantedAuthority> getAuthorities() {
		Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
		Set<VaiTro> dsVaitro = nguoidung.getVaiTros();
		for (VaiTro role : dsVaitro) {
			authorities.add(new GrantedAuthorityImpl(role.getTenVaiTro()));
		}
		return authorities;
	}

	public String getPassword() {
		return nguoidung.getMatKhau();
	}

	public String getUsername() {
		return nguoidung.getEmail();
	}
	
	public String getName() {
		return nguoidung.getTen();
	}
	
	public int getMaNd(){
		return nguoidung.getMaNd();
	}

	public boolean isAccountNonExpired() {
		return true;
	}

	public boolean isAccountNonLocked() {
		return true;
	}

	public boolean isCredentialsNonExpired() {
		return true;
	}

	public boolean isEnabled() {
		return nguoidung.getEnable();
	}

}
