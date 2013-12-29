<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">ĐỔI MẬT KHẨU</h2>
		<div class="clear push20"></div>
		<p class="message-success"></p>

		<div id="change-password">
			<form action="change_password.action" method="post">	
			<div>
				<c:if test="${isSuccess != null && isSuccess}">
					<span style="color:green;font-weight:bold">Cập nhật mật khẩu thành công</span>
				</c:if>
			</div>
			<div class="validation-summary-errors">
				<ul>
					<c:forEach var="e" items="${requestScope.errors}">
						<li>${e}</li>
					</c:forEach>
				</ul>
			</div>			
				<table>
					<tbody>
						<tr>
							<th class="title-table" colspan="2">Thông tin mật khẩu</th>
						</tr>
						<tr>
							<td class="lb-input">
								<label for="currentPassword">Mật khẩu hiện tại</label> 
								(<span class="mark">*</span>)
							</td>
							<td>
								<input class="text-box single-line password"
									data-val="true" data-val-regex="Mật khẩu phải từ 6-20 kí tự"
									data-val-regex-pattern="^.{6,20}$"
									data-val-required="Vui lòng nhập mật khẩu"
									name="currentPassword" type="password"> 
								<span class="field-validation-valid" data-valmsg-for="currentPassword"
										data-valmsg-replace="true">
								</span>
							</td>
						</tr>
						<tr>
							<td class="lb-input">
								<label for="newPassword">Mật khẩu mới</label> 
								(<span class="mark">*</span>)
							</td>
							<td>
								<input class="text-box single-line password"
									data-val="true" data-val-regex="Mật khẩu phải từ 6-20 kí tự"
									data-val-regex-pattern="^.{6,20}$"
									data-val-required="Vui lòng nhập mật khẩu mới"
									name="newPassword" type="password"> 
								<span class="field-validation-valid" 
									data-valmsg-for="newPassword"
									data-valmsg-replace="true">
								</span>
							</td>
						</tr>
						<tr>
							<td class="lb-input">
								<label for="confirmPassword">Nhập lại mật khẩu mới</label> 
								(<span class="mark">*</span>)
							</td>
							<td>
								<input class="text-box single-line password"
									data-val="true" data-val-equalto="Mật khẩu không khớp"
									data-val-equalto-other="*.newPassword"
									data-val-required="Vui lòng xác nhận lại mật khẩu"
									name="confirmPassword" type="password"> 
								<span class="field-validation-valid"
									data-valmsg-for="confirmPassword" data-valmsg-replace="true">
								</span>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="Cập nhật"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>

	</div>
</div>