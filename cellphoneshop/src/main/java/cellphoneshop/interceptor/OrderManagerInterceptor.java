package cellphoneshop.interceptor;

import java.util.List;

import org.apache.struts2.dispatcher.RequestMap;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.TrangThaiDonHang;
import cellphoneshop.service.TrangThaiDonHangService;
import cellphoneshop.viewmodel.SortBy;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

@SuppressWarnings("serial")
public class OrderManagerInterceptor implements Interceptor {

	@Autowired
	private TrangThaiDonHangService ttdhService;
	private List<TrangThaiDonHang> listStatus;
	private List<Integer> listRPP;
	private List<SortBy> listSortby;
	
	public void destroy() {
		if (listStatus != null){
			listStatus = null;
		}
		if (listRPP != null){
			listRPP = null;
		}
		if (listSortby != null){
			listSortby = null;
		}
	}

	public void init() {
		listStatus = ttdhService.getListTrangThaiDonHang();
	}

	public String intercept(ActionInvocation ai) throws Exception {
		RequestMap map = (RequestMap) ai.getInvocationContext().get("request");
		map.put("listStatus", listStatus);
		map.put("listRPP", listRPP);
		map.put("listSortby", listSortby);
				
		return ai.invoke();
	}

	public void setListRPP(List<Integer> listRPP) {
		this.listRPP = listRPP;
	}
	
	public void setListSortby(List<SortBy> listSortby) {
		this.listSortby = listSortby;
	}
}
