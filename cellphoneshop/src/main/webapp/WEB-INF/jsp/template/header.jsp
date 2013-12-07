<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrapper row1">
	<header id="header" class="full_width clear">
		<div id="logo" class="one_half">
			<a href="#" title="Minh Khánh"><img
				src="resources/images/logo.png" /></a>
		</div>
		<div id="header-contact" class="one_half">
			<section id="login">
				<c:if test="${sessionScope.user != null}">
					<ul class="list none">
						<li>Chào, <span>${sessionScope.user}</span></li>
						<li>
							<form action="logout" method="post" id="logoutForm">
								<a
									href="javascript:document.getElementById('logoutForm').submit()">Thoát</a>
							</form>
						</li>
					</ul>
				</c:if>
				<c:if test="${sessionScope.user == null}">
					<ul class="list none">
						<li><a href="login.action" id="loginLink">Đăng nhập</a></li>
						<li><a href="register.action" id="registerLink">Đăng ký</a></li>
					</ul>
				</c:if>
			</section>
		</div>
	</header>
</div>

<!-- Menu -->
<div class="wrapper row2">
	<nav id="topnav">
		<ul class="clear">
			<li><a href="home.action" class="active">Trang chủ</a></li>
			<li><a href="home.action">Sản phẩm</a></li>
		</ul>
	</nav>
</div>

<!-- Slider -->
<div class="wrapper row2">
	<div id="intro">
		<div class="boxholder">
			<div id="amazingslider-1">
				<ul class="amazingslider-slides" style="display: none;">
					<li><img src="resources/images/1.jpg" alt="1" /></li>
					<li><img src="resources/images/2.jpg" alt="2" /></li>
					<li><img src="resources/images/3.jpg" alt="3" /></li>
					<li><img src="resources/images/4.jpg" alt="4" /></li>
				</ul>
				<ul class="amazingslider-thumbnails" style="display: none;">
					<li><img src="resources/images/thumbnails/1.jpg" /></li>
					<li><img src="resources/images/thumbnails/2.jpg" /></li>
					<li><img src="resources/images/thumbnails/3.jpg" /></li>
					<li><img src="resources/images/thumbnails/4.jpg" /></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>

<!-- Search bar & Shopping Cart -->
<!-- <div class="wrapper row3">
	<div id="container">
		<div id="search">
			<div class="one_half">
				@using (Html.BeginForm("Search", "Product", FormMethod.Get)) {
				@Html.TextBox("name", null, new { @class = "one_half" }) <input
					type="submit" value="Tìm kiếm" class="one_ten" /> }
			</div>
			<div id="cart">
				<img src="/Images/cart.png" /> @Html.ActionLink("Giỏ hàng(" +
				ViewData["CartCount"] + ")", "Index", "ShoppingCart", new { id =
				"cart-status" })
			</div>
		</div>
	</div>
</div> -->