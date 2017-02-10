
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet"
	href="/admin/resources/dist/css/bootstrap-datepicker3.min.css">
<script src="/admin/resources/plugins/ckeditor/ckeditor.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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
					<div class="well text-center">
					<c:choose>
					<c:when test="${param.mode eq 'create' }">
										연혁 등록하기
					</c:when>
					<c:otherwise>
					연혁 수정하기
					</c:otherwise>
					</c:choose>
					
					</div>
				</div>
				<div class="box-body">
					<form id="form" method="POST">
						<input type="hidden" name="f_use" id="f_use">
						<div class="col-md-12">
							<table class="table table-bordered table-hover">
								<tbody>
									<tr>
										<th>내용</th>
										<td colspan="3"><c:if test="${param.mode eq 'create' }">
												<a href="" class="btn btn-primary" id="addInputText">추가</a>
												<input type="text" placeholder="날짜" class="form-control"
													name="list[0].f_year">
												<input type="text" name="list[0].f_ko" class="form-control"
													placeholder="한글">
												<input type="text" name="list[0].f_en" class="form-control"
													placeholder="영어">
											</c:if> <c:if test="${param.mode eq 'modify' }">
											<input type="hidden" name="f_id_s" value="${param.f_id_s }">
												<input type="text" placeholder="날짜" class="form-control"
													name="f_year" value="${item.f_year }-${item.f_month}">
												<input type="text" name="f_ko" class="form-control"
													value="${item.f_ko}"
													placeholder="한글">
												<input type="text" name="f_en" class="form-control"
													placeholder="영어"
													value="${item.f_en}">
											</c:if></td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
					<div class="col-md-12 text-center">
						<c:choose>
							<c:when test="${param.mode eq 'create' }">
								<button type="button" class="btn btn-default" id="create">등록</button>

							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-default" id="modify">수정</button>

							</c:otherwise>
						</c:choose>
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
<script src="//code.jquery.com/ui/jquery-ui-git.js"></script>

<script>
	$(function() {
		i = 1;
		  $("[name*=f_year]").datepicker({
		        dateFormat: 'yy-mm',
		        changeYear: true,
		        changeMonth: true,
		        showButtonPanel: true,

		        onClose: function(dateText, inst) {
		            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		            $(this).val($.datepicker.formatDate('yy-mm', new Date(year, month, 1)));
		        }
		    });

		    $("[name*=f_year]").focus(function () {
		        $(".ui-datepicker-calendar").hide();
		  
		    });
		$("#addInputText")
				.click(
						function(event) {
							event.preventDefault();
							var text = "<hr> <input type=\"text\" class=\"form-control\" name=\"list["+i+"].f_year\" placeholder=\"날짜\"><input name=\"list["+i+"].f_ko\" class='form-control' placeholder='한글'><input type='text' name='list["+i+"].f_en' class='form-control' placeholder='영어'>";
							i++;
							$("[name*=f_year]").datepicker({
								dateFormat : 'yy-mm'
							});
							$(this).parent().append(text);
						});
		$("#create").click(function() {

			/* var f_title = $("[name=f_title]");
			if (!f_title.val()) {
				alert("연혁 제목을 입력하세요!");
				f_title.focus();
				return;
			} */
			$("#form").attr("action","create");
			$("#form").submit();
		});

		$("#modify").click(function() {
			$("#form").attr("action","modify");
			$("#form").submit();
		})

	});
</script>
