package cellphoneshop.interceptor;

import java.util.List;

import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.RequestMap;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.KhuyenMai;
import cellphoneshop.model.NhaSanXuat;
import cellphoneshop.service.KhuyenMaiService;
import cellphoneshop.service.NhaSanXuatService;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

@SuppressWarnings("serial")
public class HomeInterceptor implements Interceptor {
	@Autowired
	private NhaSanXuatService nsxService;
	@Autowired
	private KhuyenMaiService kmService;
	
	Logger log = Logger.getLogger(HomeInterceptor.class);
	private List<NhaSanXuat> listNSX;
	private List<KhuyenMai> listKM;
	
	public void destroy() {
		if (listNSX != null){
			listNSX = null;
		}
		if (listKM != null){
			listKM = null;
		}
	}

	public void init() {
		listNSX = nsxService.getListNhaSanXuat();
		listKM = kmService.getListKhuyenMaiChuaDong();
	}

	public String intercept(ActionInvocation ai) throws Exception {
		RequestMap map = (RequestMap) ai.getInvocationContext().get("request");
		map.put("listNSX", listNSX);
		map.put("listKM", listKM);
				
		return ai.invoke();
	}

}
