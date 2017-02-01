
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>게시판 관리</h1>
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
										<th>카테고리</th>
										<td colspan="2"><input type="text" name="f_category"></td>
									</tr>
									<tr>
										<th>내용안 이미지 크기</th>
										<td colspan="2"><input type="text"
											name="f_comment_img_width"> ex)600</td>
									</tr>
									<tr>
										<th>게시글 수</th>
										<td colspan="2"><input type="text" name="f_one_page_num">
											한 페이지에 노출될 게시글 수</td>
									</tr>
									<tr>
										<th>아이피표시</th>
										<td colspan="2"><input checked type="radio"
											name="f_ip_view" value="Y">사용<input type="radio"
											value="N">사용안함</td>
									</tr>
									<tr>
										<th>첨부파일 갯수</th>
										<td colspan="2"><input type="number" name="f_upload_num"
											min="0" max="3">숫자만 입력(최대 3개)</td>
									</tr>
									<tr>
										<th>댓글</th>
										<td colspan="2"><input type="radio" name="f_comment_use"
											value="Y">사용<input type="radio" name="f_comment_use"
											checked="checked" value="N">사용안함</td>



									</tr>
									<tr>
										<th>답글</th>
										<td colspan="2"><input type="radio" name="f_reply_use"
											value="Y">사용<input type="radio" name="f_reply_use"
											value="N" checked>사용안함</td>



									</tr>
									<tr>
										<th>첨부파일</th>
										<td colspan="2"><input type="radio" name="f_file_use"
											value="Y">사용 <input type="radio" name="f_file_use"
											value="Y" checked>사용안함</td>


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
										<th>답글 권한</th>
										<td colspan="2"><input type="checkbox" name="f_reply"
											value="N">비회원<input type="checkbox" name="f_reply"
											value="-M-">회원<input type="checkbox" name="f_reply"
											value="--S--" checked>최고관리자</td>
									</tr>
									<tr>
										<th>댓글 쓰기</th>
										<td colspan="2"><input type="checkbox" name="f_comment"
											value="N">비회원<input type="checkbox" name="f_comment"
											value="-M-">회원<input type="checkbox" name="f_comment"
											value="--S--" checked>최고관리자</td>
									</tr>
									<tr>
										<th>댓글 삭제</th>
										<td colspan="2"><input type="checkbox"
											name="f_comment_del" value="N">비회원<input
											type="checkbox" name="f_comment_del" value="-M-">회원<input
											type="checkbox" name="f_comment_del" value="--S--" checked>최고관리자</td>
									</tr>
									<tr>
										<th>게시판 링크 주소</th>
										<td colspan="2"><input type="text" name="f_link"></td>
									</tr>
									<tr>
										<th>상단 내용</th>
										<td><textarea name="f_top_comment"></textarea></td>
										<td><input type="checkbox">HTML</td>
									</tr>
									<tr>
										<th>하단 내용</th>
										<td><textarea name="f_bottom_comment"></textarea></td>
										<td><input type="checkbox">HTML</td>
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


