
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
					<div class="well">정보 추가</div>
				</div>
				<div class="box-body">
					<div class="col-md-2">
						<button type="button" class="btn btn-warning"
							style="margin-bottom: 20px;">1단계 분류 추가</button>
					</div>
					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<tbody>
								<tr>
									<th>접수 상태</th>
									<td><input type="checkbox">접수중<input
										type="checkbox">접수 완료</td>
								</tr>
								<tr>
									<th>교육 일정</th>
									<td><input type="text"> ~ <input type="text">
								</tr>
								<tr>
									<th>교육 일수</th>
									<td><input type="text"> 숫자만 입력</td>
								</tr>
								<tr>
									<th>교육 비용</th>
									<td><input type="text"> 숫자만 입력
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>


