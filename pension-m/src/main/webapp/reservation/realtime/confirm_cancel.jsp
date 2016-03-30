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

<script src="../script/gallery.js"></script>
<script src="../../script/reservation_realtime.js"></script>
<script src="../../script/confirm_cancel.js"></script>

<link rel="stylesheet" href="../../style/init.css">
<link rel="stylesheet" href="../../style/init.css">
</head>
<body bgcolor="white" text="black" link="blue" vlink="purple"
	alink="red" topmargin=0 leftmargin=0>
	<jsp:include page="../../header.jsp" />
	<jsp:include page="../submenu.jsp" />
	<br>
	<br>
	<br>
	<div class="container">

		<form action="delete.temp" method="post" id="delete">
			<c:forEach var="resveRoom" items="${resveRoomList }">
				<table class="table">
					<tr>
						<td bgcolor="#F7F6F6" width="20%" height="40" align="center">객실명</td>
						<td bgcolor="white" width="80%" align="left" height="40">${resveRoom.roomName }</td>
					</tr>
					<tr>
						<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약기간</td>
						<td bgcolor="white" width="80%" align="left" height="40">${resveRoom.stayBeginDay.year + 1900}년
							${resveRoom.stayBeginDay.month + 1}월
							${resveRoom.stayBeginDay.date}일 ~ ${resveRoom.stayEndDay.year + 1900}년
							${resveRoom.stayEndDay.month + 1}월 ${resveRoom.stayEndDay.date}일
							(${resveRoom.resvePd }박 ${resveRoom.resvePd + 1}일)</td>
					</tr>
					<tr>
						<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약인원</td>
						<td bgcolor="white" width="80%" align="left" height="40">${resveRoom.resveNum}명</td>
					</tr>
				</table>
			</c:forEach>
			<br>

			<table class="table">
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약자명</td>
					<td bgcolor="white" width="80%" align="left" height="40">${resveInfoList.resveCtm }</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">연락처</td>
					<td bgcolor="white" width="80%" align="left" height="40">${resveInfoList.phoneNumber }
					</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">입금주명</td>
					<td bgcolor="white" width="80%" align="left" height="40">${resveInfoList.payCtm }</td>
				</tr>
			</table>
			<br>

			<table class="table">
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">결제금액</td>
					<td bgcolor="white" width="80%" align="left" height="40">${resveInfoList.payAmount }
						원</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">결제여부</td>
					<td bgcolor="white" width="80%" align="left" height="40"><b><font
							color="#FF6600">${resveInfoList.isDeposit }</font></b></td>
				</tr>
			</table>
			<br>

			<table class="table">
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">기타사항</td>
					<td bgcolor="white" width="80%" align="left" height="40"><b>${resveInfoList.etc }</b>
					</td>
				</tr>
			</table>
		</form>

		<table class="table">
			<tr>
				<td>
					<p align="center">
						<input type="button" value="예약취소" id="cancel" class="btn btn-info">
					</p>
				</td>
			</tr>
		</table>
	</div>

	<jsp:include page="../../footer.jsp" />
</body>
</html>
