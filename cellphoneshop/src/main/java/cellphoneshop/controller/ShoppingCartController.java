package cellphoneshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.CartItem;
import cellphoneshop.model.SanPham;
import cellphoneshop.service.SanPhamService;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ShoppingCartController extends ActionSupport implements ServletRequestAware{
	
	@Autowired
	private SanPhamService sanPhamService;
	private HttpServletRequest request;
	
	private Logger log = Logger.getLogger(ShoppingCartController.class);
	
	@SuppressWarnings("unchecked")
	public String cart(){
		HttpSession session = request.getSession();
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart != null && !cart.isEmpty()){
			return "view";
		}
		
		return "empty";
	}

	public String edit(){
		String strId = request.getParameter("product");
		String action = request.getParameter("action");
		if (strId == null || !strId.matches("\\d*")){
			return ERROR;
		}		
		int id = Integer.parseInt(strId);
		if (action.equalsIgnoreCase("add")){
			log.warn("them san pham vao gio hang: " + id);
			addProduct(id);
		}
		else if (action.equalsIgnoreCase("delete")){
			log.warn("bo bot san pham trong gio hang: " + id);
			deleteProduct(id);
		}
		else if (action.equalsIgnoreCase("remove")){
			log.warn("xoa san pham trong gio hang: " + id);
			removeProduct(id);
		}
		else {
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	private void deleteProduct(long id){
		HttpSession session = request.getSession();
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart != null){
			for (CartItem item : cart){
				if (item.getProduct().getMaSp() == id){
					cart.remove(item);
					break;
				}
			}
		}
	}
	
	private void removeProduct(long id){
		HttpSession session = request.getSession();
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart != null){
			for (CartItem item : cart){
				if (item.getProduct().getMaSp() == id){
					int count = item.getCount() - 1;
					if (count == 0){
						cart.remove(item);
					}
					else {
						item.setCount(count);
					}
					break;
				}
			}
		}
	}
	
	private void addProduct(int id){
		if (!checkExistAndAdd(id)){
			HttpSession session = request.getSession();
			List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
			if (cart == null){
				cart = new ArrayList<CartItem>();
				session.setAttribute("cart", cart);
			}
			SanPham product = sanPhamService.getSanPhamTheoId(id);
			CartItem item = new CartItem(product, 1);
			cart.add(item);
		}
	}
	
	private boolean checkExistAndAdd(int id){
		HttpSession session = request.getSession();
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		if (cart != null){
			for (CartItem item : cart){
				if (item.getProduct().getMaSp() == id){
					int count = item.getCount();
					item.setCount(count + 1);
					return true;
				}
			}
		}
		
		return false;
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;		
	}	
}
