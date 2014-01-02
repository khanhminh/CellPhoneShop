<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý Khuyến Mãi</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Tìm kiếm</a></li>
	</ul>
</div>

<div class="row-fluid sortable">
	<div class="box span6">
		<div class="box-header well">
			<h2>
				<i class="icon-edit"></i>Tìm kiếm
			</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-minimize btn-round"><i
					class="icon-chevron-up"></i></a>
			</div>
		</div>
		<div class="box-content">
			<form class="form-horizontal" action="search_km.action" method="get">
				<fieldset>
					<div class="control-group">
						<label class="control-label" id="label-search" for="query-search">Từ
							khóa</label>
						<div class="controls">
							<s:textfield class="input-xlarge focused" id="query-search"
								type="text" name="query" theme="simple" />
							<span class="help-inline" style="color: red;" id="error-search"></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Tìm theo:</label>
						<div class="controls">
							<label class="radio"> <input type="radio" name="option"
								value="status" checked="checked" /> Trạng Thái KM
							</label>
							<div style="clear: both"></div>
							<label class="radio"> <input type="radio" name="option"
								value="id" /> Mã Khuyến Mãi
							</label>
							<div style="clear: both"></div>
							<label class="radio"> <input type="radio" name="option"
								value="name" /> Tên Khuyến Mãi
							</label>
						</div>
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary" id="btn-search">Tìm</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>

<c:choose>
	<c:when test="${isInput}">

	</c:when>
	<c:when test="${kmList == null || empty kmList}">
		<div class="alert alert-error">
			<strong>
				<c:forEach var="error" begin="0" items="${errors}">
						${error}<br>
				</c:forEach>
			</strong>
		</div>

	</c:when>
	<c:otherwise>
		<div class="row-fluid sortable">
			<div class="box span12">
				<div class="box-header well">
					<h2>
						<i class="icon-user"></i>Tài khoản
					</h2>
					<div class="box-icon">
						<a href="#" class="btn btn-minimize btn-round"><i
							class="icon-chevron-up"></i></a>
					</div>
				</div>
				<div class="box-content">
					<table
						class="table table-striped table-bordered bootstrap-datatable">
						<thead>
							<!-- Header của bảng -->
							<tr>
								<th>ID</th>
								<th>Tên Khuyến Mãi</th>
								<th>Mô Tả</th>
								<th style="font-family: Arial;">Trạng thái</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>

							<!-- các dòng dữ liệu  -->

							<c:forEach var="km" begin="0" items="${kmList}">
								<tr>
									<td>${km.maKm}</td>
									<td>${km.tieuDe}</td>
									<td>${km.moTa}</td>
									<td><span class="label label-success" id="">
											${km.trangThaiKhuyenMai.tenTrangThai} </span></td>
									<td><a class="btn btn-success"
										href="detail_km?id=${km.maKm}"> <i
											class="icon-zoom-in icon-white"></i> Chi tiết
									</a> <c:if test="${km.trangThaiKhuyenMai.maTrangThai == 1}">
											<a class="btn btn-info" href="show_update_km_form?id=${km.maKm}"> <i
												class="icon-edit icon-white"></i> Chỉnh Sửa
											</a>
											<a class="btn btn-danger btnStop"
												href="stop_km?id=${km.maKm}" data-id="${km.maKm}"> <i
												class="icon-trash icon-white"></i> Stop
											</a>
										</c:if></td>

								</tr>
							</c:forEach>

						</tbody>
					</table>
					<div class="dataTables_paginate paging_bootstrap pagination">
						<ul>
							<c:choose>
								<c:when test="${currentPage - 1 <= 0}">
									<li class="prev enabled"><a
										href="search_km?page=${totalPage}">← Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev enabled"><a
										href="search_km?page=${currentPage - 1}">← Previous</a></li>
								</c:otherwise>
							</c:choose>


							<li><a href="search_km?page=${currentPage}"
								class="paging-order">${currentPage}</a></li>
							<c:choose>
								<c:when test="${currentPage + 1 > totalPage }">
									<li class="next enabled"><a href="search_km?page=1">Next
											→ </a></li>
								</c:when>
								<c:otherwise>
									<li class="next enabled"><a
										href="search_km?page=${currentPage + 1}">Next → </a></li>
								</c:otherwise>
							</c:choose>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
