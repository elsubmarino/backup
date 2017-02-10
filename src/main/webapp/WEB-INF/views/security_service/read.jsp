
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>
<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>온라인 문의</h1>
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
					<div class="well text-center">상세보기</div>
				</div>
				<div class="box-body">
					<form method="POST" id="popupModifyForm">
						<input type="hidden" name="f_use" id="f_use">
						<div class="col-md-12">
							<table class="table table-bordered table-hover">
								<tbody>
									<tr>
										<th>문의 구분</th>
										<td colspan="3">${item.f_type2 }</td>
									</tr>
									<tr>
										<th>성명</th>
										<td>${item.f_name }</td>
										<th>연락처(H.P)</th>
										<td>${item.f_hp } (수신확인 : <c:out value="${item.f_sms_chk eq ''?'N':'Y' }"/>)</td>
									</tr>
									<tr>
										<th>소속부서명</th>
										<td>${item.f_buser }</td>
										<th>직통번호</th>
										<td>${item.f_tel }</td>
									</tr>
									
									<tr>
										<th>회사명</th>
										<td>${item.f_company }
											</td>
											<th>이메일</th>
											<td>${item.f_email } (수신확인 : <c:out value="${item.f_email_chk eq ''?'N':'Y' }"/>)</td>
									</tr>
									<tr>
										<th>서비스 요청분야</th>
										<td>${item.f_type}</td>
									</tr>
									<tr>
										<th>내용 </th>
										<td>${item.f_comment }
											</td>
									</tr>
									
														<tr>
										<th>등록일</th>
										<td>
										<fmt:formatDate pattern="yyyy-mm-dd hh:mm:ss" value="${item.f_wdate }"/>
											</td>
									</tr>
									
									
								</tbody>
							</table>
						</div>
					</form>
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-default" id="popupModify">수정</button>
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
		
		$("#popupModify").click(function() {
			var checked = $("#use").is(":checked");
			if (checked) {
				$("#f_use").val('Y');
			} else {
				$("#f_use").val('N');
			}
			$("#popupModifyForm").submit();
		});
	});
</script>
