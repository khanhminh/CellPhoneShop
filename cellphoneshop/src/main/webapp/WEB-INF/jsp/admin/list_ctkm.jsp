<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý chi tiết KM</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Danh sách chi tiết KM</a> <span class="divider">/</span></li>
	</ul>
</div>

<c:forEach var="ctkm" items="${ctkmList}" begin="0">
	<div class="row-fluid sortable">
		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2>
					<i class="icon-user"></i> Chi tiết SP áp dụng của
					${ctkm.khuyenmai.tieuDe}
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
							<th>Mã SP</th>
							<th>Tên Sản Phẩm</th>
							<th>Chức năng</th>
						</tr>
					</thead>
					<tbody>

						<!-- các dòng dữ liệu  -->

						<c:forEach var="sp" begin="0" items="${ctkm.sanphamList}">
							<tr>
								<td>${sp.maSp}</td>
								<td>${sp.tenSp}</td>
								<td>
								<a class="btn btn-danger btnStop"
									href="delete_ctkm?idkm=${ctkm.khuyenmai.maKm}&idsp=${sp.maSp}"> <i
										class="icon-zoom-in icon-white"></i> Xóa
								</a>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				<!-- phần phan trang cho bảng -->
				<div class="dataTables_paginate paging_bootstrap pagination">
					<ul>
						<c:choose>
							<c:when test="${currentPage - 1 <= 0}">
								<li class="prev enabled"><a
									href="list_ctkm?page=${totalPage}">← Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="prev enabled"><a
									href="list_ctkm?page=${currentPage - 1}">← Previous</a></li>
							</c:otherwise>
						</c:choose>


						<li><a href="list_ctkm?page=${currentPage}"
							class="paging-order">${currentPage}</a></li>
						<c:choose>
							<c:when test="${currentPage + 1 > totalPage }">
								<li class="next enabled"><a href="list_ctkm?page=1">Next
										→ </a></li>
							</c:when>
							<c:otherwise>
								<li class="next enabled"><a
									href="list_ctkm?page=${currentPage + 1}">Next → </a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>
			</div>
		</div>
	</div>
</c:forEach>


