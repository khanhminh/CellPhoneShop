<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý đơn hàng</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Tìm kiếm</a></li>
	</ul>
</div>


<div class="row-fluid sortable">
	<div class="box span6">
		<div class="box-header well">
			<h2>
				<i class="icon-edit"></i>Tìm kiếm
			</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-minimize btn-round"><i
					class="icon-chevron-up"></i></a>
			</div>
		</div>
		<div class="box-content">
			<form class="form-horizontal" action="search_order.action" method="get" id="form-search">
				<fieldset>
					<div class="control-group">
						<label class="control-label" id="label-search" for="query">Từ khóa</label>
						<div class="controls">	
							<input class="text-box single-line input-xlarge focused" data-val="true"
										data-val-required="Vui lòng nhập từ khóa"
										name="query" type="text" id="query-search">
							<span class="field-validation-valid" data-valmsg-for="query"
										data-valmsg-replace="true">
							</span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Tìm theo:</label>
						<div class="controls">
							<label class="radio"> 
								<input data-val="true"
									data-val-required="Vui lòng chọn tiêu chí tìm kiếm"
									name="option" type="radio" checked="checked" value="id_order">
								Mã đơn hàng
							</label>
							<div style="clear: both"></div>
							<label class="radio"> 
								<input type="radio" name="option" value="id"/>
								Mã khách hàng
							</label>
							<div style="clear: both"></div>
							<label class="radio"> 
								<input type="radio" name="option" value="email"/>
								Email khách hàng
							</label>
							<div style="clear: both"></div>
							<span class="field-validation-valid"
										data-valmsg-for="option" 
										data-valmsg-replace="true">
							</span>
						</div>
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary" id="btn-search">Tìm</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
<div class="row-fluid sortable" id="data-search">
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#form-search').submit(function(e){
			e.preventDefault();
			var query = $('#query-search').val().trim();
			if (query != ""){
				$.ajax({
					url : "process_search_order.action",
					type : 'POST',
					data : $(this).serialize(),
					success : function(data) {
						$('#data-search').html(data);
					}
				});
			}
		});
	});
</script>
