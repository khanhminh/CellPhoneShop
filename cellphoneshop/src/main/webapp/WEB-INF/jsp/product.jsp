<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">ĐIỆN THOẠI THÔNG MINH</h2>
		<div class="nav-page push10">
			<a>Sản phẩm</a> » <span class="active-link"> <a>Điện
					thoại thông minh</a>
			</span>
		</div>

		<!-- sidebar -->
		<jsp:include page="sidebar_product.jsp"></jsp:include>

		<div id="gallery" class="three_quarter">
			<c:choose>
				<c:when test="${empty listProduct}">
					<h2>Không tìm được kết quả nào</h2>
				</c:when>
				<c:otherwise>
					<div class="compare-bar">
						<div class="compare-list">
							<label>Sản phẩm so sánh: </label>
							<ul id="list-compare">
								<li data-empty="true" class="item-compare"></li>
								<li data-empty="true" class="item-compare"></li>
								<li data-empty="true" class="item-compare"></li>
								<li data-empty="true" class="item-compare"></li>
							</ul>
							<a href="#" class="button small blue">So sánh</a>
						</div>

						<div class="compare-sortby">
							<label>Sắp xếp: </label> <select id="compare-sortby">
								<c:forEach var="sort" items="${requestScope.listSortby}">
									<option value="${sort.code}"
										<c:if test="${requestScope.sortby == sort.code}">
									selected="true"
								</c:if>>
										${sort.title}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<section>
						<figure>
							<ul id="List" class="clear">
								<c:forEach var="sp" items="${listProduct}">
									<c:forEach var="inf" items="${sp.ctSanPhams}">
										<c:set var="info" value="${inf}" />
									</c:forEach>
									<li>
										<div class="product-info clear">
											<div class="product-image one_quarter">
												<a href="detail?product=${sp.maSp}"> <img
													src="${sp.hinhDaiDien}" />
												</a>
												<div class="product-compare">
													<input type="checkbox" value="" id="${sp.maSp}"
														name="compare" class="chk-compare"
														data-src="${sp.hinhDaiDien}" data-name="${sp.tenSp}" /> <label
														for="compare">So sánh</label>
												</div>
											</div>
											<div class="product-main two_quarter">
												<h2>
													<a href="detail?product=${sp.maSp}">${sp.tenSp}</a>
												</h2>
												<div class="rating" data-score="${sp.diemDanhGiaTb}">
													<img src="resources/images/star-off.png" /> <img
														src="resources/images/star-off.png" /> <img
														src="resources/images/star-off.png" /> <img
														src="resources/images/star-off.png" /> <img
														src="resources/images/star-off.png" />
												</div>
												<ul>
													<li>CPU:
														${info.chipset}&nbsp;${info.soNhanCpu}&nbsp;${info.tocDoCpu}</li>
													<li>GPU: ${info.gpu}</li>
													<li>Ram: ${info.ram}</li>
													<li>Màn hình: ${info.kichThuocManHinh}
														inch&nbsp;${info.doPhanGiaiManHinh}</li>
													<li>Pin: ${info.dungLuongPin}</li>
													<li>Camera: ${info.cameraSau}</li>
												</ul>
											</div>
											<div class="product-price one_quarter">
												<h2>
													<fmt:formatNumber value="${sp.gia}" type="number" />
													VNĐ
												</h2>
												<h3>Khuyến mãi:</h3>
												<ul>
													<li>Tặng ốp lưng</li>
													<li>Tai nghe</li>
												</ul>
												<div class="btn-addcart">
													<a href="editcart?action=add&product=${sp.maSp}"> <img
														src="resources/images/btn_addcart_vn.gif" />
													</a>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</figure>
					</section>
				</c:otherwise>
			</c:choose>

			<c:if test="${totalPage > 1}">
				<nav class="pagination">
					<div class="info-page">
						<span class="current-page">${page}</span> of <span
							class="total-page">${totalPage}</span>
					</div>
					<ul>
						<c:forEach var="p" begin="1" end="${totalPage}">
							<li><a href="product?page=${p}"
								<c:choose>
								<c:when test="${page == p}">
									class="active-page ajax-link" href="#"
								</c:when>
								<c:otherwise>
									class="ajax-link"
								</c:otherwise>
							</c:choose>>${p}
							</a></li>
						</c:forEach>

					</ul>
					<div class="view-page">
						<label>Số sản phẩm: </label> <select id="view-page">
							<option value="10"
								<c:if test="${productPerPage == 10}">
								selected="true"
							</c:if>>
								10</option>
							<option value="15"
								<c:if test="${productPerPage == 15}">
								selected="true"
							</c:if>>
								15</option>
							<option value="20"
								<c:if test="${productPerPage == 20}">
								selected="true"
							</c:if>>
								20</option>
						</select>
					</div>
				</nav>
			</c:if>
		</div>
	</div>
