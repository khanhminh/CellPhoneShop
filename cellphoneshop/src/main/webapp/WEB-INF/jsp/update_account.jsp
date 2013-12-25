<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">THÔNG TIN TÀI KHOẢN</h2>
		<div class="clear push20"></div>

		<div id="update-info">
			<s:form action="update_account.action" method="post" theme="simple">
			<div class="validation-summary-errors">
				<ul>
					<c:forEach var="e" items="${requestScope.errors}">
						<li>${e}</li>
					</c:forEach>
				</ul>
			</div>
			<table>
				<tr>
					<th class="title-table" colspan="3">Thông tin cá nhân</th>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Họ</label>
						(<span class="mark">*</span>)
					</td>
					<td colspan="2">
						<s:textfield type="text" name="user.firstname" theme="simple"
							data-val="true" data-val-required="Vui lòng nhập họ" />
						<span class="field-validation-valid" data-valmsg-for="user.firstname" data-valmsg-replace="true"></span>
					</td>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Tên</label>
						(<span class="mark">*</span>)
					</td>
					<td colspan="2">
						<s:textfield type="text" name="user.name" theme="simple"
							data-val="true" data-val-required="Vui lòng nhập tên" />
						<span class="field-validation-valid" data-valmsg-for="user.name" data-valmsg-replace="true"></span>
					</td>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Ngày sinh</label>
						(<span class="mark">*</span>)
					</td>
					<td colspan="2">
						<s:textfield type="text" name="user.birthday" theme="simple"
							data-val="true" data-val-date="Ngày sinh không hợp lệ" 
							data-val-required="Vui lòng nhập ngày sinh"/>
						<span class="field-validation-valid" data-valmsg-for="user.birthday" data-valmsg-replace="true"></span>						
					</td>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Giới tính</label> 
						(<span class="mark">*</span>)
					</td>
					<td colspan="2">
						<input type="radio" name="user.sex" value="Nam" data-val="true" data-val-required="Vui lòng chọn giới tính"> Nam&nbsp;&nbsp;
						<input type="radio" name="user.sex" value="Nữ">  Nữ						
						<span class="field-validation-valid" data-valmsg-for="user.sex" data-valmsg-replace="true"></span>	
					</td>				
				</tr>
				<tr>
					<td class="lb-input">
						<label>Điện thoại liên lạc</label> 
						(<span class="mark">*</span>)
					</td>
					<td colspan="2">
						<s:textfield type="text" name="user.phone" theme="simple"
							data-val="true" data-val-regex="Số điện thoại không hợp lệ" data-val-regex-pattern="^\d{6,11}$" 
							data-val-required="Vui lòng nhập điện thoại liên lạc" />
						<span class="field-validation-valid" data-valmsg-for="user.phone" data-valmsg-replace="true"></span>						
					</td>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Địa chỉ</label> 
						(<span class="mark">*</span>)
					</td>
					<td colspan="2">
						<s:textfield type="text" name="user.address" theme="simple"
							data-val="true" data-val-required="Vui lòng nhập địa chỉ" />
						<span class="field-validation-valid" data-valmsg-for="user.address" data-valmsg-replace="true"></span>						
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<c:if test="${isSuccess != null && isSuccess}">
							<span style="color:green;font-weight: bold;">Cập nhật thành công</span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Cập nhật" /></td>
					<td><a href="change_password.action">Đổi mật khẩu</a></td>
				</tr>
			</table>
		</s:form>
		</div>
	</div>
</div>

<script>
	$(function() {
		$("#update_account_user_birthday").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1900:' + new Date().getFullYear
		});
	});
</script>