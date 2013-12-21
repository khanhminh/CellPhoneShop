<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý tài khoản</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Danh sách tài khoản</a></li>
	</ul>
</div>

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
				class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>ID</th>
						<th>Email</th>
						<th>Vai trò</th>
						<th>Chức năng</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="acc" items="${listAccount}">
						<tr>
                            <td class="center">${acc.maNd}</td>
                            <td>${acc.email}</td>
                            <td class="center">
                            	<c:forEach var="role" items="acc.vaiTros" varStatus="status">
                            		<c:choose>
                            			<span><b>${role.tenVaiTro}</b>, </span>
                            		</c:choose>
                            	</c:forEach>
                            </td>
                            <td class="center">
                                <a class="btn btn-success" href="account_detail?id=${acc.maNd}">
                                    <i class="icon-zoom-in icon-white"></i>
                                    Chi tiết                                       
									</a>
                                <a class="btn btn-primary" href="set_role?id=${acc.maNd}">
                                    <i class="icon-edit icon-white"></i>
                                    Phân quyền                                           
									</a>
                                <a class="btn btn-danger" href="#">
                                    <i class="icon-trash icon-white"></i>
                                    Delete
								</a>
                            </td>
                        </tr>  
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		//$('.dataTables_info').remove();
		//$('.dataTables_paginate').remove();
	});
</script>