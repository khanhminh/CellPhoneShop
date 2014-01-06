<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper row3">
	<div id="container">
		<div class="title-content">
			<h2>Chi tiết đơn hàng</h2>
		</div>
		<div class="nav-page push30">
			<a>Cellphone</a> » <a href="list_order.action">Quản lý đơn
				hàng</a> » <span class="active-link"><a>Chi tiết đơn hàng</a></span>
		</div>


		<h3 class="title-info">CHI TIẾT ĐƠN HÀNG</h3>
		<c:choose>
			<c:when test="${order != null}">
				<table id="table-order">
					<tr>
						<th>STT</th>
						<th>Sản phẩm</th>
						<th>Giá</th>
						<th>Số lượng</th>
						<th>Giảm giá</th>
						<th>Tổng cộng</th>
					</tr>
					<c:forEach var="detail" items="${order.ctDonHangs}" varStatus="i">
						<c:set var="total" value="${total + (detail.giaTungSp * detail.soLuong - detail.giamGiaTungSp)}"/>
						<tr
							<c:choose>
						<c:when test="${i.index % 2 == 0}">
							style="background-color:#ffffff"
						</c:when>
						<c:otherwise>
							style="background-color:#f1f8f9"
						</c:otherwise>
					</c:choose>>
							<td>${i.count}</td>
							<td><a href="detail?product=${detail.sanPham.maSp}">${detail.sanPham.tenSp}</a></td>
							<td><fmt:formatNumber value="${detail.giaTungSp}"
									type="number" /> VNĐ</td>
							<td>${detail.soLuong}</td>
							<td>
								<fmt:formatNumber value="${detail.giamGiaTungSp}"
									type="number" /> VNĐ</td>
							<td><fmt:formatNumber value="${detail.tongGiaTri}"
									type="number" /> VNĐ</td>							
						</tr>
					</c:forEach>
						<tr>
							<td colspan="5" style="font-weight: bold;text-align: right;">Tổng cộng</td>
							<td style="font-weight: bold;color: red;">
								<fmt:formatNumber value="${total}"
									type="number" /> VNĐ
							</td>
						</tr>
				</table>
				<table style="width: 400px;border: #ccc solid 1px;">
					<tr>
						<th colspan="2" style="background-color: #c7e9f0;padding: 10px 5px 10px 5px;">Người nhận</th>
					</tr>
					<tr style="background-color:#ffffff;border: #ccc solid 1px;">
						<td>Họ tên</td>
						<td>${order.nguoiNhan.hoTen}</td>
					</tr>
					<tr style="background-color:#f1f8f9;border: #ccc solid 1px;">
						<td>Điện thoại</td>
						<td>${order.nguoiNhan.soDienThoai}</td>
					</tr>
					<tr style="background-color:#ffffff;border: #ccc solid 1px;">
						<td>Địa chỉ</td>
						<td>${order.nguoiNhan.diaChi}</td>
					</tr>
				</table>
				<div>
					<span style="color: blue; font-weight: bold;">Phương thức thanh toán: </span><span>${order.ptThanhToan.tenPtthanhToan}</span>
				</div>
				<div>
					<span style="color: blue; font-weight: bold;">Phương thức giao hàng: </span><span>${order.ptGiaoHang.tenPtgiaoHang}</span>
				</div>
				<div class="push30"></div>
			</c:when>
			<c:otherwise>
				<h5 class="notify-order">Không tìm thấy đơn hàng</h5>
			</c:otherwise>
		</c:choose>
	</div>
</div>