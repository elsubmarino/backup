
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>메타 태그 관리</h1>
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">메타 태그 관리</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header" style="padding-bottom: 0;">
			
				
				</div>
				<div class="box-body">
					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<colgroup>
								<col width="150px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
								<th>타이틀명</th>
								<td>${item.f_title }</td>
								</tr>
								<tr>
								<th>한글키워드</th>
								<td>${item.keywords }</td>
								</tr>
								<tr>
								<th>영문키워드</th>
								<td>${item.keywords_e }</td>
								</tr>
								<tr>
								<th>요약설명</th>
								<td>${item.f_comment }</td>
								</tr>
							</tbody>
						</table>
					</div>
					
				</div>
			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
<script>
	$('tr[data-href]').on("click", function() {
		document.location = $(this).data('href');
	});
</script>