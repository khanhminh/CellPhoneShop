<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="wrapper row3">
	<div id="container">
		<div style="background-color: red; height: 100px">
			<div class="nav-page">
				<span>San pham</span> >> <span>dien thoai di dong</span>
				<h1>Dien thoai di dong</h1>
			</div>
		</div>
	
		<!-- sidebar left -->
		<div id="sidebar_1" class="sidebar one_quarter first">
			<jsp:include page="template/sidebar_right.jsp"></jsp:include>
		</div>
	
		<div id="gallery" class="three_quarter">
			<nav class="pagination">
				<ul>
					<li><a class="ajax-link active-page" data-ajax="true"
						data-ajax-method="GET" data-ajax-success="populateProducts"
						href="/Home/GetNewProducts?page=1">1</a></li>
					<li><a class="ajax-link" data-ajax="true"
						data-ajax-method="GET" data-ajax-success="populateProducts"
						href="/Home/GetNewProducts?page=2">2</a></li>
					<li><a class="ajax-link" data-ajax="true"
						data-ajax-method="GET" data-ajax-success="populateProducts"
						href="/Home/GetNewProducts?page=3">3</a></li>
					<li><a class="ajax-link" data-ajax="true"
						data-ajax-method="GET" data-ajax-success="populateProducts"
						href="/Home/GetNewProducts?page=4">4</a></li>

				</ul>
			</nav>
		
			<section>
				<figure>
					<div class="title-content">
						
						<div class="sortby">
							<lable>Sắp xếp theo: </lable>
							<select>
							 	<option>Giá tăng dần</option>
							 	<option>Giá giảm dần</option>
							</select>
						</div>
					</div>
					<ul id="List" class="clear">
						<li class="one_quarter"><a href="/Product/Details?id=58">
								<div class="product">
									<img
										src="resources/images/Smartphone/BlackBerry/BLACKBERRY Z10/hinhdaidien.jpg" />
									<div class="info-product">
										<p class="name-product">BlackBerry Curve 9220</p>
										<p class="cost">14,000,000 VNĐ</p>
									</div>
								</div>
						</a></li>
						<li class="one_quarter"><a href="/Product/Details?id=57">
								<div class="product">
									<img
										src="resources/images/Smartphone\Apple\iPhone 4S 16GB\hinhdaidien.jpg">
									<div class="info-product">
										<p class="name-product">iPhone 4S 16GB</p>
										<p class="cost">14,490,000 VNĐ</p>
									</div>
								</div>
						</a></li>
						<li class="one_quarter"><a href="/Product/Details?id=56">
								<div class="product">
									<img
										src="resources/images/Smartphone/SamSung/SAMSUNG GALAXY S4 I9500/hinhdaidien.jpg">
									<div class="info-product">
										<p class="name-product">SAMSUNG GALAXY S4 I9500</p>
										<p class="cost">15,990,000 VNĐ</p>
									</div>
								</div>
						</a></li>
						<li class="one_quarter"><a href="/Product/Details?id=56">
								<div class="product">
									<img
										src="resources/images/Smartphone/SamSung/SAMSUNG GALAXY S4 I9500/hinhdaidien.jpg">
									<div class="info-product">
										<p class="name-product">SAMSUNG GALAXY S4 I9500</p>
										<p class="cost">15,990,000 VNĐ</p>
									</div>
								</div>
						</a></li>
						<li class="one_quarter"><a href="/Product/Details?id=58">
								<div class="product">
									<img
										src="resources/images/Smartphone/BlackBerry/BLACKBERRY Z10/hinhdaidien.jpg" />
									<div class="info-product">
										<p class="name-product">BlackBerry Curve 9220</p>
										<p class="cost">14,000,000 VNĐ</p>
									</div>
								</div>
						</a></li>
						<li class="one_quarter"><a href="/Product/Details?id=57">
								<div class="product">
									<img
										src="resources/images/Smartphone\Apple\iPhone 4S 16GB\hinhdaidien.jpg">
									<div class="info-product">
										<p class="name-product">iPhone 4S 16GB</p>
										<p class="cost">14,490,000 VNĐ</p>
									</div>
								</div>
						</a></li>
						<li class="one_quarter"><a href="/Product/Details?id=56">
								<div class="product">
									<img
										src="resources/images/Smartphone/SamSung/SAMSUNG GALAXY S4 I9500/hinhdaidien.jpg">
									<div class="info-product">
										<p class="name-product">SAMSUNG GALAXY S4 I9500</p>
										<p class="cost">15,990,000 VNĐ</p>
									</div>
								</div>
						</a></li>
						<li class="one_quarter"><a href="/Product/Details?id=56">
								<div class="product">
									<img
										src="resources/images/Smartphone/SamSung/SAMSUNG GALAXY S4 I9500/hinhdaidien.jpg">
									<div class="info-product">
										<p class="name-product">SAMSUNG GALAXY S4 I9500</p>
										<p class="cost">15,990,000 VNĐ</p>
									</div>
								</div>
						</a></li>
					</ul>
				</figure>
			</section>
		</div>
	</div>