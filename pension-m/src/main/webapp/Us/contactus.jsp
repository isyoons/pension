<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>	
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
<script src="https://maps.google.com/maps/api/js?v=3.exp&region=KR"></script>
<script src="../script/google_map.js"></script>	
<link rel="stylesheet" href="../style/init.css">
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="container-fluid text-center">
		<div class="row content">
			<!-- Sub Menu -->
			<div class="col-sm-2 sidenav">
				<h3>About Us</h3>
				<p>
					<a href="introduce.temp" role="button">Introduce</a>
				</p>
				<p>
					<a href="contactus.temp" class="btn btn-primary btn-lg active">Contact Us</a>
				</p>
			</div>

			<!-- Contents -->
			<div class="col-sm-10 text-left sidecontents">
				<!-- map -->
				<div id="google_map"></div>
				<!-- address -->
				<div class="well">
					<address>
						<strong>오르세펜션</strong><br> 
						경북 경주시 천북면 물천리 684-5번지<br>
						<abbr title="Phone">P:</abbr> 010-4915-7241<br> 
						<abbr title="Email">E:</abbr> pension@temp.pe.kr
					</address>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />

</body>
</html>
