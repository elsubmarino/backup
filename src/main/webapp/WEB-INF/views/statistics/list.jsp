
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>접속 통계</h1>
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">접속 통계</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<button type="button" class="btn btn-warning">접속 경로</button>
					<buttno type="button" class="btn btn-warning">이동 경로</buttno>
				</div>
				<div class="box-body">
					<div class="col-md-5">
						날짜조건 : <input type="checkbox">일별<input type="checkbox">월별<input
							type="checkbox">년도별
					</div>

					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>해당</th>
								</tr>
							</thead>
							<tr>
								<td>해당</td>
							</tr>
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


