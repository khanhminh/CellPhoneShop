<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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
			<form action="login.action" method="post">
				<table>
					<tr>
						<th class="title-table" colspan="3">Tài khoản</th>
					</tr>
					<tr>
						<td class="td-bold"><label>Tên đăng nhập</label></td>
						<td colspan="3"><input type="text" name="username" /></td>
					</tr>
					<tr>
						<td class="td-bold"><label>Mật khẩu</label></td>
						<td colspan="3"><input type="password" name="password" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="checkbox"> <label>Nhớ mật
								khẩu?</label></td>
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