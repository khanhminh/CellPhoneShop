<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper row3">
	<div id="container">
		<div class="title-content">
			<!-- <h2>TRANG CHỦ</h2> -->
		</div>
		<div class="nav-page push10">
			<a>Cellphone</a> » <span class="active-link"> <a>Trang chủ</a>
			</span>
		</div>
		<!-- sidebar left -->
		<div id="sidebar_1" class="sidebar one_quarter first">
			<jsp:include page="sidebar_home.jsp"></jsp:include>
		</div>

		<div id="gallery" class="three_quarter">
			<section>
				<figure>
					<div class="title-content">
						<h2>Sản phẩm mới</h2>
					</div>
					<ul id="ListNewProducts" class="clear">
					</ul>
					<div id="temp-newproducts" style="height: 460px"></div>
				</figure>
			</section>

			<nav class="pagination">
				<ul>
					<c:forEach var="page" begin="1" end="${requestScope.totalPage}">
						<li><a href="home?page=${page}"
							<c:if test="${page == requestScope.currentPage}">
                                    class="active-page ajax-link" href="#"
                            </c:if>
							<c:if test="${page != requestScope.currentPage}">
                                    class="ajax-link"
                            </c:if>>${page}
						</a></li>
					</c:forEach>
				</ul>
			</nav>

			<div class="push30"></div>
			
			<section>
				<figure>
					<div class="title-content">
						<h2>Sản phẩm bán chạy</h2>
					</div>
					<ul id="ListBestSellingProducts" class="clear">
					</ul>
				</figure>
			</section>
		</div>
	</div>
</div>
<script>
	function addNewProduct(data) {
		$('#ListNewProducts').html(data);
		$("#temp-newproducts").remove();
	}
	
	function addBestSellingProduct(data) {
		$('#ListBestSellingProducts').html(data);
	}

	function getNewProducts(page) {
		$.ajax({
			url : "new_products.action",
			data : {
				page : page
			},
			type : "GET",
			success : addNewProduct,
		});
	}
	
	function getBestSellingProducts(){
		$.ajax({
			url : "bestselling_products.action",
			type : "GET",
			success : addBestSellingProduct,
		});
	}

	function ajaxLinkClick(context) {
		var page = $(context).text().trim();
		getNewProducts(page);

		var links = $(".pagination").find(".ajax-link");
		if (links != null) {
			for (var i = 0; i < links.length; i++) {
				$(links[i]).removeClass("active-page");
			}
		}
		$(context).addClass("active-page");
	}

	$(document).ready(function() {
		getNewProducts(1);
		getBestSellingProducts();

		$(".ajax-link").click(function(e) {
			e.preventDefault();
			ajaxLinkClick(this);
		});
	});
</script>