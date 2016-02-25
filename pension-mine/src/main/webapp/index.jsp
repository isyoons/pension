<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
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
	<jsp:include page="/header.jsp"/>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img
					src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg"
					alt="사진 타이틀">
				<div class="carousel-caption">
					<h3>사진 타이틀</h3>
					<p>사진 내용</p>
				</div>
			</div>

			<div class="item">
				<img
					src="http://thepensions.kr/data/files/2013/11/13/1384333555912ac5041f2470d.jpg"
					alt="사진 타이틀">
				<div class="carousel-caption">
					<h3>사진 타이틀</h3>
					<p>사진 내용</p>
				</div>
			</div>

			<div class="item">
				<img
					src="http://res.heraldm.com/content/image/2014/07/07/20140707001195_0.jpg"
					alt="사진 타이틀">
				<div class="carousel-caption">
					<h3>사진 타이틀</h3>
					<p>사진 내용</p>
				</div>
			</div>
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

	<jsp:include page="/footer.jsp"/>

</body>
</html>
