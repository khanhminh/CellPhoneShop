<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
    <ul class="breadcrumb">
        <li>
            <a href="#">Quản lý tài khoản</a> <span class="divider">/</span>
        </li>
        <li>
            <a href="#">Phân quyền</a>
        </li>
    </ul>
</div>

<div class="row-fluid sortable ui-sortable">
    <div class="box span6">
        <div class="box-header well" data-original-title="">
            <h2><i class="icon-edit"></i>Tài khoản</h2>
            <div class="box-icon">
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
            </div>
        </div>
        <div class="box-content">
        	<form action="set_role.action" method="post">
        	                
                <table>
                    <tr>
                        <td>
                            <label class="control-label">Email</label>
                        </td>
                        <td>
                            <span class="input-xlarge uneditable-input">${account.email}</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3>Role</h3>
                        </td>
                    </tr>
                    <c:forEach var="role" items="${listRole}">                     
                        <c:set var="isChecked" value="false"/>
                        <c:forEach var="r" items="${acc.vaiTros}">
                        	<c:if test="${r.maVaiTro == role.maVaiTro}">
                        		<c:set var="isChecked" value="true"/>
                        	</c:if>
                        </c:forEach>
                        <tr>
                            <td style="text-align: right">
                            	<c:choose>
                            		<c:when test="${isChecked}">
                            			<input type="checkbox" value="@role" name="role-@role" id="role-@role" checked="checked"/>
                            		</c:when>
                            		<c:otherwise>
                            			<input type="checkbox" value="@role" name="role-@role" id="role-@role"/>
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                            <td>
                                <label class="control-label" for="role-@role">${role.tenVaiTro}</label>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>${requestScope.message}</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="Cập nhật" class="btn btn-primary" style="margin-left: 20px; margin-top: 20px" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <!--/span-->
</div>
