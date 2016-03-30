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
<script src="../../script/make_reservation_4.js"></script>

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
		<table class="table">
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

		<form action="add.temp" method="post" id="make4">
			<c:forEach var="resveInfo" items="${sessionScope.resveInfo }">
				<table class="table">
					<tr>
						<td bgcolor="#F7F6F6" width="20%" height="40" align="center">객실명</td>
						<td bgcolor="white" width="80%" align="left" height="40">${resveInfo.roomName }</td>
					</tr>
					<tr>
						<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약기간</td>
						<td bgcolor="white" width="80%" align="left" height="40">${sessionScope.beginDate.year + 1900}년
							${sessionScope.beginDate.month + 1}월
							${sessionScope.beginDate.date}일 ~ ${sessionScope.endDate.year + 1900}년
							${sessionScope.endDate.month + 1}월 ${sessionScope.endDate.date}일
							(${sessionScope.sPeriod }박 ${sessionScope.sPeriod + 1}일)</td>
					</tr>
					<tr>
						<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약인원</td>
						<td bgcolor="white" width="80%" align="left" height="40">${resveInfo.stdNum + resveInfo.count}명</td>
					</tr>
				</table>
			</c:forEach>
			<br>

			<table class="table">
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약자명</td>
					<td bgcolor="white" width="80%" align="left" height="40">${sessionScope.i_name }</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">연락처</td>
					<td bgcolor="white" width="80%" align="left" height="40">${sessionScope.i_phone }
					</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">입금주명</td>
					<td bgcolor="white" width="80%" align="left" height="40">${pay_user }</td>
				</tr>
			</table>
			<br>

			<table class="table">
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">결제금액</td>
					<td bgcolor="white" width="80%" align="left" height="40">${sessionScope.totalPrice }
						원</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">결제여부</td>
					<td bgcolor="white" width="80%" align="left" height="40"><b><font
							color="#FF6600">결제대기</font></b></td>
				</tr>
			</table>
			<br>

			<table class="table">
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">기타사항</td>
					<td bgcolor="white" width="80%" align="left" height="40"><b>${sessionScope.etc }</b>
					</td>
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
								color='#FF00FF'>4단계(예약완료)</font></b> 입니다.
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p align="center">
							<input type="button" value="예약완료" id="btn_resve4"
								class="btn btn-info">&nbsp;<input type="button"
								value="예약취소" id="cancel" class="btn btn-info">
						</p>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script>
		$("#btn_resve4").click(function() {
			var result = confirm('예약 하시겠습니까?');

			if (result) {
				// yes
				$("#make4").submit();
				alert('예약이 완료 되었습니다 !');
			} else {
				// no
			}
		});
	</script>

	<jsp:include page="../../footer.jsp" />
</body>
</html>
