
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>교육과정 관리</h1>
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
					<div class="well text-center">제품 추가</div>
				</div>
				<div class="box-body">
					<div class="col-md-12">
						<table class="table table-bordered table-hover">

							<tbody>
								<tr>
									<th>과목구분</th>
									<td><select><option>과목구분선택</option>
											<option>ff</option></select></td>

								</tr>
								<tr>
									<th>과목코드</th>
									<td><input type="text"></td>
								</tr>
								<tr>
									<th>과목명</th>
									<td><input type="text"></td>

								</tr>
								<tr>
									<th>교육난이도</th>
									<td><select><option>초급</option></select></td>
								</tr>
								<tr>
									<th>교육대상</th>
									<td><textarea></textarea>
								</tr>
								<tr>
									<th>수강형태</th>
									<td><input type="checkbox">개인수강<input
										type="checkbox">단체수강
								</tr>
								<tr>
									<th>교육구분</th>
									<td><input type="checkbox">단기<input
										type="checkbox">주말<input type="checkbox">단기+주말
									</td>
								</tr>
								<tr>
									<th>교육개요</th>
									<td><textarea class="ckeditor" name="editor1" rows="10"
											cols="80">
                    </textarea></td>
								</tr>
								<tr>
									<th>교육내용</th>
									<td><textarea class="ckeditor" id="editor2" name="editor2"
											rows="10" cols="80">
                    </textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-default">등록</button>
						<button type="button" class="btn btn-default">목록</button>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>


