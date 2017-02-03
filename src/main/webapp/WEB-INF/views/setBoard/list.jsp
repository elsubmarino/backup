
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>게시판 관리</h1>
		<ol class="breadcrumb">
			<li><a href="/admin"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">시큐리티 서비스 문의</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<form class="form-horizontal" id="searchForm">
						<div class="form-group col-md-3">
							<label class="col-sm-1 control-label" for="title"
								style="width: 80px; text-align: left; padding-right: 0;">게시판명</label>
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
							style="margin-bottom: 20px;" id="setBoardCreate">게시판 추가</button>
					</div>
					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<colgroup>
							<col width="50px;">
								<col>
								<col width="100px">
								<col width="100px">
								<col width="80px">
								<col width="150px">
								<col width="150px">
							</colgroup>

							<thead>
								<tr>
									<th>번호</th>
									<th>게시판명</th>
									<th>스킨</th>
									<th>경로</th>
									<th>첨부파일</th>
									<th>글등록수</th>
									<th>수정/삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="item">
									<tr>
										<td class="text-center">${item.f_id }</td>
										<td class="selectMe" data-href="/admin/setBoard/modify${pageMaker.makeSearch(pageMaker.cri.getPage())}&f_id=${item.f_id}" style="cursor:pointer;text-indent: 5px;">${item.f_board_name }</td>
										<td>${item.f_skin }</td>
										<td><a href="${item.f_link}">${item.f_link }</a></td>
										<td class="text-center">${item.f_file_use }</td>
										<td class="text-center">${item.numOfPosts }</td>
										<td class="text-center">
										<div class="btn-group">
										<a
											href="/admin/setBoard/modify${pageMaker.makeSearch(pageMaker.cri.getPage())}&f_id=${item.f_id}"
											class="btn btn-info" id="setBoardModify">수정</a> <a
											type="button" class="btn btn-info" id="setBoardDelete"
											href="delete${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${item.f_id}">삭제</a>
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
	$('.selectMe[data-href]').on("click", function() {
		document.location = $(this).data('href');
	});
</script>
