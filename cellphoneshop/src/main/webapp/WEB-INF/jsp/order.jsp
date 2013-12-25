<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper row3">
	<div id="container">
		<div class="title-content">
			<h2>QUẢN LÝ ĐƠN HÀNG</h2>
		</div>
		<div class="nav-page push30">
			<a>Cellphone</a> » <span class="active-link"> <a>Quản lý đơn hàng</a>
			</span>
		</div>

		<div id="title-order">
			<h3>DANH SÁCH ĐƠN HÀNG</h3>
			<div class="filter-order">
				<label>Trạng thái: </label>
				<select id="select-status">
					<option value="all">Tất cả</option>
					<c:forEach var="status" items="${listStatus}">
						<option value="${status.maTrangThai}"
							<c:if test="${status.maTrangThai == id}">
								selected="true"
							</c:if>
						>
							${status.tenTrangThai}
						</option>
					</c:forEach>
				</select>				
			</div>
			<div class="clear"></div>
		</div>
		<c:choose>
			<c:when test="${not empty listOrder}">
				<table id="table-order">
			<tr>
				<th>Mã đơn hàng</th>
				<th>Ngày đặt hàng</th>
				<th>Tổng giá trị</th>
				<th>Giảm giá</th>
				<th>Trạng thái</th>
				<th>Chi tiết</th>
			</tr>
			<c:forEach var="dh" items="${listOrder}" varStatus="i">
				<tr
					<c:choose>
						<c:when test="${i.index % 2 == 0}">
							style="background-color:#ffffff"
						</c:when>
						<c:otherwise>
							style="background-color:#f1f8f9"
						</c:otherwise>
					</c:choose>
					>
					<td>${dh.maDonHang}</td>
					<td>						
						<fmt:formatDate pattern="dd/MM/yyyy" value="${dh.ngayDatHang}" />
					</td>
					<td>
						<fmt:formatNumber value="${dh.tongGiaTri}" type="number" />
						VNĐ
					</td>
					<td>
						<c:choose>
							<c:when test="${dh.giamGia == null}">
								0 VNĐ
							</c:when>
							<c:otherwise>
								<fmt:formatNumber value="${dh.giamGia}" type="number" />
								VNĐ
							</c:otherwise>
						</c:choose>
					</td>
					<td>${dh.trangThaiDonHang.tenTrangThai}</td>
					<td>
						<a href="order_detail.action?id=${dh.maDonHang}">Xem</a>
					</td>
				</tr>
			</c:forEach>
		</table>
			</c:when>
			<c:otherwise>
				<h5 class="notify-order">Bạn không có đơn hàng nào</h5>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<script>	
	$(document).ready(function() {
		$('#select-status').change(function(){
			window.location.href = "list_order.action?status=" + $(this).val();
		});
	});
</script>