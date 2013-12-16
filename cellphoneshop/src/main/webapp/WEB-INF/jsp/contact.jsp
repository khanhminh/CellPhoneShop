<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrapper row3">
	<div id="container">
		<script type="text/javascript"
			src="http://maps.googleapis.com/maps/api/js?sensor=false&language=vi"></script>
		<script type="text/javascript">
			$(document)
					.ready(
							function initialize() {
								var myLatlng = new google.maps.LatLng(
										10.763334, 106.682406);
								var myOptions = {
									zoom : 16,
									center : myLatlng,
									mapTypeId : google.maps.MapTypeId.ROADMAP
								}
								var map = new google.maps.Map(document
										.getElementById("mymap"), myOptions);
								// Biến text chứa nội dung sẽ được hiển thị
								var text;
								text = "<b style='color:#00F' " +
                     					"style='text-align:center'>Công ty KSS<br />"
										+ "</b>";
								var infowindow = new google.maps.InfoWindow({
									content : text,
									size : new google.maps.Size(100, 50),
									position : myLatlng
								});
								infowindow.open(map);
								var marker = new google.maps.Marker({
									position : myLatlng,
									map : map,
									title : "Công ty Minh Khánh"
								});
							});
		</script>

		<h2 class="title-content push50">LIÊN HỆ</h2>
		<div id="contact" class="clear">
			<div class="one_half nogutter first">
				<div id="info-contact">
					<h2>CÔNG TY TM-DV TIN HỌC KSS</h2>
					<table>
						<tbody>
							<tr>
								<td class="contact-td">Đại chỉ:</td>
								<td>227 Nguyễn Văn cừ, TP Hồ Chí Minh</td>
							</tr>
							<tr>
								<td class="contact-td">Điện thoại:</td>
								<td>01285443591</td>
							</tr>
							<tr>
								<td class="contact-td">Email:</td>
								<td>minhkhanh.khtn@gmai.com</td>
							</tr>
							<tr>
								<td class="contact-td">Website:</td>
								<td><a href="http://kss.com.vn/">kss.com.vn</a></td>
							</tr>
						</tbody>
					</table>
					<div class="line"></div>
					<div>
						<p id="msg-contact"></p>
					</div>
					<form action="contact.action" method="post">						
						<div class="form-input clear">
							<div class="one_half first" id="lb-name">
								<label for="HoTen">Họ tên</label>
								<input data-val="true"
									data-val-required="Vui lòng nhập họ tên" id="author"
									name="HoTen" size="22" type="text" value=""> <span
									class="field-validation-valid" data-valmsg-for="HoTen"
									data-valmsg-replace="true"></span>
							</div>

							<div class="one_half">
								<label for="Email">Email</label> 
								<input data-val="true"
									data-val-required="Vui lòng nhập email" id="email" name="Email"
									size="22" type="text" value=""> <span
									class="field-validation-valid" data-valmsg-for="Email"
									data-valmsg-replace="true"></span>
							</div>
						</div>
						<div class="form-message">
							<textarea cols="25" data-val="true"
								data-val-required="Vui lòng nhập nội dung" id="message"
								name="NoiDung" rows="10"></textarea>
							<span class="field-validation-valid" data-valmsg-for="NoiDung"
								data-valmsg-replace="true"></span>
						</div>
						<p>
							<button type="submit">Gửi</button>
							&nbsp;
							<button>Nhập lại</button>
						</p>
					</form>
				</div>
			</div>
			<div class="one_half nogutter">
				<div id="mymap"></div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>