</div>
<script>
	function checkEmptyList() {
		var list = $('#list-compare').children();
		for (var i = 0; i < list.length; i++) {
			var li = $(list[i]);
			if (li.attr('data-empty') == 'true') {
				return i;
			}
		}

		return -1;
	}

	function addListCompare(context) {
		var index = checkEmptyList();
		if (index != -1) {
			var src = $(context).attr('data-src');
			var name = $(context).attr('data-name');
			var id = $(context).attr('id');

			var list = $('#list-compare').children();
			var li = $(list[index]);

			var img = $("<img src='" + src + "' title='" + name + "' />");
			img.appendTo(li);

			li.attr('data-empty', false);
			li.attr('data-ref', id);
			$(context).attr('data-index', index);
		} else {
			alert('full');
		}
	}

	function removeCompare(index) {
		var list = $('#list-compare').children();
		var li = $(list[index]);
		li.children().remove();
		li.attr('data-empty', true);
	}

	function showRating(context, score) {
		if (score == 0)
			return;

		var arr = [ 0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5 ];
		var min = arr[0];
		for (var i = 1; i < arr.length; i++) {
			if (Math.abs(arr[i] - score) < Math.abs(min - score)) {
				min = arr[i];
			}
		}
		score = min;
		var limit = Math.round(score - 0.1);

		var list = $(context).children();
		var index = 0;
		for (; index < list.length; index++) {
			var img = $(list[index]);
			if (index < limit) {
				img.attr('src', "resources/images/star-on.png");
			} else {
				img.attr('src', "resources/images/star-off.png");
			}
		}
		if (score - limit > 0.1) {
			var img = $(list[index]);
			img.attr('src', "resources/images/star-half.png");
		}
	}

	function setRating() {
		var ratings = $('#List').find('.rating');
		for (var i = 0; i < ratings.length; i++) {
			var rating = ratings[i];
			var score = $(rating).attr('data-score');
			showRating(rating, score);
		}
	}

	$(document).ready(function() {
		setRating();
		$(".chk-select").click(function() {
			$('#frm-filter').submit();
		});

		$(".chk-compare").click(function() {
			if ($(this).is(':checked')) {
				addListCompare(this);
			} else {
				var idx = $(this).attr('data-index');
				removeCompare(idx);
			}
		});

		$(".item-compare").click(function() {
			if ($(this).attr('data-empty') == 'false') {
				$(this).children().remove();
				$(this).attr('data-empty', true);
				var id = $(this).attr('data-ref');
				$('#' + id).prop('checked', false);
			}
		});

		$('#view-page').change(function() {
			var value = $(this).val();
			$('#productPerPage-frm-filter').attr('value', value);
			$('#page-frm-filter').attr('value', 1);
			$('#frm-filter').submit();
		});

		$('.ajax-link').click(function(e) {
			e.preventDefault();
			var page = $(this).text().trim();
			$('#page-frm-filter').attr('value', page);
			$('#frm-filter').submit();
		});

		$('#compare-sortby').change(function() {
			var value = $(this).val();
			$('#sortby-frm-filter').attr('value', value);
			$('#frm-filter').submit();
		});
	});

	
</script>