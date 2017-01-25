<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>CoreSecurity | Admin</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap.css?ver=1">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet"
	href="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="/resources/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="/resources/dist/css/main.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body class="hold-transition skin-light-green sidebar-mini">
	<div class="wrapper">

		<header class="main-header">

			<!-- Logo -->
			<a href="/" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>코</b>어</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>코어시큐리티</b></span>
			</a>

			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a> <img
								src="/resources/dist/img/user2-160x160.png" class="user-image"
								alt="User Image"> <span class="hidden-xs">${sessionScope.admin.f_name}</span>
						</a></li>
						<!-- 비밀번호 변경, 로그아웃 -->
						<li><a class="btn btn-success" data-toggle="modal"
							data-target="#passwordChange" style="border: 0;">비밀번호 변경</a></li>
						<li><a class="btn btn-success" href="/logout"
							style="border: 0;">로그아웃</a></li>
						<!-- Control Sidebar Toggle Button -->
						<li><a href="#" data-toggle="control-sidebar"><i
								class="fa fa-gears"></i></a></li>
					</ul>
				</div>

			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="/resources/dist/img/user2-160x160.png"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${sessionScope.admin.f_name}</p>
						<a href="#"><i class="fa fa-circle text-success"></i> 온라인</a>
					</div>
				</div>
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="active treeview"><a href="#" class="contentTitle">
							<i class="fa fa-dashboard"></i> <span>대쉬보드</span>
					</a></li>
					<li class="treeview"><a class="contentTitle"
						href="/popup/list"> <i class="fa fa-files-o"></i> <span>팝업
								관리</span> </span>
					</a></li>
					<li><a href="/setBoard/list" class="contentTitle"> <i
							class="fa fa-edit"></i> <span class="coantentTitle">게시판 관리</span>
							</span>
					</a></li>
					<li class="treeview"><a class="contentTitle"
						href="/category/list"> <i class="fa fa-list"></i> <span>교육과정
								과목구분 관리</span> </span>
					</a></li>
					<li class="treeview"><a class="contentTitle"
						href="/education/list"> <i class="fa fa-list-alt"></i> <span>교육과정
								관리</span> </span>
					</a></li>
					<li class="treeview"><a class="contentTitle"
						href="/statistics/list"> <i class="fa fa-pie-chart"></i> <span>접속
								통계</span> </span>
					</a></li>

				</ul>
				<form method="GET" id="headerForm">
					<input type="hidden" id="contentTitler" />
				</form>

			</section>
			<!-- /.sidebar -->
		</aside>
		<!-- 패스워드 변경 모달 -->
		<div id="passwordChange" role="dialog" class="modal fade" >
			<div class="modal-dialog" style="width:300px;">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">비밀번호 변경</h4>
					</div>
					<div class="modal-body">
						<form method="POST" id="passwordChangeForm">
							<div class="form-group has-feedback">
								<input type="password" class="form-control" id="password1" name="password1"><span
									class="form-control-feedback"><i
									class="glyphicon glyphicon-lock"></i></span>
							</div>
							<div class="form-group has-feedback">
								<input type="password" class="form-control" id="password2" name="password2"><span
									class="form-control-feedback"><i
									class="glyphicon glyphicon-lock"></i></span>
							</div>
							<input type="hidden" name="f_idno" value="${sessionScope.admin.f_idno}"/>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="acceptPasswordChange">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>

			</div>
		</div>