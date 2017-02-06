
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<meta charset="UTF-8" />
<link rel='stylesheet'
	href='/admin/resources/bootstrap/css/bootstrap.min.css' />
<script type='text/javascript' src='//code.jquery.com/jquery-latest.js'></script>
<h3>${item.f_subject }</h3>
<ul class='list-group'>
	<li class='list-group-item'>
		<div class='progress'>
			<div class='progress-bar' role='progressbar' aria-value='70'
				aria-valuemin='0' aria-valuemax='100' style='width: 70%'></div>
		</div>
	</li>
</ul>
</html>
