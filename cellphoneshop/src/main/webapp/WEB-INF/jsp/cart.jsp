<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">GIỎ HÀNG</h2>
		<div id="nav-shopping">
			<strong> <span class="active-link"> <a href="#">Giỏ
						hàng</a>
			</span> » Thông tin đơn hàng » Hoàn tất
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
					<th class="row-title-cart">Xóa</th>
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
						<td class="align-center">
							<a href="editcart?action=add&product=${p.maSp}"> 
								<img id="icon-add" src="resources/images/add.png">
						    </a> ${item.count} 
						    <a href="editcart?action=remove&product=${p.maSp}" 
						    	class="remove-item" data-count="${item.count}" data-name="${p.tenSp}" data-id="${p.maSp}">
								<img id="icon-remove" src="resources/images/remove.png">
						   	</a>
						</td>
						<td class="align-right"><fmt:formatNumber
								value="${item.count * p.gia}" type="number" /> VNĐ</td>
						<td class="align-center">
							<a href="editcart?action=delete&product=${p.maSp}" 
								class="delete-item" data-name="${p.tenSp}" data-id="${p.maSp}"> 
								<img src="resources/images/remove.gif">
							</a>
						</td>
					</tr>
				</c:forEach>

				<tr class="row-total-card">
					<td colspan="5" class="align-right bold">Tổng cộng giỏ hàng</td>
					<td id="cart-total" class="align-right bold"><fmt:formatNumber
							value="${total}" type="number" /> VNĐ</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<div id="button-cart">
			<input type="button" value="Tiếp tục mua"
				onclick="location.href = 'home';"> <input type="button"
				value="Thanh toán" onclick="location.href = 'checkout';">
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="dialog" title="Giỏ hàng">
  <p>Bạn có muốn xóa <span id="dialog-name-product"></span>?</p>
</div>
<script>	
	var name = "";
	var id = "";
	
	$("#dialog").dialog({
		autoOpen: false,
		modal: true,
		buttons: {
            OK: function() { //ok
                $(this).dialog( "close" );
            	window.location.href = "editcart?action=delete&product=" + id;
            },
            Cancel: function() { //cancel
                $(this).dialog( "close" );
            }
        }
	});
	function deleteItem(context){	
		name = $(context).attr('data-name');
		id = $(context).attr('data-id');
		$("#dialog-name-product").text(name);
		$("#dialog").dialog("open");
	}

	$(document).ready(function(){
		$('.remove-item').click(function(e){
			var count = parseInt($(this).attr('data-count'));
			if (count == 1){
				e.preventDefault();
				deleteItem(this);
			}
		});
		
		$('.delete-item').click(function(e){
			e.preventDefault();
			deleteItem(this);
		});
	});
</script>