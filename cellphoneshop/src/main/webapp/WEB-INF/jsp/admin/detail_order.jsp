<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý đơn hàng</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Chi tiết đơn hàng</a></li>
	</ul>
</div>

<c:choose>
	<c:when test="${order != null}">

		<div class="row-fluid sortable">
			<div class="box span12">
				<div class="box-header well" data-original-title>
					<h2>
						<i class="icon-list-alt"></i>Sản phẩm
					</h2>
					<div class="box-icon"></div>
				</div>
				<div class="box-content">

					<table id="table-order"
						class="table table-striped table-bordered bootstrap-datatable">
						<tr>
							<th>STT</th>
							<th>Sản phẩm</th>
							<th>Giá</th>
							<th>Số lượng</th>
							<th>Giảm giá</th>
							<th>Tổng cộng</th>
						</tr>
						<c:forEach var="detail" items="${order.ctDonHangs}" varStatus="i">
							<c:set var="total"
								value="${total + (detail.giaTungSp * detail.soLuong - detail.giamGiaTungSp)}" />
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
								<td>
									<a href="<c:url value='/detail?product=${detail.sanPham.maSp}'/>">${detail.sanPham.tenSp}</a>
								</td>
								<td><fmt:formatNumber value="${detail.giaTungSp}"
										type="number" /> VNĐ</td>
								<td>${detail.soLuong}</td>
								<td><fmt:formatNumber value="${detail.giamGiaTungSp}"
										type="number" /> VNĐ</td>
								<td><fmt:formatNumber value="${detail.tongGiaTri}"
										type="number" /> VNĐ</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5" style="font-weight: bold; text-align: right;">Tổng
								cộng</td>
							<td style="font-weight: bold; color: red;"><fmt:formatNumber
									value="${total}" type="number" /> VNĐ</td>
						</tr>
					</table>

				</div>
			</div>
		</div>

		<div class="row-fluid sortable">
			<div class="box span6">
				<div class="box-header well" data-original-title>
					<h2>
						<i class="icon-user"></i>Người nhận
					</h2>
					<div class="box-icon"></div>
				</div>
				<div class="box-content">


					<table
						class="table table-striped table-bordered bootstrap-datatable">

						<tr style="background-color: #ffffff; border: #ccc solid 1px;">
							<td style="font-weight: bold;">Họ tên</td>
							<td>${order.nguoiNhan.hoTen}</td>
						</tr>
						<tr style="background-color: #f1f8f9; border: #ccc solid 1px;">
							<td style="font-weight: bold;">Điện thoại</td>
							<td>${order.nguoiNhan.soDienThoai}</td>
						</tr>
						<tr style="background-color: #ffffff; border: #ccc solid 1px;">
							<td style="font-weight: bold;">Địa chỉ</td>
							<td>${order.nguoiNhan.diaChi}</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="box span6">
				<div class="box-header well" data-original-title>
					<h2>
						<i class="icon-info-sign"></i>Thông tin
					</h2>
					<div class="box-icon"></div>
				</div>
				<div class="box-content">
					<table
						class="table table-striped table-bordered bootstrap-datatable">

						<tr style="background-color: #ffffff; border: #ccc solid 1px;">
							<td style="font-weight: bold;">Trạng thái</td>
							<td>
								<c:choose>
									<c:when test="${order.trangThaiDonHang.maTrangThai == 1}">
										<span class="label label-important">${order.trangThaiDonHang.tenTrangThai}</span>
									</c:when>
									<c:when test="${order.trangThaiDonHang.maTrangThai == 2}">
										<span class="label label-success">${order.trangThaiDonHang.tenTrangThai}</span>
									</c:when>
									<c:otherwise>
										<span class="label label-warning">${order.trangThaiDonHang.tenTrangThai}</span>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr style="background-color: #f1f8f9; border: #ccc solid 1px;">
							<td style="font-weight: bold;">Phương thức thanh toán</td>
							<td>
								${order.ptThanhToan.tenPtthanhToan}
							</td>
						</tr>
						<tr style="background-color: #ffffff; border: #ccc solid 1px;">
							<td style="font-weight: bold;">Phương thức giao hàng</td>
							<td>
								${order.ptGiaoHang.tenPtgiaoHang}
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<a class="btn btn-info" href="edit_order?id=${order.maDonHang}"> <i class="icon-edit icon-white"></i>
			Cập nhật
		</a>
		<a class="btn btn-success" href="list_order"> <i class="icon-share-alt icon-white"></i>
			Trở lại danh sách
		</a>
	</c:when>
	<c:otherwise>
		<div class="alert alert-error">
			<strong>Không tìm thấy đơn hàng!</strong>
		</div>
	</c:otherwise>
</c:choose>