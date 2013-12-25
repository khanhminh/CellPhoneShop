<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:choose>
	<c:when test="${listOrder == null || empty listOrder}">
		<div class="alert alert-error">
			<strong>Không tìm thấy đơn hàng nào!</strong>
		</div>
	</c:when>
	<c:otherwise>


	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2>
				<i class="icon-shopping-cart"></i>Đơn hàng
			</h2>
			<div class="box-icon">
			</div>
		</div>
		<div class="box-content">			
				<table
					class="table table-striped table-bordered bootstrap-datatable">
					<thead>
						<tr>
							<th>Mã đơn hàng</th>
							<th>Mã khách hàng</th>
							<th>Ngày đặt hàng</th>
							<th>Tổng giá trị</th>
							<th>Trạng thái</th>
							<th>Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dh" items="${listOrder}" varStatus="i">
							<tr>								
								<td>${dh.maDonHang}</td>
								<td>
									<a href="account_detail.action?id=${dh.nguoiDung.maNd}" title="${dh.nguoiDung.email}" 
										data-rel="tooltip">${dh.nguoiDung.maNd}</a>
								</td>
								<td>
									<fmt:formatDate pattern="dd/MM/yyyy" value="${dh.ngayDatHang}" />
								</td>
								<td style="color:red;font-weight: bold;">
									<fmt:formatNumber value="${dh.tongGiaTri}" type="number" />
									 VNĐ
								</td>
								<td>
									<c:choose>
										<c:when test="${dh.trangThaiDonHang.maTrangThai == 1}">
											<span class="label label-important">${dh.trangThaiDonHang.tenTrangThai}</span>
										</c:when>
										<c:when test="${dh.trangThaiDonHang.maTrangThai == 2}">
											<span class="label label-success">${dh.trangThaiDonHang.tenTrangThai}</span>
										</c:when>
										<c:otherwise>
											<span class="label label-warning">${dh.trangThaiDonHang.tenTrangThai}</span>
										</c:otherwise>
									</c:choose>									
								</td>
								<td>
									<a class="btn btn-success" href="order_detail.action?id=${dh.maDonHang}">
										<i class="icon-zoom-in icon-white"></i>  
										Xem                                            
									</a>
									<a class="btn btn-info" href="edit_order.action?id=${dh.maDonHang}">
										<i class="icon-edit icon-white"></i>  
										Cập nhật                                            
									</a>
									<a class="btn btn-danger btnDelete" href="#" data-id="${dh.maDonHang}">
										<i class="icon-trash icon-white"></i>  
										Hủy                                           
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="dataTables_paginate paging_bootstrap pagination">
				<ul>
					<c:if test="${totalPage > 0}">
						<li class="prev disabled"><a href="#">← Previous</a></li>
					<c:forEach var="p" begin="1" end="${totalPage}">
						<c:choose>
							<c:when test="${p == page}">							
								<li class="active"><a href="#" class="paging-order">${p}</a></li>
							</c:when>	
							<c:otherwise>
								<li><a href="#" class="paging-order">${p}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="next disabled"><a href="#">Next → </a></li>
					</c:if>
				</ul>
			</div>
			
		</div>
	</div>
<div id="dialog" title="Quản lý đơn hàng">
  <p>Hủy đơn hàng <span id="dialog-content" style="color:red;font-weight:bold;"></span></p>
</div>
<div id="dialog-error" title="Quản lý đơn hàng">
  <p style="color:red;font-weight:bold;">Có lỗi xảy ra, vui lòng thử lại!</p>
</div>
<script>
	var id = 0;
	var isdeleting = false;
	var query = "${param.query}";
	var option = "${param.option}";
	
	$("#dialog").dialog({
		autoOpen: false,
		modal: true,
		buttons: {
	        OK: function() { //ok
	            $(this).dialog( "close" );	 
	            deleteOrder();
	        },
	        Cancel: function() { //cancel
	            $(this).dialog( "close" );
	        }
	    }
	});
	
	$("#dialog-error").dialog({
		autoOpen: false,
		modal: true,
		buttons: {
	        OK: function() { //ok
	            $(this).dialog( "close" );	        	
	        }
	    }
	});
	
	function callBack(data){
		isdeleting = false;
		if (data){
			reloadData(1);
		}
		else {
			$("#dialog-error").dialog("open");
		}
	}
	
	function deleteOrder(){
		isdeleting = true;
		$.ajax({
			url : "delete_order?id=" + id,
			type : "POST",
			success : callBack,
		});
	}		
	
	function reloadData(page){
		$.ajax({
			url : "process_search_order.action",
			type : 'POST',
			data : {
				page : page,
				option : option,
				query : query,
			},
			success : function(data) {
				$('#data-search').html(data);
			}
		});
	}
	
	$(document).ready(function(){		
		$('.paging-order').click(function(e){
			e.preventDefault();
			var page = $(this).text().trim();
			reloadData(page);
		});
		$('.btnDelete').click(function(e){
			e.preventDefault();
			if (!isdeleting){
				id = $(this).attr('data-id');
				$("#dialog-content").text(id);
				$("#dialog").dialog("open");
			}
		});
		
	});
</script>

	</c:otherwise>
</c:choose>