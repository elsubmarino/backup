
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>교육과정 관리</h1>
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">교육과정 관리</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<form class="form-horizontal" id="searchForm">
						<div class="form-group">
							<select class="col-sm-1 form-control "
								style="width: 250px; text-align: right; padding-left: 0; padding-right: 0; margin-left: 30px; border-right: 0;">
								<option>과목구분</option>
							</select> <select name="searchType" class="col-sm-1 form-control "
								style="width: 100px; text-align: right; padding-left: 0; padding-right: 0; border-right: 0;">
								<option value="f_subject">과목명</option>
								<option value="f_note1">교육개요</option>
								<option value="f_note2">교육내용</option>

							</select>
							<div class="form-group col-md-3">
								<div class="input-group">
									<input type="text" class="form-control" id="title"
										name="keyword">
									<div class="input-group-btn">
										<button type="button" class="btn btn-success" id="search">검색</button>
									</div>
								</div>
							</div>
							<div id="count">&nbsp;총 : ${pageMaker.totalCount } 개</div>

						</div>
					</form>

				</div>
				<div class="box-body">
					<div class="col-md-2">
						<a class="btn btn-warning" style="margin-bottom: 20px;"
							href="create${pageMaker.makeSearch(pageMaker.cri.getPage()) }">등록하기</a>
					</div>
					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<colgroup>
								<col width="50px">
								<col width="80px">
								<col width="100px">
								<col width="300px">
								<col>
								<col>
								<col>
								<col>
								<col>
								<col width="130px">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>과목구분</th>
									<th>과목코드</th>
									<th>교육과목명</th>
									<th>교육일수</th>
									<th>교육비용</th>
									<th>교육일정</th>
									<th>접수상태</th>
									<th>정보관리</th>
									<th>수정/삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="item">
									<tr data-href="modify${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${item.f_id}" style="cursor:pointer">
										<td class="text-center">${item.f_id }</td>
										<td></td>
										<td>${item.f_code }</td>
										<td>${item.f_subject }</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td class="text-center">
										<div class="btn-group">
										<a class="btn btn-info"
											id="educationModify"
											href="modify${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${item.f_id}">수정</a>
											<a class="btn btn-info" id="educationDelete"
											href="delete${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${item.f_id}">삭제</a>
											</div>
										</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="col-md-12 text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev }">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage -1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':'' }"/>>
									<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage+1) }">&raquo;</a></li>
							</c:if>
						</ul>
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
		$("tr[data-href]").on("click", function() {
			document.location = $(this).data('href');
		});
	});
</script>
