<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">SO SÁNH</h2>
		<div class="nav-page push10">
			<a>Sản phẩm</a> » <span class="active-link"> <a>So Sánh</a>
			</span>
		</div>
		<div class="compare-header">
			<span>SẢN PHẨM</span>
		</div>
		<c:set var="width" value="${80.0 / fn:length(listProduct)}"/>
		<div class="compare-products clear">
			<div class="one_fifth header-row"></div>
			<c:forEach var="item" items="${requestScope.listProduct}">
				<c:set var="sp" value="${item.product}"/>
				<div class="compare-product one_fifth"  style="width: ${width}%">
				<a href="detail?product=${sp.maSp}"> 
					<img src="${sp.hinhDaiDien}" style="height: 200px"/>
				</a>
				<div class="compare-product-info">
					<h2>
						<a href="detail?product=${sp.maSp}">${sp.tenSp}</a>
					</h2>
					<h3>
						<fmt:formatNumber value="${sp.gia}" type="number" />
						VNĐ
					</h3>
				</div>
				<a href="editcart?action=add&product=${sp.maSp}"> <img
					src="resources/images/btn_addcart_vn.gif" />
				</a>
				<div class="clear"></div>
			</div>
			</c:forEach>
		</div>
		
		<div class="compare-rating" id="compare-rating">
			<div class="compare-header">
				<span>ĐÁNH GIÁ</span>
			</div>
			<table class="compare-table">
				<tr>
					<td class="header-row"></td>
					<c:forEach var="item" items="${requestScope.listProduct}">
						<c:set var="sp" value="${item.product}"/>
						<td style="width: ${width}%">
						<div class="compare-star" data-score="${sp.diemDanhGiaTb}">
							<img src="resources/images/star-off.png" />
							<img src="resources/images/star-off.png" />
							<img src="resources/images/star-off.png" />
							<img src="resources/images/star-off.png" />
							<img src="resources/images/star-off.png" /> 
						</div>
						<div class="compare-score">
							<span>${sp.diemDanhGiaTb}</span>
						</div>
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>

		<div class="compare-info-product">
			<div class="compare-header">
				<span>CHI TIẾT SẢN PHẨM</span>
			</div>
			<table class="compare-table">
				<tr>
					<td class="header-row">Loại màn hình</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td style="width: ${width}%">${info.loaiManhinh}&nbsp;${info.soMauManHinh}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Kích thước màn hình</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.kichThuocManHinh} inch</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Độ phân giải</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.doPhanGiaiManHinh} pixels</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Cảm ứng</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.camUng}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Hệ điều hành</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.heDieuHanh.tenHdh}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">CPU</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.chipset}&nbsp;${info.soNhanCpu}&nbsp;${info.tocDoCpu}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">GPU</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.gpu}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">RAM</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.ram}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Bộ nhớ trong(ROM)</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.boNhoTrong}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Hỗ trợ thẻ nhớ ngoài</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.dungLuongTheToiDa}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Camera sau</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.cameraSau}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Camera trước</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.cameraTruoc}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Quay phim</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.quayPhim}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Số SIM hỗ trợ</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.soLuongSim}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Cảm biến</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.boCamBien}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">2G</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.mang2g}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">3G</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.mang3g}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">4G</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.mang4g}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Wifi</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.wifi}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">GPS</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.gps}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Bluetooth</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.bluetooth}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Pin</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.congNghePin}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Dung lượng Pin</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.dungLuongPin}</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Trọng lượng</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>${info.trongLuong} gam</td>
					</c:forEach>
				</tr>
				<tr>
					<td class="header-row">Kích thước</td>
					<c:forEach var="detail" items="${requestScope.listProduct}">
						<c:set var="info" value="${detail.detail}" scope="page" />
						<td>
							${info.chieuRong}&nbsp;x&nbsp;
	            			${info.chieuCao}&nbsp;x&nbsp;
	            			${info.doDay}
            			</td>
					</c:forEach>
				</tr>
			</table>
		</div>

		<div class="clear push20"></div>
	</div>
</div>
<script>
	function showRating(context, score){
		if (score == 0)
			return;

		var arr = [ 0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5 ];
		var min = arr[0];
		for (var i = 1; i < arr.length; i++) {
			if (Math.abs(arr[i] - score) < Math.abs(min - score)) {
				min = arr[i];
			}
		}
		score = min;
		var limit = Math.round(score - 0.1);

		var list = $(context).children();
		var index = 0;
		for (; index < list.length; index++) {
			var img = $(list[index]);
			if (index < limit) {
				img.attr('src', "resources/images/star-on.png");
			} else {
				img.attr('src', "resources/images/star-off.png");
			}
		}
		if (score - limit > 0.1) {
			var img = $(list[limit]);
			img.attr('src', "resources/images/star-half.png");
		}
	}
	
	function setRating(){
		var ratings = $('#compare-rating').find('.compare-star');
		for (var i = 0; i < ratings.length; i++) {
			var rating = ratings[i];
			var score = $(rating).attr('data-score');
			showRating(rating, score);
		}
	}

	$(document).ready(function(){
		setRating();
	});
</script>