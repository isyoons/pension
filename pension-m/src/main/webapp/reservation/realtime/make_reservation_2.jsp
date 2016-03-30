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
<script src="../../script/make_reservation_2.js"></script>

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
				<td bgcolor="#EEEDED" align="center" valign="middle" height="60"
					width="599">
					<table border="0" cellpadding="2" cellspacing="0" width="100%"
						align="center">
						<tr>
							<td width="25%" align="center" valign="middle"><b><font
									size="2">2단계 : 예약정보입력</font></b></td>
							<td width="75%" align="left" valign="bottom">선택하신 정보는 아래와
								같습니다! 확인후 예약정보를 입력해주세요!</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<c:set var="count" value="0"></c:set>
		<c:forEach var="resve" items="${resveInfo }">
			<table class="table">
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">
						<p align="center">객실명</p>
					</td>
					<td bgcolor="white" width="80%" align="left">
						<p>${resve.roomName}</p>
					</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">
						<p align="center">예약인원</p>
					</td>
					<td bgcolor="white" width="80%" align="left">
						<p>${resve.stdNum + resve.count}명</p>
					</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%">
						<p align="center">금액</p>
					</td>
					<td><c:forEach var="price" items="${resve.dayPrice }">
							${price.ymd.year+1900}년 ${price.ymd.month+1 }월 ${price.ymd.date }일 ( ${price.season }
							${price.date } )  요금 : ${price.roomPrice } 원
								<br>
						</c:forEach> <br> 합계액 : <font color="#FF6633"><b></b>${resve.roomTotalPrice }
							원</font></td>
				</tr>
			</table>
			<br>
			<c:set var="count" value="${count+1 }"></c:set>

		</c:forEach>

		<table class="table">
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">객실선택</td>
				<td><c:forEach var="resve" items="${resveInfo }">	
					${resve.roomName}<br>
					</c:forEach>(총 ${count }실)</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약기간</td>
				<td>${sessionScope.beginDate.year + 1900}년
					${sessionScope.beginDate.month + 1}월
					${sessionScope.beginDate.date}일 ~ ${sessionScope.endDate.year + 1900}년
					${sessionScope.endDate.month + 1}월 ${sessionScope.endDate.date}일
					(${sPeriod }박 ${sPeriod+1 }일)</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약인원</td>
				<td>총 ${totalNum }명 (추가인원 : ${totalCount }명)</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">부가서비스</td>
				<td>※ 그릴서비스 : ${addService} SET x 15,000원 = ${addService * 15000}원<br>합계액
					: <font color="#FF6633"><b>${addService * 15000} </b>원</font><br>
				</td>
			</tr>
		</table>

		<table class="table">
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">총
					결제액</td>
				<td><b><font color="#FF6600">${totalPrice } 원</font></b></td>
			</tr>
		</table>

		<p>
			<font color="#ff0000">*항목은 필수사항으로 입력하셔야 합니다.</font>
		</p>

		<form action="make_reservation_3.temp" method="post" id="make2">
			<table class="table">
				<tr>

					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">대표자<font
						color="#ff0000"><b>*</b></font></td>
					<td><div class="col-xs-4">
							<input
								style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: white"
								class="form-control" type="text" maxlength="20" size="20"
								name="i_name" id="i_name">
						</div> &nbsp;필히 대표자명을 입력</td>
				</tr>
				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">대표연락처<font
						color="#ff0000"><b>*</b></font></td>
					<td><div class="col-xs-4">
							<input
								style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: white"
								type="text" maxlength="20" size="20" name="i_phone" id="i_phone"
								class="form-control">
						</div> &nbsp;연락사항을 &nbsp;받으실 대표연락처 입력</td>
				</tr>

				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center"><font
						color="red">예약불가사항</font></td>
					<td><font color="red"><b>주민등록상 1998년 1월 1일 이후 출생자는
								예약이 불가능합니다.<br>적발시 바로 환불없이 퇴실조치합니다.
						</b></font></td>
				</tr>

				<tr>
					<td bgcolor="#F7F6F6" width="20%" height="40" align="center">입금은행선택</td>
					<td>국민 : 623421 - 04 - 472363<br>예금주 : 박민수
					</td>
				</tr>

				<tr>
					<td bgcolor="#F7F6F6" width="20%" align="center">기타사항</td>
					<td><div class="col-xs-7">
							<textarea
								style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: white"
								name="etc" rows="5" cols="50" id="etc" class="form-control"></textarea>
						</div></td>
				</tr>
			</table>


			<table class="table">
				<tr>
					<td>
						<p>&nbsp;</p>
					</td>
				</tr>
				<tr>
					<td>
						<p align="center">
							총 <b><font color='#0000FF'>4단계</font></b>중 <b><font
								color='#FF00FF'>2단계(예약정보입력)</font></b> 입니다.
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p align="center">
							<input type="button" class="btn btn-info" value="다음단계"
								id="btn_resve2">&nbsp;<input type="button"
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
