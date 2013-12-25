<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">THÔNG TIN THANH TOÁN</h2>
		<div id="nav-shopping">
			<strong> <span class="active-link-prev"> <a
					href="cart.action">Giỏ hàng</a>
			</span> » <span class="active-link"> <a href="#">Thông tin đơn
						hàng</a>
			</span> » Hoàn tất
			</strong>
		</div>
		<table id="shoppingcart">
			<tbody>
				<tr class="align-center">
					<th class="row-title-cart">STT</th>
					<th class="row-title-cart">Hình</th>
					<th class="row-title-cart">Tên sản phẩm</th>
					<th class="row-title-cart">Giá</th>
					<th class="row-title-cart">Số lượng</th>
					<th class="row-title-cart">Tổng cộng</th>
				</tr>

				<c:forEach var="item" items="${sessionScope.cart}">
					<c:set scope="page" var="p" value="${item.product}" />
					<c:set scope="page" var="total"
						value="${total + (item.count * p.gia)}" />

					<tr class="row_item_cart">
						<td class="align-center">${sessionScope.cart.indexOf(item) + 1}</td>
						<td class="image-product-cart align-center"><img
							src="${p.hinhDaiDien}"></td>
						<td class="name-product"><a href="detail?product=${p.maSp}">${p.tenSp}</a></td>
						<td class="align-right"><fmt:formatNumber value="${p.gia}"
								type="number" /> VNĐ</td>
						<td class="align-center">${item.count}</td>
						<td class="align-right"><fmt:formatNumber
								value="${item.count * p.gia}" type="number" /> VNĐ</td>
					</tr>
				</c:forEach>

				<tr class="row-total-card">
					<td colspan="5" class="align-right bold">Tổng cộng giỏ hàng</td>
					<td id="cart-total" class="align-right bold"><fmt:formatNumber
							value="${total}" type="number" /> VNĐ</td>
				</tr>
			</tbody>
		</table>
		<form action="checkout" id="frmCheckout" method="post">
			<div id="receiver">
				<table>
					<tbody>
						<tr>
							<th class="title-table" colspan="2">Thông tin giao hàng</th>
						</tr>
						<tr>
							<td>
								<label for="Receiver_HoTen">Họ tên</label> 
								(<span class="mark">*</span>)
							</td>
							<td>
								<input class="text-box single-line" data-val="true"
									data-val-required="Vui lòng nhập họ tên"
									name="donHang.nguoiNhan.hoTen" type="text" value="">
								<span class="field-validation-valid" data-valmsg-for="donHang.nguoiNhan.hoTen"
									data-valmsg-replace="true">
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<label for="receive.diachi">Địa chỉ</label>
							 	(<span class="mark">*</span>)
							</td>
							<td>
								<input class="text-box single-line" data-val="true"
									data-val-required="Vui lòng nhập địa chỉ"
									name="donHang.nguoiNhan.diaChi" type="text" value="">
								<span class="field-validation-valid" data-valmsg-for="donHang.nguoiNhan.diaChi"
									data-valmsg-replace="true">
								</span>
							</td>
						</tr>
						<tr>
							<td>
								<label for="receiver.dienthoai">Điện thoại liên
									lạc
								</label> 
								(<span class="mark">*</span>)
							</td>
							<td>
								<input class="text-box single-line" data-val="true"
									data-val-regex="Số điện thoại không hợp lệ"
									data-val-regex-pattern="^\d{6,11}$"
									data-val-required="Vui lòng nhập điện thoại liên lạc"
									name="donHang.nguoiNhan.soDienThoai" type="text"
									value="">
								<span class="field-validation-valid"
									data-valmsg-for="donHang.nguoiNhan.soDienThoai" data-valmsg-replace="true">
								</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="ptgh">
				<table>
					<tbody>
						<tr>
							<th class="title-table" colspan="2">Phương thức giao hàng</th>
						</tr>
						<c:forEach var="pt" items="${ptgh}">
							<tr>
								<td class="td-select">
									<input data-val="true" data-val-required="Vui lòng chọn phương thức giao hàng"
										name="donHang.ptGiaoHang.maPtgiaoHang"
										type="radio" value="${pt.maPtgiaoHang}">
								</td>
								<td>
									${pt.tenPtgiaoHang}
								</td>
							</tr>						
						</c:forEach>
						<tr>
							<td colspan="2">
								<span class="field-validation-valid"
									data-valmsg-for="donHang.ptGiaoHang.maPtgiaoHang" data-valmsg-replace="true">
								</span>
							</td>
						</tr>						
					</tbody>
				</table>
			</div>
			<div id="pttt">
				<table>
					<tbody>
						<tr>
							<th class="title-table" colspan="2">Phương thức thanh toán</th>
						</tr>
						<c:forEach var="ptt" items="${pttt}">
							<tr>
								<td class="td-select">
									<input data-val="true" data-val-required="Vui lòng chọn phương thức thanh toán"
										name="donHang.ptThanhToan.maPtthanhToan"
										type="radio" value="${ptt.maPtthanhToan}">
								</td>
								<td>
									${ptt.tenPtthanhToan}
								</td>
							</tr>						
						</c:forEach>
						<tr>
							<td colspan="2">
								<span class="field-validation-valid"
									data-valmsg-for="donHang.ptThanhToan.maPtthanhToan" data-valmsg-replace="true">
								</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<p>
				<input type="submit" value="Xác nhận">
			</p>
		</form>
	</div>
	<div class="clear"></div>
</div>