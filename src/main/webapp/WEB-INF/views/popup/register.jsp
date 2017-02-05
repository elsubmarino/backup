
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet"
	href="/admin/resources/dist/css/bootstrap-datepicker3.min.css">
<script src="/admin/resources/plugins/ckeditor/ckeditor.js"></script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>팝업 관리</h1>
		<ol class="breadcrumb">
			<li><a href="/admin"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">팝업 관리</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<div class="well text-center">팝업 등록하기</div>
				</div>
				<div class="box-body">
					<form id="popupCreateForm" method="POST">
						<input type="hidden" name="f_use" id="f_use">
						<input type="hidden" name="f_position" >
						<div class="col-md-12">
							<table class="table table-bordered table-hover">
								<colgroup>
									<col width="150px">
									<col>
									<col width="150px">
								</colgroup>
								<tbody>
									<tr>
										<th>팝업 제목</th>
										<td colspan="3"><input type="text" class="form-control"
											name="f_subject"></td>
									</tr>
									<tr>
										<th>사용 여부</th>
										<td colspan="3"><label class="checkbox-inline"><input
												type="checkbox" name="use" id="use" checked>체크시 팝업 사용</label></td>
									</tr>
									<tr>
										<th>사용 기간</th>
										<td colspan="3"><i class="fa fa-calendar"></i> <input
											type="text" name="f_start"> ~ <i
											class="fa fa-calendar"></i> <input type="text"
											name="f_end"></td>
									</tr>
									<tr>
										<th>창 위치</th>
										<td colspan="3">
										<div class="btn-group">
										<button name="position" type="button" class="btn btn-warning">X</button>
										<button name="position" type="button" class="btn btn-warning">X</button>
										<button name="position" type="button" class="btn btn-warning">X</button><br/>
										<button  name="position"type="button" class="btn btn-warning">X</button>
										<button  name="position"type="button" class="btn btn-warning">X</button>
										<button  name="position"type="button" class="btn btn-warning">X</button><br/>
										<button  name="position"type="button" class="btn btn-warning">X</button>
										<button  name="position"type="button" class="btn btn-warning">X</button>
										<button  name="position"type="button" class="btn btn-warning">X</button>
										</div>
										</tr>
									<tr>
										<th>창크기 가로</th>
										<td><input type="number" class="form-control"
											name="f_width"><label>* px 단위</label></td>
										<th>창크기 세로</th>
										<td><input type="number" class="form-control"
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
															CKEDITOR
																	.replace(
																			'editor1',
																			{
																				'filebrowserImageUploadUrl' : '/admin/popup/fileupload',

																			});

															CKEDITOR
																	.on(
																			'dialogDefinition',
																			function(
																					ev) {
																				var dialogName = ev.data.name;
																				var dialogDefinition = ev.data.definition;

																				switch (dialogName) {
																				case 'image': //Image Properties dialog
																					//dialogDefinition.removeContents('info');
																					dialogDefinition
																							.removeContents('Link');
																					dialogDefinition
																							.removeContents('advanced');
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
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script
	src="/admin/resources/bootstrap-datepicker.js"></script>
<script
	src="/admin/resources/bootstrap-datepicker.kr.js"></script>
<script>
	$(function() {
		var change;
		//버튼 색갈 체인지
		$("[name='position']").click(function(event){
			if(change!=undefined){
				change.removeClass("btn-primary");
				change.addClass("btn-warning");
			}
			event.preventDefault();
			$(this).removeClass("btn-warning");
			$(this).addClass("btn-primary");
			change=$(this);
			$("[name='f_poisition']").val($(this).val());
		})
		
		$("[name='f_start'], [name='f_end']").datepicker({
			format : 'yyyy-mm-dd',
			langauge : "kr",
			autoclose : true
		});

		$("#popupCreate").click(function() {
			var checked = $("#use").is(":checked");
			if (checked) {
				$("#f_use").val('Y');
			} else {
				$("#f_use").val('N');
			}
			var f_subject = $("[name=f_subject]");
			if (!f_subject.val()) {
				alert("팝업 제목을 입력하세요!");
				f_subject.focus();
				return;
			}
			$("#popupCreateForm").submit();
		});

	});
</script>
