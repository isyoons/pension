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
		<table class="table" align="center">
			<tr>
				<td bgcolor="#EEEDED" align="center" valign="middle" height="50">
					<table border="0" cellpadding="2" cellspacing="0" width="100%"
						align="center">
						<tr>
							<td width="25%" align="center" valign="middle"><b><font
									size="2">4단계 : 예약완료</font></b></td>
							<td width="75%" align="left" valign="bottom">선택하신 정보는 아래와
								같습니다! 확인후 예약정보를 입력해주세요!</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<table class="table" align="center">
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">객실명</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b><font
						color="#FF6600">?</font></b></td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약기간</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b>?</b>
				</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약인원</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b><font
						color="#FF6600">?</font></b></td>
			</tr>
		</table>
		<br>

		<table class="table" align="center">
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약자명</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b><font
						color="#FF6600">?</font></b></td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">연락처</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b>?</b>
				</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">입금주명</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b><font
						color="#FF6600">?</font></b></td>
			</tr>
		</table>
		<br>

		<table class="table" align="center">
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">결제방법</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b><font
						color="#FF6600">?</font></b></td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">결제금액</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b>?</b>
				</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">결제여부</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b><font
						color="#FF6600">?</font></b></td>
			</tr>
		</table>
		<br>

		<table class="table" align="center">
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">도착일시</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b><font
						color="#FF6600">?</font></b></td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">기타사항</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b>?</b>
				</td>
			</tr>
		</table>
		<br>

		<p align="center">
			<input type="button" value="예약취소" width="133" height="51" border="0">
		</p>
	</div>

	<jsp:include page="../../footer.jsp" />
</body>
</html>
