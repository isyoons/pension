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

		<table class="table" align="center">
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">
					<p align="center">객실명</p>
				</td>
				<!-- <td bgcolor="white" width="80%" align="left"style="cursor:hand" onClick="window.open('/m_member/pop_room.html?room_num=15359&co_id=whitesea510','roominfo','toolbar=no,width=650,height=470,directories=no,status=no,scrollbars=no,resizable=no');"> -->
				<td bgcolor="white" width="80%" align="left">
					<p>poolvila302</p>
				</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">
					<p align="center">예약인원</p>
				</td>
				<td bgcolor="white" width="80%" align="left">
					<p>2명</p>
				</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%">
					<p align="center">금액</p>
				</td>
				<td bgcolor="white" width="80%" align="left">
					<p>
						16년 2월 17일 (동절기 주중요금) : <font color="black">270,000원</font><br>합계액
						: <font color="#FF6633"><b>270,000</b>원</font><br>
					</p>

				</td>
			</tr>
		</table>
		<br>

		<table class="table" align="center">
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">객실선택</td>
				<td bgcolor="white" width="80%" align="left" height="40">
					poolvila302 (총 1실)</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약기간</td>
				<td bgcolor="white" width="80%" align="left" height="40">2016년
					2월 17일 (1박2일)</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">예약인원</td>
				<td bgcolor="white" width="80%" align="left" height="40">총 2명
					(추가인원 0명)</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">부가서비스</td>
				<td bgcolor="white" width="80%" align="left" height="40"><br>합계액
					: <font color="#FF6633"><b>0</b>원</font><br></td>
			</tr>
		</table>
		<br>

		<table class="table" align="center">
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">확정금액</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b><font
						color="#FF6600">270,000원</font></b></td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">할인금액</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b></b>
				</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">실결제액</td>
				<td bgcolor="white" width="80%" align="left" height="40"><b><font
						color="#FF6600">270,000원</font></b></td>
			</tr>
		</table>

		<table class="table" align="center">
			<tr>
				<td>
					<p>
						<font color="#ff0000">*항목은 필수사항으로 입력하셔야 합니다.</font>
					</p>
				</td>
			</tr>
		</table>

		<table class="table" align="center">
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">대표자<font
					color="#ff0000"><b>*</b></font></td>
				<td bgcolor="white" width="80%" align="left"><input
					style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: white"
					type="text" maxlength="20" size="20" name="or_name" value="">
					&nbsp;필히 대표자명을 입력</td>
			</tr>
			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">대표연락처<font
					color="#ff0000"><b>*</b></font></td>
				<td bgcolor="white" width="80%" align="left"><input
					style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: white"
					type="text" maxlength="4" size="4" name="tel_1" value=""
					OnKeyUp="if(hy.tel_1.value.length == 3) hy.tel_2.focus()">
					- <input
					style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: white"
					type="text" maxlength="4" size="4" name="tel_2" value=""
					OnKeyUp="if(hy.tel_2.value.length == 4) hy.tel_3.focus()">
					- <input
					style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: white"
					type="text" maxlength="4" size="4" name="tel_3" value="">
					&nbsp;연락사항을 &nbsp;받으실 대표연락처 입력</td>
			</tr>

			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center"><font
					color="red">예약불가사항</font></td>
				<td bgcolor="white" width="80%" align="left"><font color="red"><b>주민등록상
							1998년 1월 1일 이후 출생자는 예약이 불가능합니다.<br>적발시 바로 환불없이 퇴실조치합니다.
					</b></font></td>
			</tr>

			<tr>
				<td bgcolor="#F7F6F6" width="20%" height="40" align="center">입금은행선택<font
					color="#ff0000"><b>*</b></font></td>
				<td bgcolor="white" width="80%" align="left"><input
					type="radio" name="pay" value=1>국민 111111-111111-111111 <br>
					<input type="radio" name="pay" value=2>신한
					222222-222222-222222</td>
			</tr>

			<tr>
				<td bgcolor="#F7F6F6" width="20%" align="center">기타사항</td>
				<td bgcolor="white" width="80%" align="left"><textarea
						style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: white"
						name="etc" rows="5" cols="50"></textarea></td>
			</tr>
		</table>

		<table class="table" align="center">
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
						<input type="button" width="133" height="51" border="0"
							value="다음단계" onclick="location='make_reservation_3.jsp'"><input
							type="button" width="133" height="51" value="취소하기" border="0"
							onclick="if(confirm('이전 페이지로 가시겠습니까?')){self.close();}else{return false;}">&nbsp;
					</p>
				</td>
			</tr>
		</table>
	</div>

	<jsp:include page="../../footer.jsp" />
</body>

</html>
