
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="/admin/resources/dist/css/bootstrap-datepicker3.min.css">
<script src="/admin/resources/plugins/ckeditor/ckeditor.js"></script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>연혁 관리</h1>
		<ol class="breadcrumb">
			<li><a href="/admin"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">연혁 관리</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<div class="well text-center">연혁 등록하기</div>
				</div>
				<div class="box-body">
					<form id="createForm" method="POST">
						<input type="hidden" name="f_use" id="f_use">
						<div class="col-md-12">
							<table class="table table-bordered table-hover">
								<tbody>
									<tr>
										<th>연혁 제목</th>
										<td colspan="3"><input type="text" class="form-control"
											name="f_title"></td>
									</tr>
									<tr>
									<th>연혁 년도</th>
									<td colspan="3"><input type="number" name="f_date" min="2011" step="1"></td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3">
											<a href="" class="btn btn-primary" id="addInputText">추가</a>
											<input type="text" name="f_comment" class="form-control" placeholder="항목 이름">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-default" id="create">등록</button>
						<a class="btn btn-default"
							href="list?${pageMaker.makeSearch(pageMaker.cri.getPage()) }">목록</a>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<!-- CK Editor -->

<%@include file="../include/footer.jsp"%>

<script>
	$(function() {
		$("#addInputText").click(function(event) {
			event.preventDefault();
							var text = "<input type='text' name='f_comment' class='form-control' placeholder='항목 이름'>";
							$(this).parent().append(text);
						});
		$("#create").click(function() {
			
			var f_title = $("[name=f_title]");
			if (!f_title.val()) {
				alert("연혁 제목을 입력하세요!");
				f_title.focus();
				return;
			}
			$("#createForm").submit();
		});

	});
</script>
