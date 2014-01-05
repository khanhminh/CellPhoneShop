<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table>
    <tbody>
       	<!-- <tr>
            <td colspan="3" class="titleinfo">Thông số kỹ thuật</td>
        </tr> -->
        
        <!-- chi tiet man hinh -->
        <tr class="group">
            <td class="group-info" colspan="3">Màn hình</td>
        </tr>
        <tr>
        	<td class="none-border"></td>
            <td class="name-info">Loại màn hình:</td>
            <%-- <td>${info.loaiManhinh}&nbsp;${info.loaiManhinh.soMauManHinh}</td> --%>
            <td>${info.loaiManhinh}&nbsp;${info.soMauManHinh}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Kích thước màn hình:</td>
            <td>${info.kichThuocManHinh} inch</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Độ phân giải:</td>
            <td>${info.doPhanGiaiManHinh} pixels</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Cảm ứng:</td>
            <td>${info.camUng}</td>
        </tr>
        
        <!-- cau hinh chi tiet -->
        <tr class="group">
            <td class="group-info" colspan="3">Cấu hình chi tiết</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Hệ điều hành:</td>
            <td>${info.heDieuHanh.tenHdh}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">CPU</td>
            <td>${info.chipset}&nbsp;${info.soNhanCpu}&nbsp;${info.tocDoCpu}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">GPU:</td>
            <td>${info.gpu}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">RAM:</td>
            <td>${info.ram}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Bộ nhớ trong(ROM):</td>
            <td>${info.boNhoTrong}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Hỗ trợ thẻ nhớ ngoài:</td>
            <td>${info.dungLuongTheToiDa} GB</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Camera sau:</td>
            <td>${info.cameraSau}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Camera trước:</td>
            <td>${info.cameraTruoc}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Quay phim:</td>
            <td>${info.quayPhim}</td>
        </tr>
        <tr class="group">
            <td class="group-info" colspan="3">Chức năng khác</td>
        </tr>        
         <tr>
            <td class="none-border"></td>
            <td class="name-info">Số SIM hỗ trợ:</td>
            <td>${info.soLuongSim}</td>
        </tr>  
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Ngôn ngữ:</td>
            <td>--</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Jack tai nghe:</td>
            <td>3.5</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Cảm biến:</td>
            <td>${info.boCamBien}</td>
        </tr>        
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Bàn phím:</td>
            <td>${info.loaiBanPhim}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Ghi âm:</td>
            <td>Có</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Radio FM:</td>
            <td>Có</td>
        </tr>
        <tr class="group">
            <td class="group-info" colspan="3">Kết nối dữ liệu</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">2G:</td>
            <td>${info.mang2g}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">3G:</td>
            <td>${info.mang3g}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Wifi:</td>
            <td>${info.wifi}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">GPS:</td>
            <td>${info.gps}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Bluetooth:</td>
            <td>${info.bluetooth}</td>
        </tr>
        <tr class="group">
            <td class="group-info" colspan="3">Thông số vật lý</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Pin</td>
            <td>${info.congNghePin}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Dung lượng Pin</td>
            <td>${info.dungLuongPin}</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Trọng lượng</td>
            <td>${info.trongLuong} gam</td>
        </tr>
        <tr>
            <td class="none-border"></td>
            <td class="name-info">Kích thước</td>
            <td>${info.chieuRong}&nbsp;x&nbsp;
            	${info.chieuCao}&nbsp;x&nbsp;
            	${info.doDay}
            </td>
        </tr>
    </tbody>
</table>