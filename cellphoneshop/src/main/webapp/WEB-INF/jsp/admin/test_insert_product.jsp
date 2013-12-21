<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wapper row3">
	<div id="container">
		<h2 class="title-content push50">NHẬP SẢN PHẨM MỚI</h2>
		
		<%-- <c:forEach items="${danhSachNhaSanXuat}" var="nsx">
			<c:out value="${nsx.tenNhaSx}"/>
		</c:forEach> --%>
		
		<s:form action="insert_product">
			<table>
				<tr>
					<th colspan="2">Thông tin sản phẩm tổng quát</th>
				</tr>
				<tr>
					<td>Mã sản phẩm</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<s:textfield label="Tên sản phẩm" name="sanPham.tenSp"/>
					</td>
				</tr>
				<tr>
					<td>Nhà sản xuất</td>
					<td>
						<select name="maNhaSanXuat">
							<c:forEach items="${danhSachNhaSanXuat}" var="nsx">
								<option value="<c:out value="${nsx.maNhaSx}"/>"><c:out value="${nsx.tenNhaSx}"/></option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<s:textfield label="Giá" name="sanPham.gia"/>
					</td>
				</tr>
				<tr>
					<td>
						<s:textfield label="Số tháng bảo hành" name="sanPham.soThangBaoHanh" value="0"/>
					</td>
				</tr>
				<tr>
					<td>
						<s:textfield label="Số lượng hiện có" name="sanPham.soLuongHienCo" value="0"/>
					</td>
				</tr>
				<tr>
					<td>
						<s:textfield label="Tổng số lượng" name="sanPham.tongSoLuong" value="0"/>
					</td>
				</tr>
				
				
				
				<tr>
					<td></td>
					<td><input type="submit" value="Thêm sản phẩm"/></td>
				</tr>
			</table>
		</s:form>
	</div>
</div>