
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>${boardName}</h1>
		<ol class="breadcrumb">
			<li><a href="/admin"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">${boardName}</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">

				<div class="box-body">
					<div class="col-md-12">
						<table class="table  table-hover">
							<tbody>
								<tr>
									<td colspan="6">${item.f_subject }</td>
								</tr>
								<tr>
									<td>글쓴이</td>
									<td></td>
									<td>작성일</td>
									<td><fmt:formatDate value="${item.f_wdate  }"
											pattern="yyyy-MM-dd" /></td>
									<td>조회수</td>
									<td>${item.f_see }</td>
								</tr>
								<tr>
									<td colspan="6">${item.f_comment }</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<div class="box-footer">
					<div id="test" class="col-md-12 text-center">
						<a class="btn btn-default"
							href="list?${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${param.f_id }&mode=modify">수정</a>
							<a class="btn btn-default" id="delete" href="/admin/bbs/delete${pageMaker.makeSearch(pageMaker.cri.getPage()) }&f_id=${param.f_id}&item1=${item1}&item2=${item2}">삭제</a>
							
						<a class="btn btn-default"
							href="list?${pageMaker.makeSearch(pageMaker.cri.getPage()) }">목록</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	$('tr[data-href]').on("click", function() {
		document.location = $(this).data('href');
	});
</script>