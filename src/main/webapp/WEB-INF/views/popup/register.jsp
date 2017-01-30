
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<script src="/resources/plugins/ckeditor/ckeditor.js"></script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>팝업 관리</h1>
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> 홈</a></li>
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
					<form id="popupCreateForm" method="POST">
						<input type="hidden" name="f_use" id="f_use">
						<div class="col-md-12">
							<table class="table table-bordered table-hover">
								<tbody>
									<tr>
										<th>팝업 제목</th>
										<td colspan="3"><input type="text" class="form-control"
											name="f_subject"></td>
									</tr>
									<tr>
										<th>사용 여부</th>
										<td colspan="3"><label class="checkbox-inline"><input
												type="checkbox" name="use" id="use">체크시 팝업 사용</label></td>
									</tr>
									<tr>
										<th>사용 기간</th>
										<td colspan="3">
											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" name="f_start"
													class="form-control pull-right">
											</div> ~
											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" class="form-control pull-right"
													name="f_end">
											</div>
										</td>
									</tr>
									<tr>
										<th>창위치 왼쪽</th>
										<td><input type="text" class="form-control"
											name="f_w_left"><label>* 화면 왼쪽으로부터 px 단위</label>
											</div></td>
										<th>창위치 왼쪽</th>
										<td><input type="text" class="form-control"
											name="f_w_top"><label>* 화면 위로부터 px 단위</label></td>
									</tr>
									<tr>
										<th>창크기 가로</th>
										<td><input type="text" class="form-control"
											name="f_width"><label>* px 단위</label></td>
										<th>창크기 세로</th>
										<td><input type="text" class="form-control"
											name="f_height"><label>* px 단위</label></td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3">
											<div class="box box-info">

												<!-- /.box-header -->
												<form>

													<div class="box-body pad">
														<textarea class="ckeditor" id="editor1" name="f_comment"
															rows="10" cols="80" name="f_comment">
                    </textarea>
														<script type="text/javascript">
															//<![CDATA[
															CKEDITOR.replace('editor1',{
																  'filebrowserImageUploadUrl':'/popup/fileupload',
											
															});
															
														     CKEDITOR.on('dialogDefinition', function( ev ){
														            var dialogName = ev.data.name;
														            var dialogDefinition = ev.data.definition;
														          
														            switch (dialogName) {
														                case 'image': //Image Properties dialog
														                    //dialogDefinition.removeContents('info');
														                    dialogDefinition.removeContents('Link');
														                    dialogDefinition.removeContents('advanced');
														                    break;
														            }
														     });
															
															//]]>
														</script>
													</div>
												</form>

											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-default" id="popupCreate">등록</button>
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
<!-- CK Editor -->

<%@include file="../include/footer.jsp"%>

<script src="/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<script>
	$(function() {
		$("[name='f_start'], [name='f_end']").datepicker({
			format : 'yyyy-mm-dd',
			autoclose : true
		});

	});
</script>
