
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
		<h1>상담 요청 분야</h1>
		<ol class="breadcrumb">
			<li><a href="/admin"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">상담 요청 분야</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header" style="padding-bottom: 0;">
					
					<div id="count">&nbsp;총 : ${pageMaker.totalCount } 개</div>

				</div>
				<div class="box-body">
					<div class="col-md-2">
						<button type="button" class="btn btn-warning"
							style="margin-bottom: 20px;" id="register">등록하기</button>
					</div>
					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<colgroup>
								<col width="50px;">
								<col>
								<col width="50px">
								<col width="140px">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>순서</th>
									<th>수정/삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="item">
									<tr style="cursor:pointer" data-href="modify${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${popup.f_id }">
										<td class="text-center">${item.f_id }</td>
										<td style="text-indent: 5px;">${item.f_subject }</td>
										<td class="text-center">${item.f_sort }</td>
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
	$(function(){
		$('tr[data-href]').on("click", function() {
			document.location = $(this).data('href');
		});
		
		$("#register").click(function(){
			self.location="create${pageMaker.makeSearch(pageMaker.cri.getPage())}";
		});
	});

</script>