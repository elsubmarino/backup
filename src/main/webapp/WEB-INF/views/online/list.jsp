
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
		<h1>수강 신청 관리</h1>
		<ol class="breadcrumb">
			<li><a href="/admin"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">수강 신청 관리</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header" style="padding-bottom: 0;">
					<form class="form-horizontal" id="searchForm" method="GET">
						<select class="col-sm-1 form-control "
								style="width: 250px; text-align: right; padding-left: 0; padding-right: 0; margin-left: 30px; border-right: 0;">
								<option>과목구분</option>
								<c:forEach items="${categoryNames }" var="item">
								<option value="${item.f_ca_id }">${item.f_ca_name }</option>
								</c:forEach>
							</select>
							
							 <select name="searchType" class="col-sm-1 form-control "
								style="width: 100px; text-align: right; padding-left: 0; padding-right: 0; border-right: 0;">
								<option value="f_name">이름</option>
								<option value="f_sosok">소속</option>

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

					</form>
					<div id="count">&nbsp;총 : ${pageMaker.totalCount } 개</div>

				</div>
				<div class="box-body">
					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<colgroup>
								<col width="300px;">
								<col>
								<col width="100px">
								<col width="100px">
								<col width="80px">
								<col width="150px">
							</colgroup>
							<thead>
								<tr>
									<th>교육 구분</th>
									<th>교육 과목명</th>
									<th>교육 일정</th>
									<th>이름</th>
									<th>소속</th>
									<th>이동 전화</th>
									<th>신청일</th>
									<th>인쇄/수정/삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="item">
									<tr style="cursor: pointer"
										data-href="list${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${item.f_id }&mode=modify">
										<td class="text-center">${item.f_ca_name }</td>
										<td style="text-indent: 5px;">${item.f_subject }</td>
										<td class="text-center"></td>
										<td class="text-center">${item.f_name }</td>
										<td class="text-center">${item.f_sosok }</td>
										<td class="text-center">${item.f_hp }</td>
										<td class="text-center"><fmt:formatDate
												value="${item.f_wdate  }" pattern="yyyy-MM-dd hh:mm:ss" />
										</td>
										<td class="text-center">
											<div class="btn-group">
												<a class="btn btn-info">인쇄</a>
												<a class="btn btn-info"
													href="list${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${item.f_id }&mode=modify">수정</a>
												<a class="btn btn-info" id="popupDelete"
													href="delete${pageMaker.makeSearch(pageMaker.cri.getPage())}&f_id=${item.f_id }">삭제</a>
											</div>
										</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
							<c:if test="${pageMaker.totalCount eq 0 }">
							<div class="col-md-12 text-center">등록된 자료가 없습니다.</div>
						</c:if>
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
	$('tr[data-href]').on("click", function() {
		document.location = $(this).data('href');
	});
</script>