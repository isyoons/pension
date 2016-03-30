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
<link rel="stylesheet" href="../../style/init.css">
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="container-fluid text-center">
		<div class="row content">
			<!-- Sub Menu -->
			<div class="col-sm-2 sidenav">
				<h3>About Us</h3>
				<p>
					<a href="introduce.temp" class="btn btn-primary btn-lg active"
						role="button">Introduce</a>
				</p>
				<p>
					<a href="contactus.temp">Contact Us</a>
				</p>
			</div>

			<!-- Contents -->
			<div class="col-sm-10 text-left sidecontents">
				<p class="lead">
					오르세 미술관을 담고픈 오르세펜션
					<br><br>
					아름다운 자연경관을 지닌 경주,<br> 
					그 속에 작은 갤러리가 있는 오르세펜션을 열었습니다.
					<br><br>
					프랑세 오르세 미술관을 담은 오르세펜션은<br> 
					다른 삶과 다른 표현을 지니고 있는 여러 화가들을 테마로<br> 
					작은 갤러리를 룸마다 담았습니다.
					<br><br> 
					앙리 마티스, 폴 고갱, 마르크 샤갈, 빈센트 반 고흐,<br> 
					바실리 칸딘스키, 클로드 모네, 피에르 오그스트 르느와르, 구스타프 크림트 등<br> 
					각 룸마다 그들의 작품세계를 엿보며<br> 
					소중한 분과 잊지 못할 추억을 간직할 수 있습니다.
					<br><br> 
					아름다운 자연과 갤러리가 있는 오르세펜션으로 초대합니다.
				</p>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />

</body>
</html>
