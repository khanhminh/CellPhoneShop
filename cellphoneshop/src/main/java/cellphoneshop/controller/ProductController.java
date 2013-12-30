package cellphoneshop.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import cellphoneshop.model.BinhLuan;
import cellphoneshop.model.NguoiDung;
import cellphoneshop.model.SanPham;
import cellphoneshop.security.SecurityHelper;
import cellphoneshop.service.BinhLuanService;
import cellphoneshop.service.DanhGiaService;
import cellphoneshop.service.SanPhamService;
import cellphoneshop.util.JsonHandler;
import cellphoneshop.util.Util;
import cellphoneshop.viewmodel.ProductDetail;
import cellphoneshop.viewmodel.RatingInfor;
import cellphoneshop.viewmodel.SortBy;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ProductController extends ActionSupport implements ServletRequestAware{
        
        private final int RATING_SUCCESS = 1;
        private final int RATING_FAIL = -1;
        private final int NO_LOGIN = 0;
        
        private static final String JSON = "json";
        private static final int NUMBER_COMMENTS = 10;
        
        private Logger log = Logger.getLogger(ProductController.class);
        
        @Autowired
        private SanPhamService sanPhamService;
        @Autowired
        private DanhGiaService danhGiaService;
        @Autowired
        private BinhLuanService binhLuanService;
        
        private HttpServletRequest request;
        
        public String detail(){
                String productId = request.getParameter("product");
                if (productId == null || !productId.matches("\\d*")){
                        return ERROR;
                }
                
                int id = Integer.parseInt(productId);
                ProductDetail detail = sanPhamService.getSanPhamCungChiTietTheoId(id);                
                if (detail == null){
                        return ERROR;
                }
                
                request.setAttribute("detail", detail);        
                
                return SUCCESS;
        }
        
        public String compare(){
                
                return SUCCESS;
        }
        
        public String getRating(){
                String strId = request.getParameter("id");
                if (Util.tryParseInt(strId)){
                        int id = Integer.parseInt(strId);        
                        RatingInfor data = danhGiaService.getThongTinDanhGiaSanPham(id);
                        JsonHandler.writeJson(data);
                }
                
                return JSON;
        }
        
        public String rating(){                
                Integer result = RATING_SUCCESS;
                NguoiDung user = SecurityHelper.getUser();
                if (user != null){
                        String strId = request.getParameter("id");                
                        String strNumber = request.getParameter("number");        
                        if (Util.tryParseInt(strId) &&
                                        Util.tryParseInt(strNumber)){
                                int id = Integer.parseInt(strId);
                                int number = Integer.parseInt(strNumber);
                                
                                try {
                                        danhGiaService.insertDanhGia(user, id, number);
                                        log.info("nguoi dung " + user.getMaNd() + " danh gia san pham " + strId);
                                } catch (Exception e) {
                                        log.error("danh gia san pham that bai: " + e.getMessage());
                                        result = RATING_FAIL;
                                }
                        }
                }
                else {
                        log.info("nguoi dung chua login khi danh gia");
                        result = NO_LOGIN;
                }
                JsonHandler.writeJson(result);                

                return JSON;
        }
        
        public String sendComment(){
                Integer result = RATING_SUCCESS;
                NguoiDung user = SecurityHelper.getUser();
                if (user != null){
                        String strId = request.getParameter("id");                
                        String msg = request.getParameter("msg");        
                        if (Util.tryParseInt(strId)){
                                int id = Integer.parseInt(strId);                                
                                try {
                                        SanPham sp = sanPhamService.getSanPhamTheoId(id);
                                        BinhLuan bl = new BinhLuan(sp, user, msg, new Date());
                                        binhLuanService.insertBinhLuan(bl);
                                        
                                        log.info("nguoi dung " + user.getMaNd() + " gui mot binh luan cho san pham " + strId);
                                } catch (Exception e) {
                                        log.error("gui binh luan that bai " + e.getMessage());
                                        result = RATING_FAIL;
                                }
                        }
                }
                else {
                        log.info("nguoi dung chua login khi binh luan");
                        result = NO_LOGIN;
                }
                JsonHandler.writeJson(result);                
                
                return JSON;
        }
        
        public String getComments(){
                String strId = request.getParameter("id");
                String strPage = request.getParameter("page");
                if (Util.tryParseInt(strId) && Util.tryParseInt(strPage)){
                        int id = Integer.parseInt(strId);                                
                        int page = Integer.parseInt(strPage);
                        page = page < 1 ? 1 : page;
                        int start = NUMBER_COMMENTS * (page - 1);
                        
                        List<BinhLuan> list = binhLuanService.getListBinhLuanTheoMaSP(id, start, NUMBER_COMMENTS);
                        int cmmCount = binhLuanService.demSoBinhLuanCuaSanPham(id);
                        int totalPage = cmmCount / NUMBER_COMMENTS;
                        if (totalPage * NUMBER_COMMENTS < cmmCount){
                                totalPage++;
                        }
                        
                        request.setAttribute("list", list);
                        request.setAttribute("totalPage", totalPage);
                        request.setAttribute("currentPage", page);
                        
                        return SUCCESS;
                }
                                
                return ERROR;
        }
        
        public String getRelativeProduct(){
                String strId = request.getParameter("id");
                if (Util.tryParseInt(strId)){
                        int id = Integer.parseInt(strId);
                        List<SanPham> listProduct = sanPhamService.getListSanPhamLienQuan(id);
                        request.setAttribute("listProduct", listProduct);
                }
                
                return SUCCESS;
        }
        
        public void setServletRequest(HttpServletRequest request) {
                this.request = request;                
        }
}