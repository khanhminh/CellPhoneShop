<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">ĐĂNG KÝ</h2>
		<div class="clear push20"></div>
		<div>
			<p id="intro">Đăng Ký Thành Viên Trang web Thương mại dịch vụ
				CNTT Minh Khánh</p>
		</div>

		<s:form action="register.action" method="post" id="frm-register" theme="simple">
			<div class="validation-summary-errors">
				<ul>
					<c:forEach var="e" items="${requestScope.errors}">
						<li>${e}</li>
					</c:forEach>
				</ul>
			</div>
			<table>
				<tr>
					<th class="title-table" colspan="2">Thông tin tài khoản</th>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Tên đăng nhập</label>
						(<span class="mark">*</span>)
					</td>
					<td>
						<s:textfield type="text" name="register.username" theme="simple"
							data-val="true" data-val-regex="Tên đăng nhập phải từ 6-20 kí tự" data-val-regex-pattern="^.{6,20}$"
							data-val-required="Vui lòng nhập tên đăng nhập" >
						</s:textfield>
						<span class="field-validation-valid" data-valmsg-for="register.username" data-valmsg-replace="true"></span>
					</td>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Mật khẩu</label> 
						(<span class="mark">*</span>)
					</td>
					<td>
						<input type="password" name="register.password" data-val="true" 
							data-val-regex="Mật khẩu phải từ 6-20 kí tự" data-val-regex-pattern="^.{6,20}$"
							data-val-required="Vui lòng nhập mật khẩu" />
						<span class="field-validation-valid" data-valmsg-for="register.password" data-valmsg-replace="true"></span>						
					</td>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Nhập lại mật khẩu</label> 
						(<span class="mark">*</span>)
					</td>
					<td>
						<input type="password" name="register.confirm" data-val="true"
							data-val-equalto="Mật khẩu không khớp" data-val-equalto-other="register.password"
							data-val-required="Vui lòng xác nhận lại mật khẩu" />
						<span class="field-validation-valid" data-valmsg-for="register.confirm" data-valmsg-replace="true"></span>		
					</td>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Họ</label>
						(<span class="mark">*</span>)
					</td>
					<td>
						<s:textfield type="text" name="register.firstname" theme="simple"
							data-val="true" data-val-required="Vui lòng nhập họ" />
						<span class="field-validation-valid" data-valmsg-for="register.firstname" data-valmsg-replace="true"></span>
					</td>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Tên</label>
						(<span class="mark">*</span>)
					</td>
					<td>
						<s:textfield type="text" name="register.name" theme="simple"
							data-val="true" data-val-required="Vui lòng nhập tên" />
						<span class="field-validation-valid" data-valmsg-for="register.name" data-valmsg-replace="true"></span>
					</td>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Email</label> 
						(<span class="mark">*</span>)
					</td>
					<td>
						<s:textfield type="text" name="register.email" theme="simple"
							data-val="true" data-val-email="Địa chỉ email không hợp lệ"
							data-val-required="Vui lòng nhập địa chỉ Email" />
						<span class="field-validation-valid" data-valmsg-for="register.email" data-valmsg-replace="true"></span>						
					</td>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Ngày sinh</label>
						(<span class="mark">*</span>)
					</td>
					<td>
						<s:textfield type="text" name="register.birthday" theme="simple"
							data-val="true" data-val-date="Ngày sinh không hợp lệ" 
							data-val-required="Vui lòng nhập ngày sinh"/>
						<span class="field-validation-valid" data-valmsg-for="register.birthday" data-valmsg-replace="true"></span>						
					</td>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Giới tính</label> 
						(<span class="mark">*</span>)
					</td>
					<td>
						<input type="radio" name="register.sex" value="Nam" data-val="true" data-val-required="Vui lòng chọn giới tính"> Nam&nbsp;&nbsp;
						<input type="radio" name="register.sex" value="Nữ">  Nữ						
						<span class="field-validation-valid" data-valmsg-for="register.sex" data-valmsg-replace="true"></span>	
					</td>				
				</tr>
				<tr>
					<td class="lb-input">
						<label>Điện thoại</label>) 
						(<span class="mark">*</span>)
					</td>
					<td>
						<s:textfield type="text" name="register.phone" theme="simple"
							data-val="true" data-val-regex="Số điện thoại không hợp lệ" data-val-regex-pattern="^\d{6,11}$" 
							data-val-required="Vui lòng nhập điện thoại liên lạc" />
						<span class="field-validation-valid" data-valmsg-for="register.phone" data-valmsg-replace="true"></span>						
					</td>
				</tr>
				<tr>
					<td class="lb-input">
						<label>Địa chỉ</label> 
						(<span class="mark">*</span>)
					</td>
					<td>
						<s:textfield type="text" name="register.address" theme="simple"
							data-val="true" data-val-required="Vui lòng nhập địa chỉ" />
						<span class="field-validation-valid" data-valmsg-for="register.address" data-valmsg-replace="true"></span>						
					</td>
				</tr>
				<tr>
					<td></td>
					<td class="inline-button">
						<input type="submit" value="Đăng ký" />
						<input type="reset" value="Hủy bỏ tất cả" />
					</td>
				</tr>
			</table>
		</s:form>
	</div>
</div>

<script>
	$(function() {
		$("#register_birthday").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1900:' + new Date().getFullYear
		});
	});
</script>