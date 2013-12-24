<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý đơn hàng</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Danh sách đơn hàng</a></li>
	</ul>
</div>


<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2>
				<i class="icon-user"></i>Đơn hàng
			</h2>
			<div class="box-icon">
			</div>
		</div>
		<form action="list_order.action" method="get" id="frm-list-order">
			<s:hidden name="status" id="frm-status" theme="simple"/>
			<s:hidden name="view" id="frm-view" theme="simple"/>
			<s:hidden name="page" id="frm-page" theme="simple"/>
			<s:hidden name="sortby" id="frm-sortby" theme="simple"/>
		<div class="box-content">
			<div>
				<label style="display: inline;">
					Trạng thái:
					<select style="width: 100px" id="select-status">
						<option value="0" selected="selected">Tất cả</option>
						<c:forEach var="tt" items="${listStatus}">							
							<option value="${tt.maTrangThai}" 
								<c:if test="${status == tt.maTrangThai}">
									selected="selected"
								</c:if>
							>
								${tt.tenTrangThai}
							</option>
						</c:forEach>
					</select>
				</label> 
				<div style="float: right;">
					<label style="display: inline; margin-right: 10px">
							Số đơn hàng: 
							<select style="width: 50px;" id="select-view">
								<c:forEach var="number" items="${listRPP}">
									<option value="${number}"
										<c:if test="${number == view}">
											selected="selected"
										</c:if>
									>
										${number}
									</option>
								</c:forEach>
							</select>
					</label> 
					<label style="display: inline;">
							Sắp xếp: 
							<select style="width: 120px" id="select-sortby">
								<c:forEach var="sb" items="${listSortby}">
									<option value="${sb.code}"
										<c:if test="${sb.code == sortby}">
											selected="selected"
										</c:if>
									>
										${sb.title}
									</option>
								</c:forEach>
							</select>
					</label> 
				</div>
			</div>
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
									<a class="btn btn-info" href="order_detail.action?id=${dh.maDonHang}">
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
		</form>
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
			$('#frm-list-order').submit();
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
	
	$(document).ready(function(){
		$('#select-status').change(function(){
			var value = $(this).val();
			$('#frm-status').val(value);
			$('#frm-page').val(1);
			$('#frm-list-order').submit();
		});
		$('#select-view').change(function(){
			var value = $(this).val();
			$('#frm-view').val(value);
			$('#frm-page').val(1);
			$('#frm-list-order').submit();
		});
		$('#select-sortby').change(function(){
			var value = $(this).val();
			$('#frm-sortby').val(value);
			$('#frm-page').val(1);
			$('#frm-list-order').submit();
		});
		$('.paging-order').click(function(e){
			e.preventDefault();
			var page = $(this).text().trim();
			$('#frm-page').val(page);
			$('#frm-list-order').submit();
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