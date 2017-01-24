
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>교육과정 과목구분 관리</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<div class="well text-center">단위기술교육 하위분류 수정하기</div>
				</div>
				<div class="box-body">
					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<tbody>
								<tr>
									<th>분류코드</th>
									<td><input type="text" readonly="readonly"></td>
								</tr>
								<tr>
									<th>분류명</th>
									<td><input type="text"></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea></textarea></td>
							</tbody>
						</table>
					</div>
					<div class="col-md-12 text-center">
					<button type="button" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default">목록</button>
					</div>
					<div class="col-md-12 text-right">
						<ul class="pagination">
							<li><a href="#">이전</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">이후</a></li>
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


