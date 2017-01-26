
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>교육과정 과목구분 관리</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">
			s

			<div class="box">
				<div class="box-header">
					<div class="well text-center">1단계 분류 등록하기</div>
				</div>
				<div class="box-body">
					<div class="col-md-12">
						<form id="categoryForm" method="POST">
							<table class="table table-bordered table-hover">
								<tbody>
									<tr>
										<th>분류코드</th>
										<td><input type="text" name="f_ca_id" value="${item.f_ca_id }"></td>
									</tr>
									<tr>
										<th>분류명</th>
										<td><input type="text" name="f_ca_name" value="${item.f_ca_name }"></td>
									</tr>
									<tr>
										<th>내용</th>
										<td><textarea name="f_comment">${item.f_comment }</textarea></td>
								</tbody>
							</table>
						</form>
					</div>
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-default" id="categoryCreate">등록</button>
						<a class="btn btn-default" id="categoryList" href="list${pageMaker.makeSearch(pageMaker.cri.getPage()) }">목록</a>
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
	$(function() {
		$("#categoryCreate").click(function() {
			$("#categoryForm").submit();
		});
	});
</script>


