<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<i class="icon-user"></i>Danh Sách Khuyến Mãi
			</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-minimize btn-round"><i
					class="icon-chevron-up"></i></a>
			</div>
		</div>
		<!-- 		<div class="box-content"> -->
		<!-- 			<form action="uploadfile" method="post" enctype="multipart/form-data"> -->
		<!-- 				<label for="myFile">Upload your file</label> <input type="file" -->
		<!-- 					name="myFile" /> <input type="submit" value="Upload" /> -->
		<!-- 			</form> -->
		<!-- 		</div> -->
		<div class="box-content">
			<table class="table table-striped table-bordered bootstrap-datatable">
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
									<a class="btn btn-info" href="update_km?id=${km.maKm}"> <i
										class="icon-edit icon-white"></i> Chỉnh Sửa
									</a>
									<a class="btn btn-danger" href="stop_km?id=${km.maKm}"> <i
										class="icon-trash icon-white"></i> Stop
									</a>
								</c:if></td>

						</tr>
					</c:forEach>

				</tbody>
			</table>
			<!-- phần phan trang cho bảng -->
			<div class="dataTables_paginate paging_bootstrap pagination">
				<ul>
					<c:choose>
						<c:when test="${currentPage - 1 <= 0}">
							<li class="prev enabled"><a href="list_km?page=${totalPage}">←
									Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="prev enabled"><a
								href="list_km?page=${currentPage - 1}">← Previous</a></li>
						</c:otherwise>
					</c:choose>


					<li><a href="list_km?page=${currentPage}" class="paging-order">${currentPage}</a></li>
					<c:choose>
						<c:when test="${currentPage + 1 > totalPage }">
							<li class="next enabled"><a href="list_km?page=1">Next →
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="next enabled"><a
								href="list_km?page=${currentPage + 1}">Next → </a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</div>
</div>





