
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../include/header.jsp"%>
<link rel="stylesheet"
	href="/admin/resources/dist/css/bootstrap-datepicker3.min.css">
<script src="/admin/resources/plugins/ckeditor/ckeditor.js"></script>
<script src="//code.jquery.com/jquery-latest.js"><</script>
<script>
var coords="";

</script>
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
					<div class="well text-center">
					<c:choose>
					<c:when test="${param.mode eq 'modify' }">
					팝업 수정하기
					</c:when>
					<c:otherwise>
					팝업 등록하기
					</c:otherwise>
					</c:choose>
					</div>
				</div>
				<div class="box-body">
					<form id="form" method="POST">
						<input type="hidden" name="f_use" id="f_use"> <input
							type="hidden" name="f_position"> <input type="hidden"
							name="f_width"> <input type="hidden" name="f_height">
						<input type="hidden" name="src"> <input type="hidden"
							name="coords">

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
											name="f_subject"
											<c:if test="${param.mode eq 'modify' }">value="${item.f_subject }"</c:if>></td>
									</tr>
									<tr>
										<th>사용 여부</th>
										<td colspan="3"><label class="checkbox-inline"><input
												type="checkbox" name="use" id="use"
												<c:out value="${item.f_use eq 'N'?'':'checked=checked' }"/>>체크시
												팝업 사용</label></td>
									</tr>
									<tr>
										<th>사용 기간</th>
										<td colspan="3"><i class="fa fa-calendar"></i> <input
											type="text" name="f_start"
											<c:if test="${param.mode eq 'modify' }">value="${item.f_start }"</c:if>>
											~ <i class="fa fa-calendar"></i> <input type="text"
											name="f_end"
											<c:if test="${param.mode eq 'modify' }">value="${item.f_end }"</c:if>></td>
									</tr>
									<tr>
										<th>창 위치</th>
										<td colspan="3">
											<div class="btn-group">
												<button name="position" type="button"
													class="btn btn-warning" value="1">X</button>
												<button name="position" type="button"
													class="btn btn-warning" value="2">X</button>
												<button name="position" type="button"
													class="btn btn-warning" value="3">X</button>
												<br />
												<button name="position" type="button"
													class="btn btn-warning" value="4">X</button>
												<button name="position" type="button"
													class="btn btn-warning" value="5">X</button>
												<button name="position" type="button"
													class="btn btn-warning" value="6">X</button>
												<br />
												<button name="position" type="button"
													class="btn btn-warning" value="7">X</button>
												<button name="position" type="button"
													class="btn btn-warning" value="8">X</button>
												<button name="position" type="button"
													class="btn btn-warning" value="9">X</button>
											</div>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3">
											<form method="POST" id="pictureForm"
												action="/admin/popup/fileupload"
												enctype="multipart/form-data">
												<input type="file" accept="image/*" name="upload">
												<button type="button" class="btn btn-success" id="picture">사진
													전송</button>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
							<div id="rememberMe" hidden></div>
							<c:if test="${param.mode eq 'modify' }">
					


							</c:if>
							<c:if test="${param.mode eq 'modify' }">
					
							<div id='canvas-wrap'><canvas id='pictureMe' width="500px" height="500px;"></canvas><div id='div' hidden><h6 style='color:white'>"+i+"</h6></div></div>
										<c:forEach items="${coordsList }" varStatus="stat" var="item">
									<c:set var="coordsTemp" value="${fn:split(item,',')}" />
									<c:forEach var="s1" items="${coordsTemp }" varStatus="i">
										<c:choose>
											<c:when test="${i.index eq 0 }">
												<c:set var="left" value="${s1 }" />

											</c:when>
											<c:when test="${i.index eq 1 }">
												<c:set var="top" value="${s1 }" />

											</c:when>
											<c:when test="${i.index eq 2 }">
												<c:set var="temp1" value="${s1-left }" />

											</c:when>
											<c:when test="${i.index eq 3 }">
												<c:set var="temp2" value="${s1-top }" />

											</c:when>
										</c:choose>

									</c:forEach>
										<script>

									</script>
								
									<div class='input-group'>
										<span class='input-group-addon'>${stat.index+1 }</span><input
											type="text" name="map" class="form-control"
											value="${hrefList[stat.index] }">
									</div>

									<script>

							coords+="${item}";
							var temp="<div id='div'></div>";
							</script>

								</c:forEach>
							</c:if>


							<div id="test" class="col-md-12 text-center">
								<c:choose>
									<c:when test="${param.mode eq 'create' }">
										<button type="button" class="btn btn-default" id="popupCreate">등록</button>
									</c:when>
									<c:otherwise>
										<input type="hidden" name="f_id" value="${param.f_id }">
										<button type="button" class="btn btn-default" id="popupModify">수정</button>

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

