<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper row3">
	<div id="container">
		<!-- sidebar left -->
		<div id="sidebar_1" class="sidebar one_quarter first">
			<jsp:include page="template/sidebar.jsp"></jsp:include>
		</div>

		<div id="gallery" class="three_quarter">
			<section>
				<figure>
					<div class="title-content">
						<h2>Sản phẩm mới</h2>
						<div class="sortby">
							<lable>Sắp xếp theo: </lable>
							<select>
								<option>Giá tăng dần</option>
								<option>Giá giảm dần</option>
							</select>
						</div>
					</div>
					<ul id="ListNewProducts" class="clear">
						<c:forEach var="sp" items="${newProducts}">
							<li class="one_quarter"><a href="#">
									<div class="product">
										<img src="resources/${sp.hinhDaiDien}" />
										<div class="info-product">
											<p class="name-product">${sp.tenSp}</p>
											<p class="cost">
												<fmt:formatNumber value="${sp.gia}" type="number" />
												VNĐ
											</p>
										</div>
									</div>
							</a></li>
						</c:forEach>
					</ul>
				</figure>
			</section>

			<nav class="pagination">
				<ul>
					<li>
						<a class="active-page" href="/Home/GetNewProducts?page=1">1</a>
					</li>
				</ul>
			</nav>

			<div class="push30"></div>

		</div>
	</div>
</div>