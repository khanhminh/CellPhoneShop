<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý Khuyến Mãi</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Danh sách Khuyến Mãi</a> <span class="divider">/</span></li>
		<li><a href="#">Chi Tiết Khuyến Mãi</a></li>
	</ul>
</div>
<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2>
				<i class="icon-user"></i>Cập nhật thông tin khuyến mãi đang mở
			</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-minimize btn-round"><i
					class="icon-chevron-up"></i></a>
			</div>
		</div>
		<div class="box-content">
			<form class="form-horizontal" action="process_update_km"
				method="post" enctype="multipart/form-data">
				<div class="validation-summary-errors">
					<ul>
						<!-- danh sách lỗi nếu có errors là List<String>-->
						<c:forEach var="e" items="${requestScope.errors}">
							<li>${e}</li>
						</c:forEach>
					</ul>
				</div>

				<s:set var="ngayKT">
					<fmt:formatDate pattern="MM/dd/yyyy"
						value="${requestScope.km.ngayKetThuc}" />
				</s:set>

				<fieldset>
<!-- 					<div class="control-group"> -->
<!-- 						<label class="control-label" for="km.tieuDe"> ID KM </label> -->
<!-- 						<div class="controls"> -->
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${not empty requestScope.km.maKm}"> --%>
<%-- 									<s:set var="tieuDe">${requestScope.km.maKm}</s:set> --%>
<%-- 									<s:textarea cssClass="uneditable-input" name="km.tieuDe" value="%{tieuDe}" /> --%>
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<%-- 								<s:textarea cssClass="text-box single-line uneditable-input" --%>
<%-- 										type="text" theme="simple" name="km.tieuDe" data-val="true" --%>
<%-- 										data-val-required="Vui lòng nhập tiêu đề của khuyến mãi"/> --%>
<%-- 								</c:otherwise> --%>
<%-- 							</c:choose> --%>
<%-- 							<span class="field-validation-valid" data-valmsg-for="km.tieuDe" --%>
<%-- 								data-valmsg-replace="true"> </span> --%>
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="control-group">
						<label class="control-label" for="km.tieuDe"> Tiêu Đề KM </label>
						<div class="controls">
							<c:choose>
								<c:when test="${not empty requestScope.km.tieuDe}">
									<s:set var="tieuDe">${requestScope.km.tieuDe}</s:set>
									<s:textarea class="text-box single-line input-xlarge focused"
										type="text" theme="simple" name="km.tieuDe" data-val="true"
										data-val-required="Vui lòng nhập tiêu đề của khuyến mãi"
										value="%{tieuDe}" />
								</c:when>
								<c:otherwise>
									<s:textarea class="text-box single-line input-xlarge focused"
										type="text" theme="simple" name="km.tieuDe" data-val="true"
										data-val-required="Vui lòng nhập tiêu đề của khuyến mãi" />
								</c:otherwise>
							</c:choose>


							<span class="field-validation-valid" data-valmsg-for="km.tieuDe"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="km.moTa"> Mổ tả về KM </label>
						<div class="controls">
							<c:choose>
								<c:when test="${not empty requestScope.km.moTa}">
									<s:set var="moTa">${requestScope.km.moTa}</s:set>
									<s:textarea class="text-box single-line input-xlarge focused"
										type="text" theme="simple" name="km.moTa" data-val="true"
										data-val-required="Vui lòng nhập mô tả của khuyến mãi"
										value="%{moTa}" />
								</c:when>
								<c:otherwise>
									<s:textarea class="text-box single-line input-xlarge focused"
										type="text" theme="simple" name="km.moTa" data-val="true"
										data-val-required="Vui lòng nhập mô tả của khuyến mãi" />
								</c:otherwise>
							</c:choose>

							<span class="field-validation-valid" data-valmsg-for="km.moTa"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="km.phanTramGiamGia"> %
							Giảm giá </label>
						<div class="controls">

							<c:choose>
								<c:when
									test="${ not empty requestScope.km.phanTramGiamGia and requestScope.km.phanTramGiamGia != 0.0}">
									<s:set var="giamgia">
										<fmt:formatNumber type="number"
											value="${requestScope.km.phanTramGiamGia}"
											maxFractionDigits="2" minFractionDigits="1" />
									</s:set>
									<s:textfield class="text-box single-line input-xlarge focused"
										type="text" theme="simple" name="km.phanTramGiamGia"
										data-val="false" value="%{giamgia}" />
								</c:when>
								<c:otherwise>
									<s:textfield class="text-box single-line input-xlarge focused"
										type="text" theme="simple" name="km.phanTramGiamGia"
										data-val="false" />
								</c:otherwise>

							</c:choose>


							<span class="field-validation-valid"
								data-valmsg-for="km.phanTramGiamGia" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<c:choose>
						<c:when
							test="${not empty requestScope.km.ngayBatDau and(not empty requestScope.km.trangThaiKhuyenMai.maTrangThai and requestScope.km.trangThaiKhuyenMai.maTrangThai == 0)}">
							<s:set var="ngayBD">
								<fmt:formatDate pattern="MM/dd/yyyy"
									value="${requestScope.km.ngayBatDau}" />
							</s:set>
							<div class="control-group">
								<label class="control-label" for="km.ngayBatDau">Ngày
									Bắt Đầu KM </label>
								<div class="controls">

									<s:textfield
										cssClass="text-box single-line input-xlarge editable-input datepicker"
										type="text" theme="simple" name="km.ngayBatDau"										
										data-val="true" data-val-required="Vui lòng nhập ngày bắt đầu"
										value="%{ngayBD}" />


									<span class="field-validation-valid"
										data-valmsg-for="km.ngayBatDau" data-valmsg-replace="true">
									</span>
								</div>
							</div>
						</c:when>
						<c:when
							test="${not empty requestScope.km.ngayBatDau and(not empty requestScope.km.trangThaiKhuyenMai.maTrangThai and (requestScope.km.trangThaiKhuyenMai.maTrangThai == 1))}">
							<s:set var="ngayBD">
								<fmt:formatDate pattern="MM/dd/yyyy"
									value="${requestScope.km.ngayBatDau}" />
							</s:set>
							<div class="control-group">
								<label class="control-label" for="km.ngayBatDau">Ngày
									Bắt Đầu KM </label>
								<div class="controls">

									<s:textfield
										cssClass="text-box single-line input-xlarge uneditable-input"
										type="text" theme="simple" name="km.ngayBatDau"
										data-val="true" data-val-required="Vui lòng nhập ngày bắt đầu"
										readonly="readonly"
										value="%{ngayBD}" />


									<span class="field-validation-valid"
										data-valmsg-for="km.ngayBatDau" data-valmsg-replace="true">
									</span>
								</div>
							</div>
						</c:when>
					</c:choose>

					<div class="control-group">
						<label class="control-label" for="km.ngayKetThuc">Ngày Kết
							Thúc KM </label>
						<div class="controls">
							<c:choose>
								<c:when test="${not empty requestScope.km.ngayKetThuc}">
									<s:set var="ngayKT">
										<fmt:formatDate pattern="MM/dd/yyyy"
											value="${requestScope.km.ngayKetThuc}" />
									</s:set>
									<s:textfield
										cssClass="text-box single-line input-xlarge focused datepicker"
										type="text" theme="simple" name="km.ngayKetThuc"
										data-val="true" data-val-required="Vui lòng nhập ngày bắt đầu"
										data-val-regex="Giá trị không hợp lệ" value="%{ngayKT}" />
								</c:when>
								<c:otherwise>
									<s:textfield
										cssClass="text-box single-line input-xlarge focused datepicker"
										type="text" theme="simple" name="km.ngayKetThuc"
										data-val="true" data-val-required="Vui lòng nhập ngày bắt đầu"
										data-val-regex="Giá trị không hợp lệ" />

								</c:otherwise>
							</c:choose>


							<span class="field-validation-valid"
								data-valmsg-for="km.ngayKetThuc" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="km.quaTang"> Quà Tặng Đi
							Kèm</label>
						<div class="controls">

							<c:choose>
								<c:when test="${not empty requestScope.km.quaTang}">
									<s:set var="quaTang">${requestScope.km.quaTang}</s:set>
									<s:textarea class="text-box single-line input-xlarge focused"
										type="text" theme="simple" name="km.quaTang"
										value="%{quaTang}" />
								</c:when>
								<c:otherwise>
									<s:textarea class="text-box single-line input-xlarge focused"
										type="text" theme="simple" name="km.quaTang" />
								</c:otherwise>
							</c:choose>

							<span class="field-validation-valid" data-valmsg-for="km.quaTang"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">

						<label class="control-label" for="myFile">Hình ảnh KM</label>
						<div class="controls">
							<input class="input-file uniform_on" type="file" name="myFile" />
						</div>
					</div>
					<!-- 					<input type="file" name="myFile" /> -->

					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Cập nhật
							khuyến mãi</button>
					</div>
				</fieldset>
			</form>
		</div>

	</div>
</div>





