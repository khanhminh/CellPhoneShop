<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<ul class="breadcrumb">
		<li><a href="list_account.action">Quản lý tài khoản</a> <span
			class="divider">/</span></li>
		<li><a href="#">Chi tiết tài khoản</a></li>
	</ul>
</div>

<c:choose>
	<c:when test="${account != null}">
		<div class="row-fluid sortable ui-sortable">
			<div class="box span6">
				<div class="box-header well" data-original-title="">
					<h2>
						<i class="icon-edit"></i>Tài khoản
					</h2>
					<div class="box-icon">
						<a href="#" class="btn btn-minimize btn-round"><i
							class="icon-chevron-up"></i></a>
					</div>
				</div>
				<div class="box-content">
					<form class="form-horizontal">
						<fieldset>
							<h3>Thông tin tài khoản</h3>
							<div class="control-group">
								<label class="control-label">Email</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${account.email}
									</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Vai trò</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input"> <c:forEach
											var="role" items="${account.vaiTros}">
											<b>${role.tenVaiTro}</b>&nbsp;
									</c:forEach>
									</span>
								</div>
							</div>
							<h3>Thông tin cá nhân</h3>
							<div class="control-group">
								<label class="control-label">Họ tên</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${account.ho}&nbsp;${account.ten} </span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Ngày sinh</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${account.ngaySinh} </span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Điện thoại</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${account.soDienThoai} </span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Địa chỉ</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${account.diaChi} </span>
								</div>
							</div>
							<div class="center">
								<a class="btn btn-info" href="list_account.action"> <i
									class="icon-share-alt icon-white"></i> Trở lại danh sách
								</a>
							</div>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="alert alert-error">
			<strong>Không tìm thấy tài khoản!</strong>
		</div>
	</c:otherwise>
</c:choose>
