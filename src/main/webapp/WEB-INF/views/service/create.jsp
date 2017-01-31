
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
		<h1>상담 요청 분야</h1>
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">상담 요청 분야</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<div class="well text-center">상담 요청 분야 등록하기</div>
				</div>
				<div class="box-body">
					<form id="popupCreateForm" method="POST">
						<input type="hidden" name="f_use" id="f_use">
						<div class="col-md-12">
							<table class="table table-bordered table-hover">
								<tbody>
									<tr>
										<th>제목</th>
										<td colspan="3"><input type="text" class="form-control"
											name="f_subject"></td>
									</tr>
									<tr>
										<th>출력 순서</th>
										<td colspan="3"><label class="checkbox-inline"><input
												type="checkbox" name="use" id="use">체크시 팝업 사용</label></td>
									</tr>
									
								</tbody>
							</table>
						</div>
					</form>
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-default" id="popupCreate">등록</button>
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

<script
	src="/admin/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
	src="/admin/resources/plugins/datepicker/locales/bootstrap-datepicker.kr.js"></script>
<script>
	$(function() {
		$("[name='f_start'], [name='f_end']").datepicker({
			format : 'yyyy-mm-dd',
			langauge:"kr",
			autoclose : true
		});

		$("#popupCreate").click(function() {
			var checked = $("#use").is(":checked");
			if (checked) {
				$("#f_use").val('Y');
			} else {
				$("#f_use").val('N');
			}
			var f_subject = $("[name=f_subject]");
			if (!f_subject.val()) {
				alert("팝업 제목을 입력하세요!");
				f_subject.focus();
				return;
			}
			$("#popupCreateForm").submit();
		});

	});
</script>
