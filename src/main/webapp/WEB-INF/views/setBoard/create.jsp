
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
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">

			<div class="box">
				<div class="box-header"></div>
				<div class="box-body">
					<div class="well text-center">게시판 추가</div>
					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<tbody>
								<tr>
									<th>타입</th>
									<td colspan="2"><select name=""><option>일반게시판</option>
											<option>포토게시판</option>
									</select></td>
								</tr>
								<tr>
									<th>게시판명</th>
									<td colspan="2"><input type="text">
								</tr>
								<tr>
									<th>카테고리</th>
									<td colspan="2"><input type="text"></td>
								</tr>
								<tr>
									<th>내용안 이미지 크기</th>
									<td colspan="2"><input type="text"> ex)600</td>
								</tr>
								<tr>
									<th>게시글 수</th>
									<td colspan="2"><input type="text"> 한 페이지에 노출될 게시글
										수</td>
								</tr>
								<tr>
									<th>아이피표시</th>
									<td colspan="2"><input type="radio">사용<input
										type="radio">사용안함</td>
								</tr>
								<tr>
									<th>첨부파일 갯수</th>
									<td colspan="2"><input type="text">숫자만 입력(최대 3개)</td>
								</tr>
								<tr>
									<th>댓글</th>
									<td colspan="2"><input type="radio">사용<input
										type="radio">사용안함</td>



								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="2"><input type="radio">사용<input
										type="radio">사용안함</td>


								</tr>
								<tr>
									<th>비공개</th>
									<td colspan="2"><input type="radio">사용<input
										type="radio">사용안함</td>

								</tr>
								<tr>
									<th>글쓰기 권한</th>
									<td colspan="2"><input type="checkbox">비회원<input
										type="checkbox">회원<input type="radio">최고관리자</td>
								</tr>
								<tr>
									<th>읽기 권한</th>
									<td colspan="2"><input type="checkbox">비회원<input
										type="checkbox">회원<input type="radio">최고관리자</td>
								</tr>
								<tr>
									<th>수정 권한</th>
									<td colspan="2"><input type="checkbox">비회원<input
										type="checkbox">회원<input type="radio">최고관리자</td>
								</tr>
								<tr>
									<th>삭제 권한</th>
									<td colspan="2"><input type="checkbox">비회원<input
										type="checkbox">회원<input type="radio">최고관리자</td>
								</tr>
								<tr>
									<th>답글 권한</th>
									<td colspan="2"><input type="checkbox">비회원<input
										type="checkbox">회원<input type="radio">최고관리자</td>
								</tr>
								<tr>
									<th>댓글 쓰기</th>
									<td colspan="2"><input type="checkbox">비회원<input
										type="checkbox">회원<input type="radio">최고관리자</td>
								</tr>
								<tr>
									<th>댓글 삭제</th>
									<td colspan="2"><input type="checkbox">비회원<input
										type="checkbox">회원<input type="radio">최고관리자</td>
								</tr>
								<tr>
									<th>게시판 링크 주소</th>
									<td colspan="2"><input type="text"></td>
								</tr>
								<tr>
									<th>상단 내용</th>
									<td><textarea></textarea></td>
									<td><input type="checkbox">HTML</td>
								</tr>
								<tr>
									<th>하단 내용</th>
									<td><textarea></textarea></td>
									<td><input type="checkbox">HTML</td>
							</tbody>

						</table>

					</div>
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-default" id="setBoardCreate">등록</button>
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


