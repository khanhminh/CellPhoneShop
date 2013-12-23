<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý tài khoản</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Phân quyền</a></li>
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
					<form action="set_role.action" method="post" id="frmSetRole">
						<input type="hidden" name="id" value="${account.maNd}"
							id="account-id" />
						<table>
							<tr>
								<td><label class="control-label">Email</label></td>
								<td><span class="input-xlarge uneditable-input">${account.email}</span>
								</td>
							</tr>
							<tr>
								<td>
									<h3>Role</h3>
								</td>
							</tr>
							<c:forEach var="role" items="${listRole}">
								<c:set var="isChecked" value="false" />
								<c:forEach var="r" items="${account.vaiTros}">
									<c:if test="${r.maVaiTro == role.maVaiTro}">
										<c:set var="isChecked" value="true" />
									</c:if>
								</c:forEach>
								<tr>
									<td style="text-align: right">
										<c:choose>
											<c:when test="${isChecked eq 'true'}">
												<input type="checkbox" name="role" value="${role.maVaiTro}"
													checked="checked" class="chkRole" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" name="role" value="${role.maVaiTro}" class="chkRole"/>
											</c:otherwise>
										</c:choose></td>
									<td><label class="control-label">${role.tenVaiTro}</label>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td id="msg" colspan="2"></td>
							</tr>
							<tr>
								<td><input id="btnSubmit" type="submit" value="Cập nhật"
									class="btn btn-primary"
									style="margin-left: 20px; margin-top: 20px" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<!--/span-->
		</div>
		<script>		
			function callback(data){
				if (data == 1){
					$('#msg').text("Cập nhật thành công");
					$('#msg').attr('style', "color:green;font-family: Arial;");
				}
				else if (data == 0){
					$('#msg').text("Bạn không thể phân quyền cho tài khoản này");
					$('#msg').attr('style', "color:red;font-family: Arial;");	
				}
				else {
					$('#msg').text("Có lỗi xảy ra");
					$('#msg').attr('style', "color:red;font-family: Arial;");					
				}
			}
		
			$(document).ready(function(){
				$('#btnSubmit').click(function(e){
					e.preventDefault();
					
					var url = "processSetRole.action?id=" + ${account.maNd};					
					var list = $('#frmSetRole').find('.chkRole');
					for (var i = 0; i < list.length; i++){
						var chkb = $(list[i]);
						if (chkb.attr('checked') == 'checked'){
							url += "&role=" + chkb.val().trim();
						}
						else {
							url += "&unrole=" + chkb.val().trim();
						}
					}
					
					$.ajax({
						url : url,
						type : "POST",
						success : callback,
					});
				});
			});
		</script>
	</c:when>
	<c:otherwise>
		<div class="alert alert-error">
			<strong>Không tìm thấy tài khoản!</strong>
		</div>
	</c:otherwise>
</c:choose>
