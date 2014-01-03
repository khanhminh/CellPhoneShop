<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý Sản Phẩm</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Danh sách Sản Phẩm</a> <span class="divider">/</span></li>
		<li><a href="#">Chi Tiết Sản Phẩm</a></li>
	</ul>
</div>
<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2>
				<i class="icon-user"></i>Danh Sách Sản Phẩm
			</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-minimize btn-round"><i
					class="icon-chevron-up"></i></a>
			</div>
		</div>
		<div class="box-content">
			<table class="table table-striped table-bordered bootstrap-datatable">
				<thead>
					<!-- Header của bảng -->
					<tr>
						<th>Mã Sản Phẩm</th>
						<th>Tên Sản Phẩm</th>
						<th>Giới Thiệu</th>
						<th style="font-family: Arial;">SL Hiện Có</th>
						<th>Chức Năng</th>
					</tr>
				</thead>
				<tbody>

					<!-- các dòng dữ liệu  -->

					<c:forEach var="sp" begin="0" items="${productList}">
						<tr>
							<td>${sp.maSp}</td>
							<td>${sp.tenSp}</td>
							<td>${sp.gioiThieu}</td>
							<td><span class="label label-success" id="">
									${sp.soLuongHienCo} </span></td>
							<td><a class="btn btn-success"
								href="detail_product?id=${sp.maSp}"> <i
									class="icon-zoom-in icon-white"></i> Chi tiết
							</a> <a class="btn btn-info" href="update_product?id=${km.maKm}">
									<i class="icon-edit icon-white"></i> Chỉnh Sửa
							</a>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<!-- phần phan trang cho bảng -->
			<div class="dataTables_paginate paging_bootstrap pagination">
				<ul>
					<c:choose>
						<c:when test="${currentPage - 1 <= 0}">
							<li class="prev enabled"><a href="list_product?page=${totalPage}">←
									Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="prev enabled"><a
								href="list_product?page=${currentPage - 1}">← Previous</a></li>
						</c:otherwise>
					</c:choose>


					<li><a href="list_product?page=${currentPage}" class="paging-order">${currentPage}</a></li>
					<c:choose>
						<c:when test="${currentPage + 1 > totalPage }">
							<li class="next enabled"><a href="list_product?page=1">Next →
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="next enabled"><a
								href="list_product?page=${currentPage + 1}">Next → </a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</div>
</div>


<div id="dialog" title="Dừng khuyến mãi">
	<p>
		Bạn có muốn dừng khuyến mãi: <span id="dialog-content"
			style="color: red; font-weight: bold"></span>
	</p>
</div>

<script>
	var link = "";

	$("#dialog").dialog({
		autoOpen : false,
		modal : true,
		buttons : {
			OK : function() { //ok
				$(this).dialog("close");
				window.location.href = link;

			},
			Cancel : function() { //cancel
				$(this).dialog("close");
			}
		}
	});

	$(document).ready(function() {
		$('.btnStop').click(function(e) {
			e.preventDefault();

			var id = $(this).attr("data-id");
			$('#dialog-content').text(id);

			link = $(this).attr("href");
			$("#dialog").dialog("open");
		});
	});
</script>



