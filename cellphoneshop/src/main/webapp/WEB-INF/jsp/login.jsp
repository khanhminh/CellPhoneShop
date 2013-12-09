<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">ĐĂNG NHẬP</h2>
		<div class="clear push20"></div>
		<div>
			<p id="intro">
				Chào mừng bạn đến với website của công ty Minh Khánh. Nếu đây là lần
				đầu tiên tham gia, vui lòng <a href="register.action">Đăng ký</a>
				trước khi đăng nhập.
			</p>
		</div>
		<div id="form-login">
			<form action="<c:url value='/j_spring_security_check'/>"
				method="post">
				<c:if test="${error != null}">
					<div class="validation-summary-errors">
						<ul>
							<li>Tên đăng nhập hoặc mật khẩu không chính xác</li>
						</ul>
					</div>
				</c:if>
				<table>
					<tr>
						<th class="title-table" colspan="3">Tài khoản</th>
					</tr>
					<tr>
						<td class="td-bold"><label>Tên đăng nhập</label></td>
						<td colspan="3"><input class="text-box single-line"
							data-val="true" data-val-required="Vui lòng nhập tên đăng nhập"
							id="j_username" name="j_username" type="text" value="" /> <span
							class="field-validation-valid" data-valmsg-for="j_username"
							data-valmsg-replace="true"></span></td>
					</tr>
					<tr>
						<td class="td-bold"><label>Mật khẩu</label></td>
						<td colspan="3"><input class="text-box single-line password"
							data-val="true" data-val-required="Vui lòng nhập mật khẩu"
							id="j_password" name="j_password" type="password" value="" /> <span
							class="field-validation-valid" data-valmsg-for="j_password"
							data-valmsg-replace="true"></span></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="checkbox"
							name="_spring_security_remember_me"> <label>Nhớ
								mật khẩu?</label></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td id="inline-button"><input type="submit" value="Đăng nhập" />
						</td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>