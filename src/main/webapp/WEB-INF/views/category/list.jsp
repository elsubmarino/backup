
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
					<form class="form-horizontal" id="searchForm">
						<div class="form-group col-md-3">
							<label class="col-sm-1 control-label" for="title"
								style="width: 70px; text-align: left; padding-right: 0;">분류명</label>
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
						<a class="btn btn-warning" style="margin-bottom: 20px;"
							href="list${pageMaker.makeSearch(pageMaker.cri.getPage()) }&mode=create">1단계
							분류 추가</a>
					</div>
					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<colgroup>
								<col width="100px">
								<col>
								<col width="200px">
							</colgroup>
							<thead>
								<tr>
									<th>분류 코드</th>
									<th>분류명</th>
									<th>추가/수정/삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="item">

									<tr
										data-href="list${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${item.f_id}&mode=modify"
										style="cursor: pointer">
										<td class="text-center">${item.f_ca_id }</td>
										<td style="text-indent: 5px;"><c:if
												test="${fn:length(item.f_ca_id)>3}">
												<c:forEach begin="1" end="${fn:length(item.f_ca_id) }">
												&nbsp;
												</c:forEach>
												<img src="/admin/resources/dist/img/icon_catlevel.gif">
											</c:if>${item.f_ca_name }</td>
										<td class="text-center">
										<div class="btn-group">
										<a class="btn btn-info"
											href="list${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_ca_id=${item.f_ca_id}&mode=create">
												추가</a> <a type="button" class="btn btn-info" id="categoryModify"
											href="list${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${item.f_id}&mode=modify">수정</a>
											<a class="btn btn-info" id="categoryDelete"
											href="delete${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${item.f_id }">삭제</a>
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
	$(function() {
		$("tr[data-href]").on("click", function() {
			document.location = $(this).data('href');
		});
	});
</script>

