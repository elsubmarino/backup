
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>수강신청관리</h1>
		<ol class="breadcrumb">
			<li><a href="/admin"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<div class="well text-center">정보 수정하기</div>
				</div>
				<div class="box-body">
					<form method="POST" id="form">
						<input type="hidden" name="f_use" id="f_use">
						<c:if test="${param.mode eq 'modify' }">
						<input type="hidden" name="f_id" value="${param.f_id }">
						</c:if>
						<div class="col-md-12">
							<table class="table table-bordered table-hover">
								<tbody>
									<tr>
										<th>교육과정</th>
										<td colspan="3"><select class="col-sm-1 form-control "
											style="width: 250px; text-align: right; padding-left: 0; padding-right: 0; margin-left: 30px; border-right: 0;">
												<option>과목구분</option>
												<c:forEach items="${categoryNames }" var="item">
													<option value="${item.f_ca_id }">${item.f_ca_name }</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th>성명</th>
										<td colspan="3"><input name="f_name" type="text" value="${item.f_name }"></td>
									</tr>
									<tr>
										<th>메일주소</th>
										<td><input name="f_email" type="text" value="${item.f_email }"></td>
									</tr>
									<tr>
										<th>이동전화</th>
										<td><input name="f_hp" type="text" value="${item.f_hp }"></td>
									</tr>
									<tr>
										<th>회사전화</th>
										<td><input name="f_tel" type="text" value="${item.f_tel }"></td>
									</tr>
									<tr>
										<th>소속</th>
										<td><input name="f_sosok" type="text" value="${item.f_sosok }"></td>
									</tr>
									<tr>
										<th>부서명</th>
										<td><input name="f_buser" type="text" value="${item.f_buser }"></td>
									</tr>
									<tr>
										<th>담당업무</th>
										<td><input name="f_upmu" type="text" value="${item.f_upmu }"></td>
									</tr>
									<tr>
										<th>질의사항</th>
										<td><textarea name="f_comment">${item.f_comment }</textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-default" id="modify">수정</button>
						<a class="btn btn-default"
							href="list${pageMaker.makeSearch(pageMaker.cri.getPage()) }">목록</a>
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
<script>
	$(function() {
		$("[name='f_start'], [name='f_end']").datepicker({
			format : 'yyyy-mm-dd',
			autoclose : true
		});
		$("#modify").click(function() {
			
			$("#form").attr("action","/admin/online/modify");
			$("#form").submit();
		});
	});
</script>
