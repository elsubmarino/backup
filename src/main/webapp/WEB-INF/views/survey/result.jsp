
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
	<c:forEach items="${list}" var="itm">
			<div class='progress'>
				<div class='progress-bar' role='progressbar' aria-value=<fmt:formatNumber value="${itm.f_count/item.allCount*100 }" maxFractionDigits="0" />
					aria-valuemin='0' aria-valuemax='100' style='width: <fmt:formatNumber type="percent" value="${itm.f_count/item.allCount}"/>'><fmt:formatNumber value='${itm.f_count/item.allCount*100 }' maxFractionDigits='0'/>%</div><span class="progress-completed text-right">${itm.f_item }</span>
			</div>
		</c:forEach>
</ul>
</html>