
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<script src="/admin/resources/plugins/ckeditor/ckeditor.js"></script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>게시판 관리</h1>
		<ol class="breadcrumb">
			<li><a href="/admin"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">게시판 관리</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header">
					<div class="well text-center">게시판 추가</div>
				</div>
				<div class="box-body">
					<div class="col-md-12">
						<form method="POST" id="setBoardCreateForm">

							<table class="table table-bordered table-hover">
							<colgroup>
							<col width="200px">
							</colgroup>
								<tbody>
									<tr>
										<th>타입</th>
										<td colspan="2"><select name="f_skin"><option
													value="basic">일반게시판</option>
										</select></td>
									</tr>
									<tr>
										<th>게시판명</th>
										<td colspan="2"><input type="text" name="f_board_name">
									</tr>
									<tr>
										<th>비공개</th>
										<td colspan="2"><input type="radio" name="f_hidden_use"
											value="Y">사용<input type="radio" name="f_hidden_use"
											value="N" checked>사용안함</td>

									</tr>
									<tr>
										<th>글쓰기 권한</th>
										<td colspan="2"><input type="checkbox" name="f_write"
											value="N">비회원<input type="checkbox" name="f_write"
											value="-M-">회원<input type="checkbox" name="f_write"
											value="--S--" checked>최고관리자</td>
									</tr>
									<tr>
										<th>읽기 권한</th>
										<td colspan="2"><input type="checkbox" name="f_read"
											value="N">비회원<input type="checkbox" name="f_read"
											value="-M-">회원<input type="checkbox" name="f_read"
											value="--S--" checked>최고관리자</td>
									</tr>
									<tr>
										<th>수정 권한</th>
										<td colspan="2"><input type="checkbox" name="f_edit"
											value="N">비회원<input type="checkbox" name="f_edit"
											value="-M-">회원<input type="checkbox" name="f_edit"
											value="--S--" checked>최고관리자</td>
									</tr>
									<tr>
										<th>삭제 권한</th>
										<td colspan="2"><input type="checkbox" name="f_delete"
											value="N">비회원<input type="checkbox" name="f_delete"
											value="-M-">회원<input type="checkbox" name="f_delete"
											value="--S--" checked>최고관리자</td>
									</tr>
									<tr>
										<th>카테고리</th>
										<td colspan="2">
										<select name="f_link">
										<option value="sub01">sub01</option>
										<option value="sub03">sub03</option>
										</select>
										</td>
									</tr>
								</tbody>

							</table>

						</form>

					</div>
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-default" id="setBoardCreate2">등록</button>
						<button type="button" class="btn btn-default" id="setBoardCancel">취소</button>

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
	$(function() {
		$("#setBoardCreate2").click(function() {
			var f_board_name = $("[name=f_board_name]");
			if (!f_board_name.val()) {
				alert("게시판 명을 입력하셔야 합니다!");
				f_board_name.focus();
				return;
			}
			$("#setBoardCreateForm").submit();
		});
	});
</script>


