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

<script src="../../script/make_reservation_1.js"></script>
<script src="../../script/confirm_cancel.js"></script>
<link rel="stylesheet" href="../../style/init.css">
<link rel="stylesheet" href="../../style/reservation.css">

</head>
<body bgcolor="white" text="black" link="blue" vlink="purple"
	alink="red" topmargin=0 leftmargin=0>
	<jsp:include page="../../header.jsp" />
	<jsp:include page="../submenu.jsp" />
	<br>
	<br>

	<div class="container">
		<div class="container-fluid">
			<table class="table" align="center">
				<tr bgcolor="#EEEDED">
					<td width="25%">
						<p align="center">
							<b><font size="2">1단계 : 예약확인</font></b>
						</p>
					</td>
					<td b width="75%">
						<p align="left">원하시는 숙박일수를 정하시고 예약가능여부를 확인하세요!</p>
					</td>
				</tr>
			</table>

			<form action="make_reservation_2.temp" method="post" id="make1"
				class="form-inline">

				<table class="table" border="0" cellpadding="15" cellspacing="1"
					align="center">
					<tr bgcolor="#F7F6F6">
						<td width="66%" align="left"><font color="#333333"> <INPUT
								name="sYear" class="form-control" value="${sDate.year +1900}"
								maxLength=4 size=5>년 <SELECT name="sMonth"
								class="form-control">
									<c:forEach var="month" begin="1" end="12">
										<c:choose>
											<c:when test="${(sDate.month+1)==month }">
												<OPTION value="${month }" selected="selected">${month }</OPTION>
											</c:when>
											<c:otherwise>
												<OPTION value="${month }">${month }</OPTION>
											</c:otherwise>
										</c:choose>
									</c:forEach>

							</SELECT>월 <SELECT name="sDay" class="form-control" id="day">
									<c:forEach var="date" begin="1" end="${endDate }">
										<c:choose>
											<c:when test="${sDate.date==date }">
												<OPTION value="${date }" selected="selected">${date }</OPTION>
											</c:when>
											<c:otherwise>
												<OPTION value="${date }">${date }</OPTION>
											</c:otherwise>
										</c:choose>
									</c:forEach>
							</SELECT> 일~

						</font> <SELECT name="sPeriod" id="period" class="form-control">
								<c:forEach var="period" begin="1" end="9">
									<c:choose>
										<c:when test="${sPeriod==period }">
											<OPTION value="${period }" selected="selected">${period }박${period+1}일</OPTION>
										</c:when>
										<c:otherwise>
											<OPTION value="${period }">${period }박${period+1}일</OPTION>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</SELECT></td>
						<td width="32%" align="left" valign="middle"><input
							type="button" class="btn btn-info" width="155" height="23"
							value="예약가능여부확인" id="check"></td>
					</tr>
				</table>

				<table class="table" style="text-align: center;">
					<h5>※ ${sDate.year+1900 }년 ${sDate.month+1 }월 ${sDate.date }일
						부터 ${sPeriod }박${sPeriod+1 }일 이용가능한 모든객실 현황입니다</h5>

					<tr bgcolor="#F7F6F6">
						<td>선택</td>
						<td>객실명</td>
						<td>기준<br>인원
						</td>
						<td>최대<br>인원
						</td>
						<td>추가<br>예약<br>인원<br>
						</td>

						<td>비수기<br>주말
						</td>

						<td>객실정보</td>
					</tr>

					<c:forEach var="roomInfo" items="${roomInfos }">
						<tr>
							<td><c:choose>
									<c:when test="${roomInfo.roomCode==checkedroomCode }">
										<input type="checkbox" id="checkRoom"
											name="roomCheck${roomInfo.roomCode}" value="1"
											checked="checked">
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="checkRoom"
											name="roomCheck${roomInfo.roomCode}" value="1">
									</c:otherwise>
								</c:choose></td>
							<td>${roomInfo.roomName}<br></td>
							<td>${roomInfo.stdNum }</td>
							<td>${roomInfo.maxNum }</td>

							<td><select name="count${roomInfo.roomCode}"
								class="form-control">
									<c:forEach var="no" begin="0"
										end="${roomInfo.maxNum - roomInfo.stdNum }">
										<option value="${no }">${no }</option>
									</c:forEach>
							</select></td>

							<td>${roomInfo.lowSeasonWeekdayPrice }</td>

							<td><input type="button" value="버튼"
								class="btn btn-info room_detail" id="btn${roomInfo.roomCode }"></td>
						</tr>
					</c:forEach>
				</table>
				<table class="table" style="text-align: center;">
					<tr>
						<td width="20%">그릴서비스</td>
						<td width="100%" align="left" colspan=2>※ 주문 : <br>그릴서비스
							<SELECT name="addService" class="form-control">
								<c:forEach var="no" begin="0" end="10">
									<option value="${no }">${no }</option>
								</c:forEach>
						</SELECT> SET&nbsp;&nbsp; - &nbsp;&nbsp;<span id="addNum">0</span> SET : <span
							id="addMoney">0</span>원
						</td>
					</tr>
				</table>
			</form>
		</div>

		<table class="table">
			<tr>
				<td>
					<table border="0">
						<tr>
							<td height="50"><font color="#666666"><b>※ 유의사항및
										약관, 환불기준</b></font></td>
						</tr>
						<tr>
							<td align="left">&nbsp;<b><font color="green" size="2">유의사항및
										약관</font><font color="red" size="2"> [필독]</font></b></td>
						</tr>
						<tr>
							<td height="10"></td>
						</tr>
						<tr>
							<td align="left"><P>
									* 스파이용시 거품목욕제, 기타입욕제를 사용하실 수 없습니다. (고장의 원인이며 사용불가 상태가 됩니다.) <BR>*
									객실내에서 화재의 위험이 있는 양초를 사용하실 수 없으며, 풍선부착을 삼가해주세요. 어길시는 원상복구
									하셔야합니다.<BR>* 아이들의 풀장 이용을 금지합니다.(위험방지) <BR>* 다음객실을
									이용하시는 손님 분들에게 피해를 주므로 생선, 해물등 냄새가 심한 음식은 객실내에서 조리하실 수 없습니다. <BR>*
									LDE 티라이트 이외의 인화성 초 사용금지 <BR>* 애완동물은 고객님의 편안한 휴식을 위하여 입실 할
									수 없습니다. <BR>* 미성년자는 보호자 없이 투숙이 불가합니다.<br> * 객실 내에서는
									금연이며, 기름을 많이 요하는 음식의 조리를 피해주시기 바랍니다. <BR>* 타 객실손님들을 배려하여
									고성방가를 자제해 주시기 바랍니다.<BR>* 최대 수용인원을 초과 할 수 없습니다. <BR>*
									주말이나 성수기, 연휴기간에는 미리 예약을 해주세요 <BR>* 입금자명은 예약자 이름과 동일하게 해주시기
									바랍니다.
								</P>
								<P>
									<STRONG><FONT style="COLOR: #0000ff">(만일, 위 같은
											이유로 예약이 되지 않을시 펜션측은 책임지지 않으니 반드시 유의해주시기 바랍니다.)</FONT></STRONG>
								</P></td>
						</tr>
						<tr>
							<td height="30">&nbsp;</td>
						</tr>
						<tr>
							<td align="left">&nbsp;<font color="green" size="2"><b>환불기준</b></font></td>
						</tr>
						<tr>
							<td height="10"></td>
						</tr>
						<tr>
							<td align="left"><P>* 올바른 예약문화 정착을 위하여 저희 펜션에는 예약취소시
									환불기준을 아래와 같이 운영하고 있사오니 꼭 확인을 하시고 예약해 주시기 바랍니다.
								<P>
									<STRONG>*<FONT style="COLOR: #ff0000">예약 후 취소시</FONT>에는
										<FONT style="COLOR: #ff0000">기본 10%의 위약금</FONT>이 있습니다.
									</STRONG>
								</P>
								<P>* 환불은 입금자와 동일인 에게만 가능합니다.</P>
								<P>* 예약변경은 취소후 다시 재예약으로 간주됩니다. (취소환불규정적용)</P>
								<P>
									<STRONG>숙박 9일전 취소 : <FONT style="COLOR: #aa0000">취소수수료
											10% <FONT style="COLOR: #000000">공제후 환불<BR></FONT>
									</FONT>숙박 8일전 취소 : <FONT style="COLOR: #aa0000">취소수수료 20% <FONT
											style="COLOR: #000000">공제후 환불<BR></FONT></FONT>숙박 7일전 취소 : <FONT
										style="COLOR: #aa0000">취소수수료 30% <FONT
											style="COLOR: #000000">공제후 환불<BR></FONT></FONT>숙박 6일전 취소 : <FONT
										style="COLOR: #aa0000">취소수수료 40% <FONT
											style="COLOR: #000000">공제후 환불<BR></FONT></FONT>숙박 5일전 취소 : <FONT
										style="COLOR: #aa0000">취소수수료 50% <FONT
											style="COLOR: #000000">공제후 환불<BR></FONT></FONT>숙박 4일전 취소 : <FONT
										style="COLOR: #aa0000">취소수수료 60% <FONT
											style="COLOR: #000000">공제후 환불<BR></FONT></FONT>숙박 3일전 취소 : <FONT
										style="COLOR: #aa0000">취소수수료 70% <FONT
											style="COLOR: #000000">공제후 환불</FONT></FONT><BR>숙박 2일전 취소 : <FONT
										style="COLOR: #aa0000">취소수수료 100% <FONT
											style="COLOR: #000000">공제후 환불</FONT><BR></FONT>숙박 1일전 취소 : <FONT
										style="COLOR: #aa0000">취소수수료 90% <FONT
											style="COLOR: #000000">공제후 환불</FONT></FONT></STRONG>
								</P>
								<P>
									<STRONG>이용당일 취소시 -<FONT style="COLOR: #ff0000">
											환불불가</FONT></STRONG><BR>
								</P></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<table class="table" border="0" cellpadding="15" cellspacing="1"
			align="center">
			<tr>
				<td height="30"><input type="checkbox" class="dongui" value="Y">
					<font color="blue"> 위 <b>유의사항및 약관</b>과 환불기준에 동의하시면 체크하신후
						다음단계로 진행해 주세요!
				</font><br></td>
			</tr>
			<tr>
				<td><p>&nbsp;</p></td>
			</tr>

			<tr>
				<td>
					<p align="center">
						총 <b><font color='#0000FF'>4단계</font></b>중 <b><font
							color='#FF00FF'>1단계(객실상태 확인)</font></b> 입니다.
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<p align="center">
						<input type="button" class="btn btn-info" value="다음단계"
							id="btn_resve1">&nbsp;<input type="button"
							class="btn btn-info" value="취소하기" id="cancel">
					</p>
				</td>
			</tr>
		</table>
	</div>

	<div class="modal" id="room_modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4>객실명</h4>
				</div>
				<div class="modal-body"></div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-right"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> 닫기
					</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../../footer.jsp" />
</body>
</html>
