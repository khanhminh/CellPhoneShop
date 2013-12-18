<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="sp" value="${detail.product}" scope="page" />
<c:set var="info" value="${detail.detail}" scope="request" />
<c:set var="images" value="${detail.images}" scope="page" />

<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">THÔNG TIN SẢN PHẨM</h2>
		<div class="clear push20"></div>
		<div id="left-info" class="two_quarter">
			<div id="amazingslider-2" style="margin: auto">
				<ul class="amazingslider-slides" style="display: none;">
					<c:forEach var="img" items="${images}">
						<li><img src="${img.duongDan}" class="img-details" /></li>
					</c:forEach>
				</ul>
				<ul class="amazingslider-thumbnails" style="display: none;">
					<c:forEach var="img" items="${images}">
						<li><img src="${img.duongDan}" /></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="right-info" class="two_quarter">
			<h2 id="name">${sp.tenSp}</h2>
			<div class="rating" id="rating-score"
				data-score="${sp.diemDanhGiaTb}">
				<img src="resources/images/star-off.png" /> <img
					src="resources/images/star-off.png" /> <img
					src="resources/images/star-off.png" /> <img
					src="resources/images/star-off.png" /> <img
					src="resources/images/star-off.png" />
				
				<span class="score-rate"></span>
			</div>
			<h3 id="status">
				<c:choose>
					<c:when test="${sp.soLuongHienCo > 0}">
						<c:out value="Còn hàng"></c:out>
					</c:when>
					<c:otherwise>
						<c:out value="Hết hàng"></c:out>
					</c:otherwise>
				</c:choose>
			</h3>
			<h2 id="cost">
				<fmt:formatNumber value="${sp.gia}" type="number" />
				VNĐ
			</h2>
			<table>
				<tr>
					<td class="sub-info">Hãng sản xuất:</td>
					<td>${sp.nhaSanXuat.tenNhaSx}</td>
				</tr>
				<tr>
					<td class="sub-info">Bảo hành:</td>
					<td>${sp.soThangBaoHanh}Tháng</td>
				</tr>
				<tr>
					<td class="sub-info">Ngày cập nhật:</td>
					<td>${sp.ngayNhap}</td>
				</tr>
			</table>
			<div>
				<a href="editcart?action=add&product=${sp.maSp}"> <img
					src="resources/images/btn_addcart_vn.gif" />
				</a>
			</div>
		</div>
		<div class="clear"></div>


		<div id="bottom-info">
			<h3 class="title-info">CHI TIẾT SẢN PHẨM</h3>
			<jsp:include page="smartphone_detail.jsp" />
		</div>
		<div class="clear push50"></div>

		<div id="user-rating" data-productId="${sp.maSp}">
			<h3 class="title-info">ĐÁNH GIÁ</h3>
			<div class="rating">
				<div id="list-star">
					<img src="resources/images/star-off.png" /> <img
						src="resources/images/star-off.png" /> <img
						src="resources/images/star-off.png" /> <img
						src="resources/images/star-off.png" /> <img
						src="resources/images/star-off.png" />
					<span class="score-rate"></span>
				</div>
				
				<span class="count-rate">(<span id="count-rate">0</span> lượt đánh giá)</span>
			</div>
			<span class="rating-title">Đánh giá của bạn về sản
				phẩm: </span>
			<div class="frm-rating">
				<div>
					<input type="radio" name="rbtRating" class="rbtRating"
						data-number="5">
					<div class="row-rating">
						<img src="resources/images/star-on.png" /> <img
							src="resources/images/star-on.png" /> <img
							src="resources/images/star-on.png" /> <img
							src="resources/images/star-on.png" /> <img
							src="resources/images/star-on.png" />
					</div>
				</div>
				<div>
					<input type="radio" name="rbtRating" class="rbtRating"
						data-number="4">
					<div class="row-rating">
						<img src="resources/images/star-on.png" /> <img
							src="resources/images/star-on.png" /> <img
							src="resources/images/star-on.png" /> <img
							src="resources/images/star-on.png" />
					</div>
				</div>
				<div>
					<input type="radio" name="rbtRating" class="rbtRating"
						data-number="3">
					<div class="row-rating">
						<img src="resources/images/star-on.png" /> <img
							src="resources/images/star-on.png" /> <img
							src="resources/images/star-on.png" />
					</div>
				</div>
				<div>
					<input type="radio" name="rbtRating" class="rbtRating"
						data-number="2">
					<div class="row-rating">
						<img src="resources/images/star-on.png" /> <img
							src="resources/images/star-on.png" />
					</div>
				</div>
				<div>
					<input type="radio" name="rbtRating" class="rbtRating"
						data-number="1">
					<div class="row-rating">
						<img src="resources/images/star-on.png" />
					</div>
				</div>
			</div>
			<span id="rating-notify"></span>
			<button id="btnRating" class="button small blue">Chọn</button>
		</div>

		<div id="comments">
			<h3 class="title-info">BÌNH LUẬN</h3>
			<div class="comment-content">
				<form method="post" id="frm-comment">
					<label>Hãy nêu nhận xét của bạn:</label>
					<textarea id="txtComment" name="NoiDung"></textarea>
					<span class="field-validation-error" id="notify-comment"></span>
					<button id="btSend" type="submit" class="button small blue">Gửi</button>
				</form>
				<div id="list-comment">
					
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var isWaitRating = false;
	
	function loadRatingSuccess(data){
		var count = data.msg;
		alert(count);
		//showRating(data.avgRating, data.numberUser);
	}
	
	
	function loadRating(){
		var id = $('#user-rating').attr('data-productId');
		$.ajax({
			url : "getRating.action",
			data : {
				id : id,
			},
			type : "GET",
			success : loadRatingSuccess,
		});
	}
	
	
	function callbackRating(data){
		var notify = $('#rating-notify');
		if (data == 1){
			notify.text("Đánh giá của bạn đã được cập nhật");
			notify.attr("style", "color:green;");		
			loadRating();
		}
		else {
			var msg = "";
			notify.attr("style", "color:red;");
			if (data == 0){
				msg = "Vui lòng đăng nhập!";
			}
			else {
				msg = "Đã có lỗi xảy ra!";
			}
			notify.text(msg);
		}
		isWaitRating = false;
	}

	function rating() {		
		var number = checkSelect();
		if (number < 1 || number > 5){
			isWaitRating = false;
			$('#rating-notify').text("Vui lòng chọn đánh giá!");
			$('#rating-notify').attr("style", "color:red;");
			return;
		}		
		var id = $('#user-rating').attr('data-productId');
		
		$.ajax({
			url : "rating.action",
			data : {
				id : id,
				number: number
			},
			type : "GET",
			success : callbackRating,
		});
	}

	/* function setStar(number){
		var list = $("#list-star").children();
		for (var i = 0; i < list.length; i++){
			var img = $(list[i]);
			if (i < number){
				img.attr('src', "resources/images/star-on.png");
			}
			else {
				img.attr('src', "resources/images/star-off.png");
			}
		}
		
		return false;
	} */
	
	function checkSelect(){
		var number = -1;
		var list = $(".frm-rating").find(".rbtRating");
		for (var i = 0; i < list.length; i++){
			var radio = $(list[i]);
			if (radio.is(':checked')){
				number = radio.attr("data-number");				
				return number;
			}
		}
		
		return number;
	}
	
	function showComments(data) {
		$('#list-comment').html(data);
		
		$(".ajax-link").click(function(e) {
			e.preventDefault();
			ajaxLinkClick(this);
		});
	}
	
	function loadComments(page) {
		var id = $('#user-rating').attr('data-productId');
		
		$.ajax({
			url : "getComments.action",
			data : {
				id : id,
				page: page
			},
			type : "GET",
			success : showComments,
		});
	}
	
	function callbackComment(data){
		if (data == 1){
			loadComments(1);
		}		
		else {
			var msg = "";
			if (data == 0){
				msg = "Vui lòng đăng nhập!";
			}
			else {
				msg = "Đã có lỗi xảy ra!";
			}
			$('#notify-comment').text(msg);
		}
	}
	
	function sendComment(){
		var msg = $('#txtComment').val().trim();
		$('#txtComment').val('');
		if (msg == ""){
			$('#notify-comment').text('Vui lòng nhập nhận xét của bạn!');
			return;
		}
		var id = $('#user-rating').attr('data-productId');
		
		$.ajax({
			url : "sendComment.action",
			data : {
				id : id,
				msg: msg
			},
			type : "GET",
			success : callbackComment,
		});
	}
	
	function showRating(score, count){
		$('.score-rate').text(score.toFixed(1));
		$('#count-rate').text(count);
		if (score == 0) return;
		
		var arr = [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5];
		var min = arr[0];
		for (var i = 1; i < arr.length; i++){
			if (Math.abs(arr[i] - score) < Math.abs(min - score)){
				min = arr[i];
			}
		}
		score = min;
		var limit = Math.round(score - 0.1);		
		
		var list = $('#rating-score').children();
		var index = 0;
		for (; index < list.length && index < limit; index++){
			var img = $(list[index]);
			img.attr('src', "resources/images/star-on.png");
		}
		if (score - limit > 0.1){
			var img = $(list[index]);
			img.attr('src', "resources/images/star-half.png");
		}
		$('#list-star').html($('#rating-score').html());
	}
	
	function ajaxLinkClick(context) {
		var page = $(context).text().trim();
		loadComments(page);
	}
	
	$(document).ready(function(){
		loadComments(1);
		loadRating();
		$('.rbtRating').click(function(){
			//var number = $(this).attr("data-number");
			$('#rating-notify').text("");
			//setStar(number);
		});
		
		$('#btnRating').click(function(){
			if (!isWaitRating){
				isWaitRating = true;
				rating();
			}
		});
		
		$('#btSend').click(function(e){
			e.preventDefault();
			$('#notify-comment').text('');
			sendComment();
		});
	});
</script>