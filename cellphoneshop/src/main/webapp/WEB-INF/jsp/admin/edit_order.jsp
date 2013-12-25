<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý đơn hàng</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Cập nhật đơn hàng</a></li>
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
							<th>Tổng cộng</th>
						</tr>
						<c:forEach var="detail" items="${order.ctDonHangs}" varStatus="i">
							<c:set var="total"
								value="${total + (detail.giaTungSp * detail.soLuong)}" />
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
								<td><fmt:formatNumber value="${detail.tongGiaTri}"
										type="number" /> VNĐ</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4" style="font-weight: bold; text-align: right;">Tổng
								cộng</td>
							<td style="font-weight: bold; color: red;"><fmt:formatNumber
									value="${total}" type="number" /> VNĐ</td>
						</tr>
					</table>

				</div>
			</div>
		</div>

		<div class="row-fluid sortable">
			<div class="box span12">
				<div class="box-header well" data-original-title>
					<h2>
						<i class="icon-user"></i>Thông tin giao hàng
					</h2>
					<div class="box-icon"></div>
				</div>
				<div class="box-content">

					<form class="form-horizontal" method="post">
						<div class="validation-summary-errors">
							<ul>
								<c:forEach var="e" items="${requestScope.errors}">
									<li>${e}</li>
								</c:forEach>
							</ul>
						</div>
						<div>
							<c:choose>
								<c:when test="${isSuccess != null && isSuccess}">
									<span style="color:green;font-weight: bold;">Cập nhật thành công</span>
									<div style="clear:both; margin-bottom: 20px"></div>
								</c:when>
								<c:when test="${isSuccess != null && !isSuccess}">
									<span style="color:red;font-weight: bold;">Cập nhật thất bại</span>
									<div style="clear:both; margin-bottom: 20px"></div>
								</c:when>
							</c:choose>
						</div>
						<fieldset>
							<input type="hidden" name="donHang.maDonHang" value="${order.maDonHang}">
							<div class="control-group">
								<label class="control-label" for="order.nguoiNhan.hoTen">Họ tên</label>
								<div class="controls">
									<input class="text-box single-line input-xlarge focused" data-val="true"
										data-val-required="Vui lòng nhập họ tên"
										name="donHang.nguoiNhan.hoTen" type="text" 
										value="${order.nguoiNhan.hoTen}">
									<span class="field-validation-valid" data-valmsg-for="donHang.nguoiNhan.hoTen"
										data-valmsg-replace="true">
									</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="order.nguoiNhan.soDienThoai">Điện thoại</label>
								<div class="controls">					
									<input class="text-box single-line input-xlarge focused" data-val="true"
										data-val-regex="Số điện thoại không hợp lệ"
										data-val-regex-pattern="^\d{6,11}$"
										data-val-required="Vui lòng nhập điện thoại liên lạc"
										name="donHang.nguoiNhan.soDienThoai" type="text"
										value="${order.nguoiNhan.soDienThoai}">
									<span class="field-validation-valid"
										data-valmsg-for="donHang.nguoiNhan.soDienThoai" data-valmsg-replace="true">
									</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="order.nguoiNhan.diaChi">Địa chỉ</label>
								<div class="controls">
									<input class="text-box single-line input-xlarge focused" data-val="true"
										data-val-required="Vui lòng nhập địa chỉ"
										name="donHang.nguoiNhan.diaChi" type="text" 
										value="${order.nguoiNhan.diaChi}">
									<span class="field-validation-valid" data-valmsg-for="donHang.nguoiNhan.diaChi"
										data-valmsg-replace="true">
									</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Phương thức giao hàng</label>
								<div class="controls">
									<c:forEach var="pt" items="${ptgh}">
									  <label class="radio">										
										<input data-val="true" data-val-required="Vui lòng chọn phương thức giao hàng"
											name="donHang.ptGiaoHang.maPtgiaoHang"
											type="radio" value="${pt.maPtgiaoHang}"											
											<c:if test="${pt.maPtgiaoHang == order.ptGiaoHang.maPtgiaoHang}">
												checked="checked"
											</c:if>
											>
										${pt.tenPtgiaoHang}
									  </label>
									  <div style="clear:both"></div>
								  	</c:forEach>
									<span class="field-validation-valid"
										data-valmsg-for="donHang.ptGiaoHang.maPtgiaoHang"
										data-valmsg-replace="true"> 
									</span>
								</div>
							 </div>
							 <div class="control-group">
								<label class="control-label">Phương thức thanh toán</label>
								<div class="controls">
									<c:forEach var="ptt" items="${pttt}">
									  <label class="radio">										
										<input data-val="true" data-val-required="Vui lòng chọn phương thức thanh toán"
											name="donHang.ptThanhToan.maPtthanhToan"
											type="radio" value="${ptt.maPtthanhToan}"
											<c:if test="${ptt.maPtthanhToan == order.ptThanhToan.maPtthanhToan}">
												checked="checked"
											</c:if>
											>
										${ptt.tenPtthanhToan}
									  </label>
									  <div style="clear:both"></div>
								  	</c:forEach>
									<span class="field-validation-valid"
										data-valmsg-for="donHang.ptThanhToan.maPtthanhToan" 
										data-valmsg-replace="true">
									</span>
								</div>
							 </div>
							 <div class="control-group">
								<label class="control-label">Trạng thái</label>
								<div class="controls">
									<c:forEach var="tt" items="${listStatus}">
									  <label class="radio">										
										<input data-val="true" data-val-required="Vui lòng chọn trạng thái"
											name="donHang.trangThaiDonHang.maTrangThai"
											type="radio" value="${tt.maTrangThai}"
											<c:if test="${tt.maTrangThai == order.trangThaiDonHang.maTrangThai}">
												checked="checked"
											</c:if>
											>
										${tt.tenTrangThai}
									  </label>
									  <div style="clear:both"></div>
								  	</c:forEach>
									<span class="field-validation-valid"
										data-valmsg-for="donHang.trangThaiDonHang.maTrangThai" 
										data-valmsg-replace="true">
									</span>
								</div>
							 </div>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">Lưu</button>
								<a class="btn btn-success" href="list_order"> 
									<i class="icon-share-alt icon-white"></i>
									Trở lại danh sách
								</a>
							</div>
						</fieldset>
					</form>					
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="alert alert-error">
			<strong>Không tìm thấy đơn hàng!</strong>
		</div>
	</c:otherwise>
</c:choose>