
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
			<li><a href="/admin"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">교육과정 과목구분 관리</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">
			<div class="box">
				<div class="box-header">
					<div class="well text-center">분류 등록하기</div>
				</div>
				<div class="box-body">
					<div class="col-md-12">
						<form id="categoryForm" method="POST">
							<table class="table table-bordered table-hover">
								<colgroup>
									<col width="150px">
								</colgroup>
								<tbody>
									<tr>
										<th style="vertical-align: middle;">분류코드</th>
										<td><c:if test="${param.mode eq 'modify' }">
												<input type="text" class="form-control" name="f_ca_id"
													readonly="readonly" value="${item.f_ca_id }">
													<input type="hidden" name="f_id" value="${param.f_id }">
											</c:if> <c:if test="${param.mode eq 'create' }">
												<input type="text" class="form-control" name="f_ca_id"
													readonly="readonly" value="${f_ca_id}">
											</c:if></td>
									</tr>
									<tr>
										<th style="vertical-align: middle;">분류명</th>
										<td><input type="text" class="form-control"
											name="f_ca_name"
											<c:if test="${param.mode eq 'modify' }">value='${item.f_ca_name }'</c:if>></td>
									</tr>
									<tr>
										<th style="vertical-align: middle;">내용</th>
										<td><textarea class="form-control" name="f_comment"
												><c:if test="${param.mode eq 'modify' }">${item.f_comment }</c:if></textarea></td>
								</tbody>
							</table>
						</form>
					</div>
					<div class="col-md-12 text-center">
						<c:if test="${param.mode eq 'create' }">
							<button type="button" class="btn btn-default" id="categoryCreate">등록</button>

						</c:if>
						<c:if test="${param.mode eq 'modify' }">
							<button type="button" class="btn btn-default" id="modify">수정</button>

						</c:if>
						<a class="btn btn-default" id="categoryList"
							href="list${pageMaker.makeSearch(pageMaker.cri.getPage()) }">목록</a>
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
			var f_ca_name = $("[name=f_ca_name]");
			if (!f_ca_name.val()) {
				alert("분류명을 입력하셔야 합니다!");
				f_ca_name.focus();
				return;
			}
			$("#categoryForm").attr("action", "create");
			$("#categoryForm").submit();
		});

		$("#modify").click(function() {
			$("#categoryForm").attr("action", "modify");
			$("#categoryForm").submit();
		})
	});
</script>


