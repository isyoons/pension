<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Welcome Temp.pe.kr</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="style/init.css">
</head>
<body>
	<jsp:include page="/header.jsp" />

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<c:choose>
				<c:when test="${empty requestScope.galList }">

					<div class="item">
						<img
							src="http://img.einet.kr/P201602692/landscape/1.jpg"
							alt="더펜션">
						<div class="carousel-caption">
							<h3>샘플 이미지</h3>
							<p>미안합니다.</p>
						</div>
					</div>

				</c:when>
				<c:otherwise>

					<c:forEach var="gal" items="${requestScope.galList }"
						varStatus="status">

						<div class="item">
							<img src="uploadFiles/${gal.uploadImg }" alt="${gal.title }">
							<div class="carousel-caption">
								<h3>${gal.title }</h3>
								<p>${gal.contents }</p>
							</div>
						</div>

					</c:forEach>

				</c:otherwise>

			</c:choose>

		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<jsp:include page="/footer.jsp" />
	<script>
		$(document).ready(function() {
			$(".item:first").addClass("active");
		});
	</script>
</body>
</html>
