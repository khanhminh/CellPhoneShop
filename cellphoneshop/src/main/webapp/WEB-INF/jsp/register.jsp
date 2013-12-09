<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">ĐĂNG KÝ</h2>
		<div class="clear push20"></div>
		<div>
			<p id="intro">Đăng Ký Thành Viên Trang web Thương mại dịch vụ
				CNTT Minh Khánh</p>
		</div>

		<form action="register.action" method="post" id="frm-register" >
			<table>
				<tr>
					<th class="title-table" colspan="2">Thông tin tài khoản</th>
				</tr>
				<tr>
					<td class="lb-input"><label>Tên đăng nhập</label> (<span
						class="mark">*</span>)</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td class="lb-input"><label>Mật khẩu</label> (<span
						class="mark">*</span>)</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td class="lb-input"><label>Nhập lại mật khẩu</label> (<span
						class="mark">*</span>)</td>
					<td><input type="password" name="confirm" /></td>
				</tr>
				<tr>
					<td class="lb-input"><label>Họ tên</label>) (<span
						class="mark">*</span>)</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td class="lb-input"><label>Email</label> (<span class="mark">*</span>)</td>
					<td><input type="text" name="email" /></td>
				</tr>
				<tr>
					<td class="lb-input"><label>Ngày sinh</label> (<span
						class="mark">*</span>)</td>
					<td><input type="text" name="dob" /></td>
				</tr>
				<tr>
					<td class="lb-input"><label>Giới tính</label> (<span
						class="mark">*</span>)</td>
					<td><input type="radio" name="sex"> Nam&nbsp;&nbsp; <input
						type="radio" name="sex"> Nữ</td>
				</tr>
				<tr>
					<td class="lb-input"><label>Điện thoại</label>) (<span
						class="mark">*</span>)</td>
					<td><input type="text" name="phone" /></td>
				</tr>
				<tr>
					<td class="lb-input"><label>Địa chỉ</label> (<span
						class="mark">*</span>)</td>
					<td><input type="text" name="address" /></td>
				</tr>
				<tr>
					<td></td>
					<td class="inline-button"><input type="submit" value="Đăng ký" />
						<input type="reset" value="Hủy bỏ tất cả" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>

<script>
	$(function() {
		$("#NgaySinh").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1900:' + new Date().getFullYear
		});
	});
</script>