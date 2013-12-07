<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
    
<script type="text/javascript">

    function formatCurrency(num) {
        num = num.toString().replace(/\$|\,/g, '');
        if (isNaN(num))
            num = "0";
        sign = (num == (num = Math.abs(num)));
        num = Math.floor(num * 100 + 0.50000000001);
        cents = num % 100;
        num = Math.floor(num / 100).toString();
        if (cents < 10)
            cents = "0" + cents;
        for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3) ; i++)
            num = num.substring(0, num.length - (4 * i + 3)) + ',' +
            num.substring(num.length - (4 * i + 3));
        return (((sign) ? '' : '-') + num + ' VNĐ');
    }

    function removeItemSuccess (data) {
        if (data.ItemCount == 0) {
            $('#row-' + data.DeleteId).fadeOut('slow');
        } else {
            $('#item-count-' + data.DeleteId).text(data.ItemCount);
        }

        if (data.CartCount > 0) {
            $('#item-total-' + data.DeleteId).text(formatCurrency(data.ItemTotal));
            $('#cart-total').text(formatCurrency(data.CartTotal));
            $('#update-message').text(data.Message);
            $('#cart-status').text('Giỏ hàng (' + data.CartCount + ')');
        }
        else {
            location.reload();
        }
    }

</script>

<table id="shoppingcart">
    <tr class="align-center">
        <th class="row-title-cart">STT</th>
        <th class="row-title-cart">Hình</th>
        <th class="row-title-cart">Tên sản phẩm
        </th>
        <th class="row-title-cart">Giá
        </th>
        <th class="row-title-cart">Số lượng
        </th>
        <th class="row-title-cart">Tổng cộng
        </th>
        @{
            bool allowRemove = (bool)ViewData["AllowRemove"];
        }
        @if (allowRemove)
        {
            <th class="row-title-cart">Xóa
            </th>
        }
    </tr>
    @{
        int i = 0;        
    }
    @foreach (var item in Model.CartItems)
    {
        i++;
        <tr id="row-@item.MaSo" class="row_item_cart">
            <td class="align-center">
                @i.ToString()
            </td>
            <td class="image-product-cart align-center">
                <img src="/@item.SanPham.HinhAnhDaiDien"/>
            </td>
            <td class="name-product">
                @Html.ActionLink(item.SanPham.TenSP, "Details", "Product", new { id = item.MaSP }, null)
            </td>
            <td class="align-right">
                @string.Format("{0:0,00} VNĐ", item.SanPham.GiaBanHienHanh)
            </td>
            <td id="item-count-@item.MaSo"  class="align-center">
                @item.SoLuong
            </td>
            <td class="align-right" id="item-total-@item.MaSo">
                @{ double total = item.SoLuong * item.SanPham.GiaBanHienHanh; }
                @string.Format("{0:0,00} VNĐ", total)
            </td>
            @if (allowRemove)
            {
                <td class="align-center">                    
                    <a data-ajax='true' data-ajax-method='GET' data-ajax-success='removeItemSuccess' href='/ShoppingCart/RemoveFromCart?id=@item.MaSo'>
                        <img src="/images/remove.gif" />
                    </a>
                </td>
            }
        </tr>
    }
    <tr class="row-total-card">
        <td colspan="5" class="align-right bold">
            Tổng cộng giỏ hàng
        </td>
        <td id="cart-total" class="align-right bold">
            @string.Format("{0:0,00} VNĐ", Model.CartTotal)
        </td>
        @if (allowRemove)
        {
            <td></td>
        }
    </tr>
</table>