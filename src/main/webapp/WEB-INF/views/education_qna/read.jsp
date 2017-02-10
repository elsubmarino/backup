
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
		<h1>팝업 관리</h1>
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
										<th>소속</th>
										<td>${item.f_company }</td>
									</tr>
									<tr>
										<th>직무분야</th>
										<td>${item.f_duty }</td>
										<th>보유경력</th>
										<td>${item.f_career }</td>
									</tr>
									
									<tr>
										<th>직급</th>
										<td>${item.f_position }
											</td>
											<th>연락처</th>
											<td>${item.f_hp }</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>${item.f_email}</td>
									</tr>
									<tr>
										<th>유형</th>
										<td>${item.f_type }
											</td>
									</tr>
									<tr>
										<th>희망교육과정</th>
										<td>
											</td>
									</tr>
									<tr>
										<th>신청서구분</th>
										<td>${item.f_gubun }
										</td>
									</tr>
														<tr>
										<th>결제방법</th>
										<td>
											${item.f_pay_type }</td>
									</tr>
														<tr>
										<th>세금계산서</th>
										<td>${item.f_tax }
											</td>
									</tr>
														<tr>
										<th>내용</th>
										<td>
											${item.f_comment }</td>
									</tr>
														<tr>
										<th>등록일</th>
										<td>
										<fmt:formatDate pattern="yyyy-mm-dd hh:mm:ss" value="${item.f_wdate }"/>
											</td>
									</tr>
									
									
									<tr>
										<th>내용</th>
										<td colspan="3">
											
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
