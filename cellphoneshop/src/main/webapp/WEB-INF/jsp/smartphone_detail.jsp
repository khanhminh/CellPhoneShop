<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table>
    <tbody>
       	<tr>
            <td colspan="3" class="titleinfo">Thông số kỹ thuật</td>
        </tr>
        <tr class="group">
            <td class="group-info">Màn hình</td>
            <td class="name-info">Loại màn hình:</td>
            <td>${info.loaiManhinh }</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Kích thước màn hình:</td>
            <td>${info.kichThuocManHinh} inch</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Độ phân giải:</td>
            <td>${info.doPhanGiaiManHinh} pixels</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Cảm ứng:</td>
            <td>${info.camUng}</td>
        </tr>
        <tr class="group">
            <td class="group-info">Cấu hình chi tiết:</td>
            <td class="name-info">Hệ điều hành:</td>
            <td>${info.hedieuhanh.tenHdh}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">CPU</td>
            <td>${info.chipset} ${info.tocDoCpu}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">GPU:</td>
            <td>${info.gpu}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Bộ nhớ trong(ROM):</td>
            <td>${info.boNhoTrong}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">RAM:</td>
            <td>${info.ram}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Ngôn ngữ:</td>
            <td>--</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Hỗ trợ thẻ nhớ:</td>
            <td>${info.theNhoNgoai}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Camera:</td>
            <td>${info.cameraSau}</td>
        </tr>
        <tr class="group">
            <td class="group-info">Chức năng khác:</td>
            <td class="name-info">Số SIM hỗ trợ:</td>
            <td>1</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Jack tai nghe:</td>
            <td>3.5</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Cảm biến:</td>
            <td>${info.boCamBien}</td>
        </tr>        
        <tr>
            <td></td>
            <td class="name-info">Bàn phím:</td>
            <td>${info.loaibanphim.tenLoaiBanPhim}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Ghi âm:</td>
            <td>Có</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Radio FM:</td>
            <td>Có</td>
        </tr>
        <tr class="group">
            <td class="group-info">Kết nối dữ liệu:</td>
            <td class="name-info">2G:</td>
            <td>${info.mang2g}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">3G:</td>
            <td>${info.mang3g}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Wifi:</td>
            <td>${info.wifi}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">GPS:</td>
            <td>${info.gprs}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Bluetooth:</td>
            <td>${info.bluetooth}</td>
        </tr>
        <tr class="group">
            <td class="group-info">Thông số vật lý:</td>
            <td class="name-info">Pin</td>
            <td>${info.congNghePin}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Dung lượng Pin</td>
            <td>${info.dungLuongPin}</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Trọng lượng</td>
            <td>300 g</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Kích thước</td>
            <td>--</td>
        </tr>
        <tr>
            <td></td>
            <td class="name-info">Bảo hành:</td>
            <td>12 tháng</td>
        </tr>
    </tbody>
</table>