
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
			<li><a href="/"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<div class="well text-center">팝업 수정하기</div>
				</div>
				<div class="box-body">
					<form method="POST" id="popupModifyForm">
						<input type="hidden" name="f_use" id="f_use">
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
											name="f_subject" value="${item.f_subject }"></td>
									</tr>
									<tr>
										<th>사용 여부</th>
										<td colspan="3"><label class="checkbox-inline"><input
												id="use" type="checkbox"
												<c:out value="${item.f_use eq 'Y'?'checked=checked':'' }"/>>체크시
												팝업 사용</label></td>
									</tr>
									<tr>
										<th>사용 기간</th>
										<td colspan="3">
											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" name="f_start"
													class="form-control pull-right" value="${item.f_start }">
											</div> ~
											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" class="form-control pull-right"
													value="${item.f_end }" name="f_end">
											</div>
										</td>
									</tr>
									<tr>
										<th>창위치 왼쪽</th>
										<td><input type="text" name="f_w_left"
											class="form-control" value="${item.f_w_left }"><label>*
												화면 왼쪽으로부터 px 단위</label>
											</div></td>
										<th>창위치 왼쪽</th>
										<td><input type="text" name="f_w_top"
											class="form-control" value="${item.f_w_top }"><label>*
												화면 위로부터 px 단위</label></td>
									</tr>
									<tr>
										<th>창크기 가로</th>
										<td><input type="text" name="f_width"
											class="form-control" value="${item.f_width }"><label>*
												px 단위</label></td>
										<th>창크기 세로</th>
										<td><input type="text" name="f_height"
											class="form-control" value="${item.f_height }"><label>*
												px 단위</label></td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3">
											<div class="box box-info">

												<!-- /.box-header -->
												<div class="box-body pad">
													<form>
														<textarea class="ckeditor" id="editor1" name="f_comment"
															rows="10" cols="80">${item.f_comment }
                    </textarea>
													</form>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-default" id="popupModify">수정</button>
						<a class="btn btn-default"
							href="list${pageMaker.makeSearch(pageMaker.cri.getPage()) }">목록</a>
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


<script src="/admin/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<script>
	$(function() {
		$("[name='f_start'], [name='f_end']").datepicker({
			format : 'yyyy-mm-dd',
			autoclose : true
		});
		$("#popupModify").click(function() {
			var checked = $("#use").is(":checked");
			if (checked) {
				$("#f_use").val('Y');
			} else {
				$("#f_use").val('N');
			}
			$("#popupModifyForm").submit();
		});
	});
</script>
