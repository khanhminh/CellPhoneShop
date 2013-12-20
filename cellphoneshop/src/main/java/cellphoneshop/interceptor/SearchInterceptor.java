package cellphoneshop.interceptor;

import java.util.List;

import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.RequestMap;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.HeDieuHanh;
import cellphoneshop.model.NhaSanXuat;
import cellphoneshop.model.PriceConstraint;
import cellphoneshop.service.HeDieuHanhService;
import cellphoneshop.service.NhaSanXuatService;
import cellphoneshop.viewmodel.SortBy;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

@SuppressWarnings("serial")
public class SearchInterceptor implements Interceptor {
	
	private Logger logger = Logger.getLogger(SearchInterceptor.class);
	
	@Autowired
	private HeDieuHanhService hdhService;
	@Autowired
	private NhaSanXuatService nsxService;
	
	private List<HeDieuHanh> listOS;
	private List<NhaSanXuat> listBrand;
	private List<PriceConstraint> listPrice;
	private List<Integer> listStar;
	private List<SortBy> listSortby;

	public void destroy() {
		if (listOS != null){
			listOS = null;
		}
		if (listBrand != null){
			listBrand = null;
		}
		if (listStar != null){
			listStar = null;
		}
		if (listPrice != null){
			listPrice = null;
		}
		
		logger.info("SearchInterceptor destroy");
	}

	public void init() {
		listOS = hdhService.getListHeDieuHanh();
		listBrand = nsxService.getListNhaSanXuat();
		
		logger.info("SearchInterceptor init");
	}

	public String intercept(ActionInvocation ai) throws Exception {
		RequestMap map = (RequestMap) ai.getInvocationContext().get("request");
		map.put("listOS", listOS);
		map.put("listBrand", listBrand);
		map.put("listPrice", listPrice);
		map.put("listStar", listStar);
		map.put("listSortby", listSortby);
				
		return ai.invoke();
	}
	
	public void setListPrice(List<PriceConstraint> listPrice) {
		this.listPrice = listPrice;
	}
	
	public void setListStar(List<Integer> listStar) {
		this.listStar = listStar;
	}
	
	public void setListSortby(List<SortBy> listSortby) {
		this.listSortby = listSortby;
	}

}
