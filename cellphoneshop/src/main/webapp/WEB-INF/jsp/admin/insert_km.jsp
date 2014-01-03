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
				<i class="icon-user"></i>Thêm 1 chương trình khuyến mãi
			</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-minimize btn-round"><i
					class="icon-chevron-up"></i></a>
			</div>
		</div>
		<div class="box-content">
			<form class="form-horizontal" action="insert_km" method="post"
				enctype="multipart/form-data">
				<div class="validation-summary-errors">
					<ul>
						<!-- danh sách lỗi nếu có errors là List<String>-->
						<c:forEach var="e" items="${requestScope.errors}">
							<li>${e}</li>
						</c:forEach>
					</ul>
				</div>
	
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="insertKm.tieuDe"> Tiêu Đề KM *</label>
						<div class="controls">
							<s:textarea class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="insertKm.tieuDe" data-val="true"
								data-val-required="Vui lòng nhập tiêu đề của khuyến mãi"
								/>

							<span class="field-validation-valid" data-valmsg-for="insertKm.tieuDe"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="insertKm.moTa"> Mổ tả về KM *</label>
						<div class="controls">
							<s:textarea class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="insertKm.moTa" data-val="true"
								data-val-required="Vui lòng nhập mô tả của khuyến mãi"
								/>

							<span class="field-validation-valid" data-valmsg-for="insertKm.moTa"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="insertKm.phanTramGiamGia"> %
							Giảm giá </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="insertKm.phanTramGiamGia"
								data-val="false" value="%{giamgia}" />

							<span class="field-validation-valid"
								data-valmsg-for="insertKm.phanTramGiamGia" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="insertKm.ngayBatDau">Ngày Bắt
							Đầu KM *</label>
						<div class="controls">
							<s:textfield cssClass="text-box single-line input-xlarge datepicker"
								type="text" theme="simple" name="insertKm.ngayBatDau" data-val="true"
								data-val-required="Vui lòng nhập ngày bắt đầu"/>
							<span class="field-validation-valid"
								data-valmsg-for="insertKm.ngayBatDau" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="insertKm.ngayKetThuc">Ngày Kết
							Thúc KM *</label>
						<div class="controls">
							<s:textfield cssClass="text-box single-line input-xlarge focused datepicker"
								type="text" theme="simple" name="insertKm.ngayKetThuc" data-val="true"
								data-val-required="Vui lòng nhập ngày kết thúc"
								data-val-regex="Giá trị không hợp lệ"/>

							<span class="field-validation-valid"
								data-valmsg-for="insertKm.ngayKetThuc" data-valmsg-replace="true">
							</span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="insertKm.quaTang"> Quà Tặng Đi
							Kèm</label>
						<div class="controls">
							<s:textarea class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="insertKm.quaTang"/>

							<span class="field-validation-valid" data-valmsg-for="insertKm.quaTang"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">

						<label class="control-label" for="myFile">Hình ảnh KM *</label>
						<div class="controls">
							<input class="input-file uniform_on" type="file" name="myFile"
							data-val="true" data-val-required="Vui lòng chọn hình ảnh khuyến mãi"
							/>
						</div>
					</div>
					<!-- 					<input type="file" name="myFile" /> -->

					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Thêm
							khuyến mãi</button>
					</div>
				</fieldset>
			</form>
		</div>

	</div>
</div>





