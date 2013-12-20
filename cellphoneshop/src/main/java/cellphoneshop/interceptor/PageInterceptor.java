package cellphoneshop.interceptor;

import java.util.List;

import org.apache.struts2.dispatcher.RequestMap;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.NhaSanXuat;
import cellphoneshop.service.NhaSanXuatService;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

@SuppressWarnings("serial")
public class PageInterceptor  implements Interceptor {
	@Autowired
	private NhaSanXuatService nsxService;
	private List<NhaSanXuat> listNSX;
	
	public void destroy() {
		if (listNSX != null){
			listNSX = null;
		}
	}

	public void init() {
		listNSX = nsxService.getListNhaSanXuat();
	}

	public String intercept(ActionInvocation ai) throws Exception {
		RequestMap map = (RequestMap) ai.getInvocationContext().get("request");
		map.put("listNSX", listNSX);
				
		return ai.invoke();
	}

}
