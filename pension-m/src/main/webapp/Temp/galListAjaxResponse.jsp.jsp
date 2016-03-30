<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
<c:when test="${empty requestScope.galList}">
	<div class="col-sm-12">
		<div class="well">
			<p class="no">목록의 끝입니다.</p>
		</div>
	</div>
</c:when>
<c:otherwise>
	<c:forEach var="gal" items="${requestScope.galList }">
	
	<div class="col-sm-3">
		<div class="well view-detail2">
			<img src="../../uploadFiles/${gal.uploadImg }" alt="${gal.title }" class="img-responsive" id="${gal.no}">
			<p><span>${gal.title }<br><small>${gal.uploadDate }</small></span></p>
		</div>
	</div>				
	
	</c:forEach>
</c:otherwise>
</c:choose>