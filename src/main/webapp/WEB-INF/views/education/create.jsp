
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
			<li><a href="/admin"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">교육과정 관리</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<div class="well text-center">교육과정 추가</div>
				</div>
				<div class="box-body">
					<form method="POST" id="createForm">
						<div class="col-md-12">
							<table class="table table-bordered table-hover">
							<colgroup>
							<col width="150px">
							</colgroup>
								<tbody>
									<tr>
										<th>과목구분</th>
										<td><select name="f_ca_id"><option>과목구분선택</option>
												<option value="1010">1010</option></select></td>

									</tr>
									<tr>
										<th>과목코드</th>
										<td><input type="text" name="f_code"></td>
									</tr>
									<tr>
										<th>과목명</th>
										<td><input type="text" name="f_subject"></td>

									</tr>
									<tr>
										<th>교육난이도</th>
										<td><select name="f_elevel"><option value="1">초급</option>
										<option value="2">초중급</option>
										<option value="3">중급</option>
										<option value="4">중상급</option>
										<option value="5">상급</option>
										
										</select></td>
									</tr>
									<tr>
										<th>교육대상</th>
										<td><textarea name="f_target"></textarea>
									</tr>
									<tr>
										<th>수강형태</th>
										<td><input type="checkbox" name="f_type1_1" checked value="1">개인수강<input
											type="checkbox" name="f_type2" value="1">단체수강
									</tr>
									<tr>
										<th>교육구분</th>
										<td><input type="radio" name="f_type1_2" checked value="1">단기<input
											type="radio" name="f_type2" value="2">주말<input type="radio" name="f_type2" value="3">단기+주말</td>
									</tr>
									<tr>
										<th>교육개요</th>
										<td><textarea class="ckeditor" id="editor1" name="f_note1" rows="10"
												cols="80">
                    </textarea></td>
									</tr>
									<tr>
										<th>교육내용</th>
										<td><textarea class="ckeditor" id="editor2"
												name="f_note2" rows="10" cols="80">
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
															.replace(
																	'editor2',
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
                    </td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-default" id="educationCreate">등록</button>
						<button type="button" class="btn btn-default" id="educationList">목록</button>
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
		$("#educationCreate").click(function(){
			var f_subject=$("[name=f_subject]");
			if(!f_subject.val()){
				alert("교육명을 입력하셔야 합니다!");
				f_subject.focus();
				return;
			}
			$("#createForm").submit();
		});
	});
</script>
