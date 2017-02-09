
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet"
	href="/admin/resources/dist/css/bootstrap-datepicker3.min.css">
<script src="/admin/resources/plugins/ckeditor/ckeditor.js"></script>
<script src="//code.jquery.com/jquery-latest.js"><</script>
<!-- Content Wrapper. Contains page content -->
<style>
#div, #div2, #div3, #div4, #div5 {
	border: 1px dotted #000;
	background-color: blue;
	opacity: 0.5;
	position: absolute;
}

#canvas-wrap {
	position: relative
} /* Make this a positioned parent */
</style>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>${boardName }</h1>
		<ol class="breadcrumb">
			<li><a href="/admin"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">${boardName }</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<c:if test="${param.mode eq 'create' }">
						<div class="well text-center">글 등록하기</div>
					</c:if>
					<c:if test="${param.mode eq 'modify' }">
						<div class="well text-center">글 수정하기</div>
					</c:if>
				</div>
				<div class="box-body">
					<form id="form" method="POST">
						<input type="hidden" name="item1" value="${item1 }"> <input
							type="hidden" name="item2" value="${item2 }"> <input
							type="hidden" name="f_bid" value="${item2 }">
						<c:if test="${param.mode eq 'modify'|| param.mode eq 'delete' }">
							<input type="hidden" name="f_id" value="${param.f_id }">
						</c:if>


						<div class="col-md-12">
							<table class="table table-bordered table-hover">
								<colgroup>
									<col width="150px">
									<col>
									<col width="150px">
								</colgroup>
								<tbody>
									<tr>
										<th>제목</th>
										<td colspan="3"><input type="text" class="form-control"
											name="f_subject"
											<c:if test="${param.mode eq 'modify' }">value="${item.f_subject }"</c:if>></td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3">
											<div class="box box-info">

												<!-- /.box-header -->
												<form>

													<div class="box-body pad">
														<textarea class="ckeditor" id="editor1" name="f_comment"
															rows="10" cols="80" name="f_comment"><c:if
																test="${param.mode eq 'modify' }">${item.f_comment }</c:if>
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



							<div id="test" class="col-md-12 text-center">
								<c:choose>
									<c:when test="${param.mode eq 'create' }">
										<button type="button" class="btn btn-default" id="create">등록</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-default" id="modify">수정</button>

									</c:otherwise>
								</c:choose>
								<a class="btn btn-default"
									href="list?${pageMaker.makeSearch(pageMaker.cri.getPage()) }">목록</a>
							</div>
						</div>
					</form>




				</div>

			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<!-- CK Editor -->

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script src="/admin/resources/bootstrap-datepicker.js"></script>
<script src="/admin/resources/bootstrap-datepicker.kr.js"></script>
<script>
	$(function() {
		
	

		
		$("#create").click(function() {
		  if(!checkIt()){
			  return;
		  }
		  $("#form").attr("action","/admin/bbs/create");
			$("#form").submit();
		});
		
		$("#modify").click(function() {
			  if(!checkIt()){
				  return;
			  }
			  $("#form").attr("action","/admin/bbs/modify");

			$("#form").submit();
		});
		
		function checkIt(){
		var f_subject = $("[name=f_subject]");
			var f_comment=$("[name=f_comment]");
			if (!f_subject.val()) {
				alert("제목을 입력하세요!");
				f_subject.focus();
				return false;
			}
			if (!f_comment.val()) {
				alert("내용을 입력해주세요!");
				return false;
			}
		
			return true;
		}

	});
</script>