<%@include file="../include/footer.jsp"%>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script src="/admin/resources/bootstrap-datepicker.js"></script>
<script src="/admin/resources/bootstrap-datepicker.kr.js"></script>
<script>
	$(function() {
		
		x1 = 0, y1 = 0, x2 = 0, y2 = 0;
			var i=1;
			var width;
			var height;
			var src;
			
		var filePath="${item.f_comment}";
		var match = filePath.match(/\<img.+src\=(?:\"|\')(.+?)(?:\"|\')(?:.+?)\>/)
		function make_base(filePath) {
			var canvas = document.getElementById("pictureMe");
			context = canvas.getContext("2d");
			base_image = new Image();
			src=filePath;
			base_image.src = src;
			base_image.onload = function() {
				width=base_image.width;
				height=base_image.height;
				canvas.height = height;
				canvas.width = width;
				context.drawImage(base_image, 0, 0);
			}
		}


		
	
		var change;
		//버튼 색갈 체인지
		$("[name='position']").click(function(event) {
			if (change != undefined) {
				change.removeClass("btn-primary");
				change.addClass("btn-warning");
			}
			event.preventDefault();
			$(this).removeClass("btn-warning");
			$(this).addClass("btn-primary");
			change = $(this);
			$("[name='f_position']").val($(this).val());
		});

		
		if(${param.mode eq 'modify'}){
			var f_position=Number("${item.f_position}");
			$("[name=position]").eq(f_position-1).trigger("click");

			make_base(match[1]);
			$("#rememberMe").show();
			$("#canvas").after($("#rememberMe"));
			
			$("#pictureMe").after("<div style='position:absolute;width:200px;height:200px;border:1px solid black'></div>");

		}else{
			$("[name=position]").eq(4).trigger("click");
		}
		


		//사진 올리기
	

		function reCalc() {
			var x3 = Math.min(x1, x2);
			var x4 = Math.max(x1, x2);
			var y3 = Math.min(y1, y2);
			var y4 = Math.max(y1, y2);
			document.getElementById('div').style.left = x3 + 'px';
			document.getElementById('div').style.top = y3 + 'px';
			document.getElementById('div').style.width = x4 - x3 + 'px';
			document.getElementById('div').style.height = y4 - y3 + 'px';
		}
		

		$("#picture").click(function() {
			var formData = new FormData();
			formData.append("upload", $("input[name='upload']")[0].files[0]);
			$.ajax({
				url : '/admin/popup/fileupload',
				data : formData,
				type : 'POST',
				processData : false,
				contentType : false,
				success : function(result) {
					var data = JSON.parse(result);
					alert(data.msg);
					content="<div id='canvas-wrap'><canvas id='pictureMe'></canvas><div id='div' hidden><h6 style='color:white'>"+i+"</h6></div></div>";

					
	
					$("#test").before(content);
					$("#pictureMe").mousedown(function(e) {
						document.getElementById("div").hidden=0;
						x1 = e.offsetX;
						y1 = e.offsetY;
						reCalc();
					});

					$("#pictureMe").mousemove(function(e) {
						x2 = e.offsetX;
						y2 = e.offsetY;
						reCalc();
					});
					$("#pictureMe").mouseup(function(e) {
						var blah=$("#div").clone();
						blah.css("z-index",i)
						blah.html("<h6 style='color:white'>"+i+"</h6>");
						$("#pictureMe").after(blah);
						document.getElementById("div").hidden=1;
						var content="<div class='input-group'><span class='input-group-addon'>"+i+"</span><input type=\"text\" name=\"map\" class=\"form-control\"></div>";
						coords+=x1+","+y1+","+x2+","+y2+"|";
						$("#test").before(content);
						i++;
						
					});
					make_base(data.filePath);

				}

			});
		});

	

		$("[name='f_start'], [name='f_end']").datepicker({
			format : 'yyyy-mm-dd',
			langauge : "kr",
			autoclose : true
		});

		$("#popupCreate").click(function() {
		  if(!checkIt()){
			  return;
		  }
		  $("#form").attr("action","register");
			$("#form").submit();
		});
		
		$("#popupModify").click(function() {
			  if(!checkIt()){
				  return;
			  }
			  $("#form").attr("action","modify");

			$("#form").submit();
		});
		
		function checkIt(){
			var checked = $("#use").is(":checked");
			if (checked) {
				$("#f_use").val('Y');
			} else {
				$("#f_use").val('N');
			}
			var f_subject = $("[name=f_subject]");
			var f_position = $("[name=f_position]");
			if (!f_subject.val()) {
				alert("팝업 제목을 입력하세요!");
				f_subject.focus();
				return false;
			}
			if (!f_position.val()) {
				alert("위치를 선택해주세요!");
				return false;
			}
			$("[name=f_width]").val(width);
			$("[name=f_height]").val(height);
			$("[name=src]").val(src);
			coords=coords.substring(0,coords.length-1);
			$("[name=coords]").val(coords);
			return true;
		}

	});
</script>
