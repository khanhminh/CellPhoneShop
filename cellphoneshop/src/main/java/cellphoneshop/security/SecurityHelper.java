package cellphoneshop.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import cellphoneshop.model.NguoiDung;

public class SecurityHelper {
	public static boolean isAuthenticated(){
		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication authentication = securityContext.getAuthentication();
		
		return authentication.isAuthenticated();
	}
	
	public static NguoiDung getUser(){
		NguoiDung ng = null;
		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication authentication = securityContext.getAuthentication();
		Object userDetail = authentication.getPrincipal();
		if (userDetail instanceof UserDetailsAdapter){
			ng = ((UserDetailsAdapter)userDetail).getNguoidung();
		}
		
		return ng;
	}
}
