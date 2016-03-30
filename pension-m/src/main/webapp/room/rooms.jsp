<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="../script/room.js"></script>
<link rel="stylesheet" href="../style/rooms.css">
<link rel="stylesheet" href="../style/init.css">

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">

			<c:forEach var="no" begin="1" end="${imgNumber }" varStatus="i">
				<li data-target="#myCarousel" data-slide-to="${no-1}" id=${i.count }></li>
			</c:forEach>


		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<c:forEach var="img" items="${roomImg}">
				<div class="item" id="${img}">
					<img src="../uploadFiles/${img }">
				</div>
			</c:forEach>
		</div>
		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a> <a class="carousel-caption" id="openinfo"><span>${requestScope.roomInfo.roomName}info</span>
		</a>

		<div id="info" align="center" style="text-align: center; color: #FFFFFF;">
			<div class="table">
				<div class="col-xs-11">
					<table class="table table-bordered table-condensed"
						style="background-color: inherit; margin: 2em; color: #FFFFFF">
						<tr>
							<td rowspan="2">유형</td>
							<td colspan="2">인원</td>
							<td colspan="3">비수기</td>
							<td colspan="2">준성수기</td>
							<td colspan="2">성수기</td>
						</tr>
						<tr>
							<td>기준</td>
							<td>최대</td>
							<td>주중</td>
							<td>금요일</td>
							<td>주말</td>
							<td>주중</td>
							<td>주말</td>
							<td>주중</td>
							<td>주말</td>
						</tr>

						<tr>
							<td><c:if test="${requestScope.roomInfo.coupleRoom}">커플룸 </c:if>
								<c:if test="${requestScope.roomInfo.doubleLayer}">복층형</c:if> <c:if
									test="${requestScope.roomInfo.spa}">스파 </c:if></td>
							<td>${requestScope.roomInfo.stdNum}</td>
							<td>${requestScope.roomInfo.maxNum}</td>
							<td>${requestScope.roomInfo.lowSeasonWeekdayPrice}</td>
							<td>${requestScope.roomInfo.lowSeasonFridayPrice}</td>
							<td>${requestScope.roomInfo.lowSeasonWeekendPrice}</td>
							<td>${requestScope.roomInfo.middleSeasonWeekdayPrice}</td>
							<td>${requestScope.roomInfo.middleSeasonWeekendPrice}</td>
							<td>${requestScope.roomInfo.highSeasonWeekdayPrice}</td>
							<td>${requestScope.roomInfo.highSeasonWeekendPrice}</td>

						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<br> <br> <br> <br> <br> <br> <br>

			<div>
				${requestScope.roomInfo.equipment} <br> <br>
				<form action="../reservation/realtime/status_reservation.temp"
					method="get">
					<input type="submit" class="btn btn-info" value="실시간 예약">
				</form>
			</div>
			<br>

			<button type="button" id="infoclose"
				class="btn btn-default pull-right">
				<span class="glyphicon glyphicon-remove"></span> 닫기
			</button>
		</div>

	</div>
	<div id="infoMobile">
		<div class="table-left">
			<table class="table table-bordered table-condensed table-responsive">
				<tr>
					<td rowspan="2">유형</td>
					<td colspan="2">인원</td>
					<td colspan="3">비수기</td>
					<td colspan="2">준성수기</td>
					<td colspan="2">성수기</td>
				</tr>
				<tr>
					<td>기준</td>
					<td>최대</td>
					<td>주중</td>
					<td>금요일</td>
					<td>주말</td>
					<td>주중</td>
					<td>주말</td>
					<td>주중</td>
					<td>주말</td>
				</tr>

				<tr>
					<td><c:if test="${requestScope.roomInfo.coupleRoom}">커플룸 </c:if>
						<c:if test="${requestScope.roomInfo.doubleLayer}">복층형</c:if> <c:if
							test="${requestScope.roomInfo.spa}">스파 </c:if></td>
					<td>${requestScope.roomInfo.stdNum}</td>
					<td>${requestScope.roomInfo.maxNum}</td>
					<td>${requestScope.roomInfo.lowSeasonWeekdayPrice}</td>
					<td>${requestScope.roomInfo.lowSeasonFridayPrice}</td>
					<td>${requestScope.roomInfo.lowSeasonWeekendPrice}</td>
					<td>${requestScope.roomInfo.middleSeasonWeekdayPrice}</td>
					<td>${requestScope.roomInfo.middleSeasonWeekendPrice}</td>
					<td>${requestScope.roomInfo.highSeasonWeekdayPrice}</td>
					<td>${requestScope.roomInfo.highSeasonWeekendPrice}</td>

				</tr>
				</tbody>
			</table>
		</div>
		<div>
			<div style="margin: 2em;">${requestScope.roomInfo.equipment}
			</div>
			<form action="../reservation/realtime/status_reservation.temp"
				method="get">
				<input type="submit" class="btn" value="실시간 예약">
			</form>
		</div>
	</div>
	<div>
		<span>Room</span>&nbsp;&nbsp;
		<c:forEach var="room" items="${roomCodes}">
			<c:choose>
				<c:when test="${room[0]==roomCode }">
					<a href="rooms.temp?roomCode=${room[0] }" role="button"
						class="currentPage">${room[1]}</a>
						&nbsp;
				</c:when>
				<c:otherwise>
					<a href="rooms.temp?roomCode=${room[0] }" role="button">${room[1]}</a>
						&nbsp; 
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<jsp:include page="../footer.jsp" />
	<script>
		$(document).ready(function() {
			$(".item:first").addClass("active");
			$("#1").addClass("active");
		});
	</script>

</body>

</html>