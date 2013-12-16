<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">ĐIỆN THOẠI THÔNG MINH</h2>
		<div class="nav-page push10">
			<a>Sản phẩm</a> » <span class="active-link"> <a>Điện
					thoại thông minh</a>
			</span>
		</div>

		<div id="sidebar_1" class="sidebar one_quarter first">
			<div class="sidebox-wrapper">

				<div id="categories" class="sidebox-wrapper">
					<div class="sidebox-title">
						<span>PHÂN LOẠI</span>
					</div>
					<div class="sidebox-body">
						<div class="group-narrow">
							<h4>Giá</h4>
							<ul>
								<li><input type="checkbox" class="chk-select" /> <label>100,000
										- 500,000 VND</label></li>
								<li><input type="checkbox" class="chk-select" /> <label>100,000
										- 500,000 VND</label></li>
								<li><input type="checkbox" class="chk-select" /> <label>100,000
										- 500,000 VND</label></li>
								<li><input type="checkbox" class="chk-select" /> <label>100,000
										- 500,000 VND</label></li>
							</ul>
						</div>
						<div class="group-narrow">
							<h4>Nha san xuat</h4>
							<ul>
								<li><input type="checkbox" /> <label>Apple</label></li>
								<li><input type="checkbox" /> <label>Samsung</label></li>
								<li><input type="checkbox" /> <label>HTC</label></li>
								<li><input type="checkbox" /> <label>LG</label></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>




		<div id="gallery" class="three_quarter">

			<!--<div class="guide-select">
                </div>-->



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
					<label>Sắp xếp: </label> <select>
						<option>Giá tăng dần</option>
						<option>Giá giảm dần</option>
					</select>
				</div>
			</div>

			<section>
				<figure>
					<ul id="List" class="clear">
						<li>
							<div class="product-info clear">
								<div class="product-image one_quarter">
									<img src="resources/images/s4.jpg" />
									<div class="product-compare">
										<input type="checkbox" value="So sanh" id="s4" name="compare"
											class="chk-compare" data-src="resources/images/s4.jpg"
											data-name="Samsung galaxy S4" /> <label for="compare">so
											sanh</label>
									</div>
								</div>
								<div class="product-main two_quarter">
									<h2>Samsung galaxy S4</h2>
									<div class="rating">
										<img src="resources/images/star-on.png" /> <img src="resources/images/star-on.png" />
										<img src="resources/images/star-on.png" /> <img src="resources/images/star-on.png" />
										<img src="resources/images/star-off.png" />
									</div>
									<ul>
										<li>CPU: Dual-core 1 GHz</li>
										<li>Ram: 2G</li>
										<li>Man hinh: 4.0 inch</li>
										<li>Pin: 2000 mA</li>
										<li>Camera: 5 MP</li>
									</ul>
								</div>
								<div class="product-price one_quarter">
									<h2>14,490,000 VNĐ</h2>
									<h3>Khuyen mai:</h3>
									<ul>
										<li>Tang bao da</li>
										<li>Tai nghe</li>
									</ul>
									<div class="btn-addcart">
										<a href="/ShoppingCart/AddToCart?id=57"> <img
											src="resources/images/btn_addcart_vn.gif">
										</a>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="product-info clear">
								<div class="product-image one_quarter">
									<img src="demo/s4.jpg" />
									<div class="product-compare">
										<input type="checkbox" value="So sanh" id="Checkbox1"
											name="compare" class="chk-compare" data-src="demo/s4.jpg"
											data-name="Samsung galaxy S4" /> <label for="compare">so
											sanh</label>
									</div>
								</div>
								<div class="product-main two_quarter">
									<h2>Samsung galaxy S4</h2>
									<div class="rating">
										<img src="demo/star-on.png" /> <img src="demo/star-on.png" />
										<img src="demo/star-on.png" /> <img src="demo/star-on.png" />
										<img src="demo/star-off.png" />
									</div>
									<ul>
										<li>CPU: Dual-core 1 GHz</li>
										<li>Ram: 2G</li>
										<li>Man hinh: 4.0 inch</li>
										<li>Pin: 2000 mA</li>
										<li>Camera: 5 MP</li>
									</ul>
								</div>
								<div class="product-price one_quarter">
									<h2>14,490,000 VNĐ</h2>
									<h3>Khuyen mai:</h3>
									<ul>
										<li>Tang bao da</li>
										<li>Tai nghe</li>
									</ul>
									<div class="btn-addcart">
										<a href="/ShoppingCart/AddToCart?id=57"> <img
											src="demo/btn_addcart_vn.gif">
										</a>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="product-info clear">
								<div class="product-image one_quarter">
									<img src="demo/s4.jpg" />
									<div class="product-compare">
										<input type="checkbox" value="So sanh" id="Checkbox2"
											name="compare" class="chk-compare" data-src="demo/s4.jpg"
											data-name="Samsung galaxy S4" /> <label for="compare">so
											sanh</label>
									</div>
								</div>
								<div class="product-main two_quarter">
									<h2>Samsung galaxy S4</h2>
									<div class="rating">
										<img src="demo/star-on.png" /> <img src="demo/star-on.png" />
										<img src="demo/star-on.png" /> <img src="demo/star-on.png" />
										<img src="demo/star-off.png" />
									</div>
									<ul>
										<li>CPU: Dual-core 1 GHz</li>
										<li>Ram: 2G</li>
										<li>Man hinh: 4.0 inch</li>
										<li>Pin: 2000 mA</li>
										<li>Camera: 5 MP</li>
									</ul>
								</div>
								<div class="product-price one_quarter">
									<h2>14,490,000 VNĐ</h2>
									<h3>Khuyen mai:</h3>
									<ul>
										<li>Tang bao da</li>
										<li>Tai nghe</li>
									</ul>
									<div class="btn-addcart">
										<a href="/ShoppingCart/AddToCart?id=57"> <img
											src="demo/btn_addcart_vn.gif">
										</a>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</figure>


			</section>


			<nav class="pagination">

				<div class="info-page">
					<span class="current-page">1</span> of <span class="total-page">5</span>
				</div>

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
				<div class="view-page">
					<label>Số sản phẩm: </label> <select>
						<option>10</option>
						<option>15</option>
						<option>20</option>
					</select>
				</div>
			</nav>
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
            }
            else {
                alert('full');
            }
        }

        function removeCompare(index) {
            var list = $('#list-compare').children();
            var li = $(list[index]);
            li.children().remove();
            li.attr('data-empty', true);
        }


        $(document).ready(function () {
            $(".chk-select").click(function () {
                alert("ok");
            });
            
            $(".chk-compare").click(function () {
                if ($(this).is(':checked')) {
                    addListCompare(this);
                }
                else {
                    var idx = $(this).attr('data-index');
                    removeCompare(idx);
                }
            });

            $(".item-compare").click(function () {
                if ($(this).attr('data-empty') == 'false') {
                    $(this).children().remove();
                    $(this).attr('data-empty', true);
                    var id = $(this).attr('data-ref');
                    $('#' + id).prop('checked', false);
                }
            });
        });
    </script>