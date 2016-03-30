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
<script src="../../script/make_reservation_3.js"></script>

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
									size="2">3단계 : 결제안내</font></b></td>
							<td width="75%" align="left" valign="bottom">8시간 이내에 전액입금을
								완료하여야 예약이 확정되며 입금확인이 안되실 경우에는 자동으로 예약이 취소됩니다.</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<form action="make_reservation_4.temp" method="post" id="make3">
			<table class="table">
				<tr>
					<td bgcolor="#F7F6F6" width="20%" align="center">대표자</td>
					<td bgcolor="white" width="80%" align="left">${i_name }</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" align="center">결제금액</td>
					<td bgcolor="white" width="80%" align="left">${sessionScope.totalPrice }
						원</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" align="center">입금주명</td>
					<td bgcolor="white" width="80%" align="left"><div
							class="col-xs-4">
							<input type="text" maxlength="20" size="20" name="pay_user"
								id="pay_user" class="form-control">
						</div></td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" align="center">연락전화번호</td>
					<td bgcolor="white" width="80%" align="left">${i_phone }</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" align="center">입금계좌</td>
					<td bgcolor="white" width="80%" align="left"><INPUT
						TYPE="hidden" NAME="pay_bank"> 우체국 : 700609-02-109658
						(예금주: 최순자)</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" align="center" valign="top">입금시간안내</td>
					<td bgcolor="white" width="80%" align="left"><font
						color="#990000"><b>※ 2016년 2월 11일 11시 19분 까지 (예약후 8시간
								이내)</b></font><br> ※ 지정된 시간까지 입금되지 않으면 자동으로 예약취소됩니다.<br> ※ 1일전예약
						또는 당일예약일 경우는 예약후 바로 입금하셔야 예약완료가 됩니다.</td>
				</tr>
			</table>

			<table class="table">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<p align="center">
							총 <b><font color='#0000FF'>4단계</font></b>중 <b><font
								color='#FF00FF'>3단계(결제정보입력)</font></b> 입니다.
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p align="center">
							<input type="button" class="btn btn-info" value="다음단계"
								id="btn_resve3">&nbsp;<input type="button"
								class="btn btn-info" value="취소하기" id="cancel">
						</p>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<jsp:include page="../../footer.jsp" />
</body>
</html>
