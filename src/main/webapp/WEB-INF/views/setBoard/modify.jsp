<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<form method="POST" id="setBoardModifyForm">

							<table class="table table-bordered table-hover">
								<tbody>
									<tr>
										<th>타입</th>
										<td colspan="2"><select name="f_skin"><option
													id="basic" value="basic">일반게시판</option>
										</select></td>
									</tr>
									<tr>
										<th>게시판명</th>
										<td colspan="2"><input type="text" name="f_board_name"
											value="${item.f_board_name }">
									</tr>
									<tr>
										<th>카테고리</th>
										<td colspan="2"><input type="text" name="f_category"
											value="${item.f_category }"></td>
									</tr>
									<tr>
										<th>내용안 이미지 크기</th>
										<td colspan="2"><input type="text"
											name="f_comment_img_width"
											value="${item.f_comment_img_width }"> ex)600</td>
									</tr>
									<tr>
										<th>게시글 수</th>
										<td colspan="2"><input type="text" name="f_one_page_num"
											value="${item.f_one_page_num }"> 한 페이지에 노출될 게시글 수</td>
									</tr>
									<tr>
										<th>아이피표시</th>
										<td colspan="2"><input checked type="radio"
											name="f_ip_view" value="Y">사용<input name="f_ip_view"
											type="radio" value="N">사용안함</td>
									</tr>
									<tr>
										<th>첨부파일 갯수</th>
										<td colspan="2"><input type="number" name="f_upload_num"
											min="0" max="3" value="${item.f_upload_num }">숫자만
											입력(최대 3개)</td>
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
											value="Y">사용<input type="radio" name="f_file_use"
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
										<td colspan="2"><input type="text" name="f_link"
											value="${item.f_link }"></td>
									</tr>
									<tr>
										<th>상단 내용</th>
										<td><textarea name="f_top_comment">${item.f_top_comment }</textarea></td>
										<td><input type="checkbox">HTML</td>
									</tr>
									<tr>
										<th>하단 내용</th>
										<td><textarea name="f_bottom_comment">${item.f_bottom_comment }</textarea></td>
										<td><input type="checkbox">HTML</td>
									</tr>
								</tbody>

							</table>

						</form>

					</div>
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-default" id="setBoardCreate2">등록</button>
						<a class="btn btn-default"
							href="list${pageMaker.makeSearch(pageMaker.cri.getPage()) }">취소</a>

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
	
		var radio_arrays=new Array();
		radio_arrays['f_ip_view']="${item.f_ip_view}";
		radio_arrays['f_comment_use']="${item.f_comment_use}";
		radio_arrays['f_reply_use']="${item.f_reply_use}";
		radio_arrays['f_file_use']="${item.f_file_use}";
		radio_arrays['f_hidden_use']="${item.f_hidden_use}";
		
		var checkbox_arrays=new Array();
		checkbox_arrays['f_write']="${item.f_write}";
		checkbox_arrays['f_read']="${item.f_read}";
		checkbox_arrays['f_edit']="${item.f_edit}";
		checkbox_arrays['f_delete']="${item.f_delete}";
		checkbox_arrays['f_reply']="${item.f_reply}";
		checkbox_arrays['f_comment']="${item.f_comment}";
		checkbox_arrays['f_comment_del']="${item.f_comment_del}";
		
		if(${item.f_skin eq 'basic'}){
			$("[name='f_skin']").children("#basic").prop("selected",true);
		}
		$("td:has(:radio)").each(function(){
			var name=$(this).children().eq(0).attr("name");
			if(radio_arrays[name]=="Y"){
				$(this).children().eq(0).prop("checked",true);
			}else{
				$(this).children().eq(1).prop("checked",true);
			}
		});
		$("td:has(:checkbox)").each(function(){
			var name=$(this).children().eq(0).attr("name");
			var test=String(checkbox_arrays[name]);
			if(test.indexOf('N')!=-1){
				$(this).children().eq(0).prop("checked",true);
			}
			if(test.indexOf('-M-')!=-1){
				$(this).children().eq(1).prop("checked",true);
			}
			if(test.indexOf('--S--')!=-1){
				$(this).children().eq(2).prop("checked",true);
			}
		});
		
		$("#setBoardCreate2").click(function() {
			$("#setBoardModifyForm").submit();
		});
	});
</script>


