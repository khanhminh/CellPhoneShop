<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý tài khoản</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Danh sách tài khoản</a></li>
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
			<form class="form-horizontal" action="search_account.action" method="get">
				<fieldset>
					<div class="control-group">
						<label class="control-label" id="label-search" for="query-search">Từ khóa</label>
						<div class="controls">
							<s:textfield class="input-xlarge focused" id="query-search" type="text" name="query" theme="simple"/>
							<span class="help-inline" style="color:red;" id="error-search"></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Tìm theo:</label>
						<div class="controls">
							<label class="radio"> 
								<input type="radio" name="option" value="email" checked="checked"/>
								Email
							</label>
							<div style="clear: both"></div>
							<label class="radio"> 
								<input type="radio" name="option" value="id"/>
								Mã tài khoản
							</label>
							<div style="clear: both"></div>
							<label class="radio"> 
								<input type="radio" name="option" value="name"/>
								Tên
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
	<c:when test="${listAccount == null || empty listAccount}">
		<div class="alert alert-error">
			<strong>Không tìm thấy tài khoản!</strong>
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
				class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>ID</th>
						<th>Email</th>
						<th>Vai trò</th>
						<th style="font-family: Arial;">Trạng thái</th>
						<th>Chức năng</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="acc" items="${listAccount}">
						<tr>
							<td class="center">${acc.maNd}</td>
							<td>${acc.email}</td>
							<td class="center"><c:forEach var="role"
									items="${acc.vaiTros}" varStatus="status">
									<span><b>${role.tenVaiTro}</b>&nbsp;</span>
								</c:forEach></td>
							<td><c:choose>
									<c:when test="${acc.enable}">
										<span class="label label-success" id="status-${acc.maNd}">Active</span>
									</c:when>
									<c:otherwise>
										<span class="label label-important" id="status-${acc.maNd}">Lock</span>
									</c:otherwise>
								</c:choose></td>
							<td class="center"><a class="btn btn-success"
								href="account_detail?id=${acc.maNd}"> <i
									class="icon-zoom-in icon-white"></i> Chi tiết
							</a> <a class="btn btn-primary" href="set_role?id=${acc.maNd}"> <i
									class="icon-edit icon-white"></i> Phân quyền
							</a> <c:choose>
									<c:when test="${acc.enable}">
										<a class="btn btn-danger lock-acc" href="#"
											data-id="${acc.maNd}" id="btnLock-${acc.maNd}"> <i
											class="icon-lock icon-white"></i> <span
											id="text-button-${acc.maNd}">Lock</span>
										</a>
									</c:when>
									<c:otherwise>
										<a class="btn btn-danger unlock-acc" data-id="${acc.maNd}"
											id="btnLock-${acc.maNd}" href="#"> <i
											class="icon-lock icon-white"></i> <span
											id="text-button-${acc.maNd}">UnLock</span>
										</a>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div id="dialog" title="Lock tài khoản">
	<p id="dialog-content"></p>
</div>
<div id="dialog1" title="Lock tài khoản">
	<p id="dialog1-content"></p>
</div>
	</c:otherwise>
</c:choose>

<script>
	var locking = false;
	var unlocking = false;
	var id = 0;
	var action = "";

	function callbackLock(data) {
		locking = false;
		if (data == 1) {
			$('#status-' + id).removeClass('label-success');
			$('#status-' + id).addClass('label-important');
			$('#status-' + id).text("Lock");

			//$('#btnLock-' + id).removeClass('lock-acc');
			//$('#btnLock-' + id).addClass('unlock-acc');
			$('#btnLock-' + id).unbind('click');
			$('#btnLock-' + id).click(unlockClick);

			$('#text-button-' + id).text("UnLock");
		} else if (data == 0) {
			$('#dialog1-content').text(
					"Bạn ko thể truy cập tài khoản này");
			$("#dialog1").dialog("open");
		} else if (data == -1) {
			$('#dialog1-content').text("Có lỗi xảy ra");
			$("#dialog1").dialog("open");
		}
	}

	function callbackUnLock(data) {
		unlocking = false;
		if (data == 1) {
			$('#status-' + id).removeClass('label-important');
			$('#status-' + id).addClass('label-success');
			$('#status-' + id).text("Active");

			//$('#btnLock-' + id).removeClass('unlock-acc');
			//$('#btnLock-' + id).addClass('lock-acc');
			$('#btnLock-' + id).unbind('click');
			$('#btnLock-' + id).click(lockClick);

			$('#text-button-' + id).text("Lock");
		} else if (data == 0) {
			$('#dialog1-content').text(
					"Bạn ko thể truy cập tài khoản này");
			$("#dialog1").dialog("open");
		} else if (data == -1) {
			$('#dialog1-content').text("Có lỗi xảy ra");
			$("#dialog1").dialog("open");
		}
	}

	function lockAccount() {
		locking = true;
		$.ajax({
			url : "lock_account?action=lock&id=" + id,
			type : "POST",
			success : callbackLock,
		});
	}

	function unlockAccount() {
		unlocking = true;
		$.ajax({
			url : "lock_account?action=unlock&id=" + id,
			type : "POST",
			success : callbackUnLock,
		});
	}

	$("#dialog").dialog({
		autoOpen : false,
		modal : true,
		buttons : {
			OK : function() { //ok
				$(this).dialog("close");
				if (action == "lock") {
					lockAccount();
				} else {
					unlockAccount();
				}
			},
			Cancel : function() { //cancel
				$(this).dialog("close");
			}
		}
	});

	$("#dialog1").dialog({
		autoOpen : false,
		modal : true,
		buttons : {
			OK : function() { //ok
				$(this).dialog("close");
			}
		}
	});

	var lockClick = function() {
		if (!locking) {
			id = $(this).attr('data-id');
			action = "lock";
			$('#dialog-content').text("Lock tài khoản " + id + "?");
			$("#dialog").dialog("open");
		}
	}

	var unlockClick = function() {
		if (!unlocking) {
			id = $(this).attr('data-id');
			action = "unlock";
			$('#dialog-content').text("Unlock tài khoản " + id + "?");
			$("#dialog").dialog("open");
		}
	}

	$(document).ready(function() {
		$('.lock-acc').click(lockClick);
		$('.unlock-acc').click(unlockClick);
		
		$('#btn-search').click(function(e){
			var text = $('#query-search').val();
			if (text == ""){
				e.preventDefault();
				$('#error-search').text("Vui lòng nhập từ khóa");
			}
		});
	});
</script>