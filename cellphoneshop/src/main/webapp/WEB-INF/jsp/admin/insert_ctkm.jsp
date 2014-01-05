<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý chi tiết KM</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Danh sách chi tiết KM</a> <span class="divider">/</span></li>
	</ul>
</div>

<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2>
				<i class="icon-user"></i>Thêm 1 sản phẩm vào trong khuyến mãi hiện
				đang diễn ra
			</h2>
			<div class="box-icon"></div>
		</div>
		<div class="box-content">
			<c:set var="insertCTKMResult" value="${insertSuccess}" />
			<c:if test="${isSuccess == true}">
				<div>
					<img src='<c:url value='/resources/images/success_tick.png' />'> <span>Thêm
						1 sản phẩm vào trong khuyến mãi thành công</span> <img />
					<form action="insert_ctkm" method="post" style='display: inline;'>
						<input type="hidden" value="true" name="themSanPhamFlag" />
						<button type="submit" class="btn btn-primary">Thêm sản
							phẩm vào trong KM</button>
					</form>
					<hr />
				</div>
			</c:if>

			<c:if test="${isSuccess == null}">
			<form class="form-horizontal" action="insert_ctkm" method="post">
				<div class="validation-summary-errors">
					<ul>
						<!-- danh sách lỗi nếu có errors là List<String>-->
						<c:forEach var="e" items="${requestScope.errors}">
							<li>${e}</li>
						</c:forEach>
					</ul>
				</div>

				<h4>Tổng quan sản phẩm</h4>
				<p></p>

				<fieldset>

					<div class="control-group">
						<label class="control-label" for="maNhaSanXuat">Tiêu Đề KM</label>
						<div class="controls">
							<select name="ctKhuyenMai.khuyenMai.maKm" >
								<c:forEach items="${kmList}" var="km">
									<option value="${km.maKm}">${km.tieuDe}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="maNhaSanXuat">Tên SP Áp
							Dụng KM</label>
						<div class="controls">
							<select name="ctKhuyenMai.sanPham.maSp">
								<c:forEach items="${spList}" var="sp">
									<option value="${sp.maSp}">${sp.tenSp}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Thêm chi
							tiết khuyến mãi</button>
					</div>
				</fieldset>
			</form>
			</c:if>
		</div>
	</div>
</div>