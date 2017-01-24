<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="/resources/plugins/iCheck/square/blue.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="../../index2.html"><b>코어</b>시큐리티</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">관리자 모드로 접근하기 위해 로그인하세요</p>

			<form action="/login" method="post" id="loginForm">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="아이디"
						maxlength="20" id="id" value=""> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" placeholder="패스워드"
						maxlength="20" id="password" value=""> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label> <input type="checkbox" id="checkForId"><small>&nbsp;아이디
									기억</small>
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="button" id="enterLogin"
							class="btn btn-primary btn-block btn-flat">로그인</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 2.2.3 -->
	<script src="/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="/resources/plugins/iCheck/icheck.min.js"></script>
	<script>
		$(function() {
			$("#loginForm #id").focus();
			var id="${id}";
			if(id){
				$("#loginForm #id").val(id);
				$("#loginForm #apssword").focus();
				$("#loginForm #checkForId").prop("checked",true);
			}
			
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
			$("#enterLogin").click(function() {
				var id = $("#id").val();
				var password = $("#password").val();
				var checkForId=$("#checkForId").prop('checked');
				var params = "id=" + id + "&password=" + password+"&checkForId="+checkForId;
				if (!id) {
					alert("아이디를 입력하지 않았습니다!");
					$("#loginForm #id").focus();
					return;
				}
				if (!password) {
					alert("패스워드를 입력하지 않았습니다!");
					$("#loginForm #password").focus();
					return;
				}
				$.ajax({
					url : "/login",
					type : "POST",
					data : params,
					success : function(result) {
						if (result == "fail") {
							alert("이메일 주소 혹은 아이디를 제대로 입력하세요!");
							$("#loginForm #password").val('');
							if(!$("#loginForm #checkForId").is(":checked")){
								$("#loginForm #id").val('');
								$("#loginForm #id").focus();
							}else{
								$("#loginForm #password").focus();
							}
							return;
						} else if (result == "success") {
							location.replace("/");
						}
						
					},
					error : function(request, status, err) {
						alert(request + ' ' + status + ' ' + err);
					}
				})

			});

		});
	</script>
</body>
</html>
