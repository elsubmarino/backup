
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
		<h1>접수 신청 관리</h1>
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">접수 신청 관리</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header" style="padding-bottom: 0;">
					<form class="form-horizontal" id="searchForm" method="GET">
						<div class="form-group col-md-3">
							<label class="col-sm-1 control-label" for="title"
								style="width: 55px; text-align: left; padding-right: 0;">제목</label>
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
					<div class="col-md-2">
						<button type="button" class="btn btn-warning"
							style="margin-bottom: 20px;" id="popupRegister">등록하기</button>
					</div>
					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<colgroup>
								<col width="50px;">
								<col>
								<col width="100px">
								<col width="130px">
								<col width="80px">
								<col width="150px">
								<col width="150px">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>구분</th>
									<th>이름</th>
									<th>휴대번호</th>
									<th>이메일</th>
									<th>등록일</th>
									<th>수정/삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="item">
									<tr style="cursor: pointer"
										data-href="modify${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${item.f_id }">
										<td class="text-center">${item.f_id }</td>
										<td style="text-indent: 5px;">${item.f_type2 }</td>
										<td class="text-center">${item.f_name }</td>
										<td class="text-center">${item.f_hp }</td>
										<td class="text-center">${item.f_email }</td>
										<td class="text-center"><fmt:formatDate
												value="${item.f_wdate  }" pattern="yyyy-MM-dd hh:mm:ss" /></td>
										<td class="text-center">
											<div class="btn-group">
												<a class="btn btn-info"
													href="modify${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${item.f_id }">수정</a>
												<a class="btn btn-info" id="popupDelete"
													href="delete${pageMaker.makeSearch(pageMaker.cri.getPage())}&f_id=${item.f_id }">삭제</a>
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
	$('tr[data-href]').on("click", function() {
		document.location = $(this).data('href');
	});
</script>