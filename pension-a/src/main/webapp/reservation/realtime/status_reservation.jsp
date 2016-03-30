<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script src="../../script/reservation_realtime.js"></script>
<link rel="stylesheet" href="../../style/init.css">
<link rel="stylesheet" href="../../style/calendar.css">
<link rel="stylesheet" href="../../style/reservation.css">
</head>
<body>
	<jsp:include page="../../header.jsp" />
	<jsp:include page="../submenu.jsp" />
	<br>
	<font style="text-align: center;"><h2>예약현황</h2>
		<h1>${year }년${month }월</h1></font>
	<br>
	<form action="status_reservation.temp" method="post"
		id="statusCalendar" class="form-inline">
		<div align="right" style="margin-right: 3em;">
			<input type="text" value="${year}" id="myyear" name="sYear"
				class="form-control" style="text-align: right;">년&nbsp;&nbsp;&nbsp;<input
				type="text" value="${month }" id="mymonth" name="sMonth"
				class="form-control" style="text-align: right;">월&nbsp;&nbsp;&nbsp;<input
				type="submit" value="보기" class="btn btn-info">
		</div>

		<div style="margin: 3em;">
			<table class="table table-striped table-hover table-bordered">
				<!-- 줄무늬, 마우스위치, 선있는 테이블 -->

				<tr align="center">
					<td><font color="red">일</font></td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td><font color="blue">토</font></td>
				</tr>
				<c:set var="newLine" value="0" />
				<c:set var="listIndex" value="0" />
				<tr align="right">
					<c:forEach var="i" begin="1" end="${index-1}" step="1">
						<td></td>
						<c:set var="newLine" value="${newLine+1}" />
					</c:forEach>
					<c:forEach var="no" begin="1" end="${maxdate}" step="1">
						<td class='td-btn col13' id='${no}'>${no}<br> <c:if
								test="${roomCodeNum!=0}">
								<c:forEach begin="0" end="${roomCodeNum-1}" var="num">
									<c:if test="${output<=no }">
										<c:set var="noooo" value="a${no }"></c:set>
										<c:choose>
											<c:when test="${resveStatusList[num][noooo]==null }">
												<span class="dayRoomCode mOver"
													id="${no}${roomCodeList[num][0] }">${roomCodeList[num][1]}</span>
												<font color="#1DDB16">&nbsp;예약 가능</font>
											</c:when>
											<c:when test="${resveStatusList[num][noooo]==1 }">
												<span class="dayRoomCode" id="${no}${roomCodeList[num][0] }">${roomCodeList[num][1]}</span>
												<font color="#FF6600">&nbsp;예약 대기</font>
											</c:when>
											<c:when test="${resveStatusList[num][noooo]==2 }">
												<span class="dayRoomCode" id="${no}${roomCodeList[num][0] }">${roomCodeList[num][1]}</span>
												<font color="#FF0000">&nbsp;예약 중</font>
											</c:when>
										</c:choose>
										<br>
									</c:if>
								</c:forEach>
							</c:if>
						</td>
						<c:set var="newLine" value="${newLine+1}" />
						<c:if test="${newLine eq 7}">
				</tr>
				<tr align="right">
					<c:set var="newLine" value="0" />
					</c:if>
					</c:forEach>
					<c:forEach begin="${newLine}" end="6" step="1">
						<td></td>
					</c:forEach>
			</table>
		</div>
	</form>
	<jsp:include page="../../footer.jsp" />

</body>
</html>
