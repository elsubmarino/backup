
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
		<h1>팝업 관리</h1>
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
					<div class="well text-center">팝업 등록 / 수정하기</div>
				</div>
				<div class="box-body">

					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<tbody>
								<tr>
									<th>팝업 제목</th>
									<td colspan="3"><input type="text" class="form-control"></td>
								</tr>
								<tr>
									<th>사용 여부</th>
									<td colspan="3"><label class="checkbox-inline"><input
											type="checkbox">체크시 팝업 사용</label></td>
								</tr>
								<tr>
									<th>사용 기간</th>
									<td colspan="3"><input type="text" >~<input
										type="text"></td>
								</tr>
								<tr>
									<th>창위치 왼쪽</th>
									<td><input type="text" class="form-control"><label>*
											화면 왼쪽으로부터 px 단위</label>
									</div></td>
									<th>창위치 왼쪽</th>
									<td><input type="text" class="form-control"><label>*
											화면 위로부터 px 단위</label></td>
								</tr>
								<tr>
									<th>창크기 가로</th>
									<td><input type="text" class="form-control"><label>*
											px 단위</label></td>
									<th>창크기 세로</th>
									<td><input type="text" class="form-control"><label>*
											px 단위</label></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3">
										<div class="box box-info">
									
											<!-- /.box-header -->
											<div class="box-body pad">
												<form>
													<textarea class="ckeditor" id="editor1" name="editor1" rows="10" cols="80">
                    </textarea>
												</form>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-12 text-center"><button type="button" class="btn btn-default" id="popupCreate">등록</button>
					<button type="button" class="btn btn-default" id="popupList">목록</button>
					</div>
		
				</div>
			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<!-- CK Editor -->
<%@include file="../include/footer.jsp"%>


