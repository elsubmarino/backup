
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
			<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">교육과정 관리</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<form class="form-horizontal">
						<div class="form-group">
							<select class="col-sm-1 form-control "
								style="width: 250px; text-align: right; padding-left: 0; padding-right: 0; margin-left: 30px;">
								<option>과목구분</option>
							</select> <select class="col-sm-1 form-control "
								style="width: 100px; text-align: right; padding-left: 0; padding-right: 0; margin-left: 5px;">
								<option>과목명</option>
								<option>교육개요</option>
								<option>교육내용</option>

							</select>
							<div class="col-md-2">
								<input type="text" class="form-control" id="title">
							</div>
							<button type="button" class="btn btn-success">검색</button>
							&nbsp;총 : ${count }
						</div>
					</form>
				</div>
				<div class="box-body">
					<div class="col-md-2">
						<button type="button" class="btn btn-warning"
							style="margin-bottom: 20px;" id="educationCreate">등록하기</button>
					</div>
					<div class="col-md-12">
						<table class="table table-bordered table-hover">
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
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>
										<button type="button" class="btn btn-info" id="educationModify">수정</button>
										<button type="button" class="btn btn-info" id="educationDelete">삭제</button>
									</td>

								</tr>
							</tbody>
						</table>
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


