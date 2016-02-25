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

			<table class="table" border="0" cellpadding="15" cellspacing="1"
				align="center">
				<tr bgcolor="#F7F6F6">
					<td width="66%" align="left"><font color="#333333"> <INPUT
							name="s_year" value="2016" maxLength=4 size=5>년&nbsp; <SELECT
							name="s_month">
								<OPTION value="1">1</OPTION>
								<OPTION value="2" selected="selected">2</OPTION>
								<OPTION value="3">3</OPTION>
								<OPTION value="4">4</OPTION>
								<OPTION value="5">5</OPTION>
								<OPTION value="6">6</OPTION>
								<OPTION value="7">7</OPTION>
								<OPTION value="8">8</OPTION>
								<OPTION value="9">9</OPTION>
								<OPTION value="10">10</OPTION>
								<OPTION value="11">11</OPTION>
								<OPTION value="12">12</OPTION>
						</SELECT>월&nbsp; <SELECT name="s_day">
								<OPTION value="1">1</OPTION>
								<OPTION value="2">2</OPTION>
								<OPTION value="3">3</OPTION>
								<OPTION value="4">4</OPTION>
								<OPTION value="5">5</OPTION>
								<OPTION value="6">6</OPTION>
								<OPTION value="7">7</OPTION>
								<OPTION value="8">8</OPTION>
								<OPTION value="9">9</OPTION>
								<OPTION value="10">10</OPTION>
								<OPTION value="11">11</OPTION>
								<OPTION value="12">12</OPTION>
								<OPTION value="13">13</OPTION>
								<OPTION value="14">14</OPTION>
								<OPTION value="15">15</OPTION>
								<OPTION value="16">16</OPTION>
								<OPTION value="17">17</OPTION>
								<OPTION value="18">18</OPTION>
								<OPTION value="19">19</OPTION>
								<OPTION value="20">20</OPTION>
								<OPTION value="21">21</OPTION>
								<OPTION value="22">22</OPTION>
								<OPTION value="23">23</OPTION>
								<OPTION value="24">24</OPTION>
								<OPTION value="25">25</OPTION>
								<OPTION value="26">26</OPTION>
								<OPTION value="27">27</OPTION>
								<OPTION value="28">28</OPTION>
								<OPTION value="29">29</OPTION>
								<OPTION value="30">30</OPTION>
								<OPTION value="31">31</OPTION>
						</SELECT>일~
					</font> <SELECT name="s_period" onChange="this.form.submit();">
							<OPTION value="1" selected>1박2일</OPTION>
							<OPTION value="2">2박3일</OPTION>
							<OPTION value="3">3박4일</OPTION>
							<OPTION value="4">4박5일</OPTION>
							<OPTION value="5">5박6일</OPTION>
							<OPTION value="6">6박7일</OPTION>
							<OPTION value="7">7박8일</OPTION>
							<OPTION value="8">8박9일</OPTION>
							<OPTION value="9">9박10일</OPTION>
					</SELECT></td>
					<td width="32%" align="left" valign="bottom"><input
						type="button" width="155" height="23" border="0" value="예약가능여부확인"></td>
				</tr>
			</table>

			<table class="table" style="text-align: center;">
				<h5>※ 2016년 02월 13일 부터 1박2일 이용가능한 모든객실 현황입니다</h5>

				<tr bgcolor="#F7F6F6">
					<td rowspan="2">선택</td>
					<td rowspan="2">객실명(유형)</td>
					<td rowspan="2">기준<br>인원
					</td>
					<td rowspan="2">최대<br>인원
					</td>
					<td rowspan="2">예약<br> <font color='red'><b>기준</b></font><br>인원
					</td>
					<td rowspan="2">예약<br> <font color='red'><b>최대</b></font><br>인원<br>
						<font size=1>※1인당추가요금발생</font>
					</td>

					<td colspan="3">동절기<br>주말
					</td>

					<td rowspan="2">객실정보</td>
				</tr>
				<tr bgcolor="#F7F6F6">
					<td>주중</td>
					<td>주중</td>
					<td>주말</td>

				</tr>
				<tr>
					<td><input type="checkbox" name="check_[15359]" value="1"
						checked></td>
					<td>객실명<br> <font color=#838383>유형</font></td>
					<td>2</td>
					<td>4</td>


					<td><select name="man_count_[15359]" id="m15359" size="1"
						onChange="count_sum(15359,4);">
							<option value="1">1</option>
							<option value="2" selected>2</option>
					</select></td>
					<td>성인 <select name="man_count1_[15359]" id="m15359" size="1"
						onChange="count_sum(15359,4);">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
					</select> <br> 아동 <select name="man_count2_[15359]" id="m15359"
						size="1" onChange="count_sum(15359,4);">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
					</select> <br> 유아 <select name="man_count3_[15359]" id="m15359"
						size="1" onChange="count_sum(15359,4);">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
					</select>
					</td>

					<td>가격</td>
					<td>가격</td>
					<td bgcolor="#C9E156">가격</td>
					<!-- 해당하는 가격 셀 색상 변동 -->

					<td><input type="button" value="버튼"></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="check_[15360]" value="1"></td>
					<td>객실명<br> <font color=#838383>유형</font></td>
					<td>2</td>
					<td>4</td>

					<td><select name="man_count_[15360]" id="m15360" size="1"
						onChange="count_sum(15360,4);">
							<option value="1">1</option>
							<option value="2" selected>2</option>
					</select></td>
					<td>성인 <select name="man_count1_[15360]" id="m15360" size="1"
						onChange="count_sum(15360,4);">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
					</select> <br> 아동 <select name="man_count2_[15360]" id="m15360"
						size="1" onChange="count_sum(15360,4);">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
					</select> <br> 유아 <select name="man_count3_[15360]" id="m15360"
						size="1" onChange="count_sum(15360,4);">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
					</select>
					</td>

					<td>가격</td>
					<td>가격</td>
					<td bgcolor="#C9E156">가격</td>

					<td><input type="button" value="버튼"></td>
				</tr>
			</table>

			<table class="table" style="text-align: center;">
				<tr>
					<td width="20%">그릴서비스</td>
					<td width="80%" align="left" colspan=2>※ 주문 : <br>그릴서비스 <SELECT
						name="op_[3012]">
							<OPTION value="0">0</OPTION>
							<OPTION value="1">1</OPTION>
							<OPTION value="2">2</OPTION>
							<OPTION value="3">3</OPTION>
							<OPTION value="4">4</OPTION>
							<OPTION value="5">5</OPTION>
							<OPTION value="6">6</OPTION>
							<OPTION value="7">7</OPTION>
							<OPTION value="8">8</OPTION>
							<OPTION value="9">9</OPTION>
							<OPTION value="10">10</OPTION>
					</SELECT> SET&nbsp;&nbsp;&nbsp; - 1 SET : 15,000원
					</td>
				</tr>
			</table>

			<table class="table">
				<tr>
					<td height="50"><font color="#666666"><b>※ 유의사항및
								약관, 환불기준</b></font></td>
				</tr>
			</table>
			<table class="table" border="0" cellpadding="15" cellspacing="1"
				align="center">
				<tr>
					<td bgcolor="white">
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
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
										주말이나 성수기, 연휴기간에는 미리 예약을 해주세요 <BR>* 입금자명은 예약자 이름과 동일하게
										해주시기 바랍니다.
									</P>
									<P>
										<STRONG><FONT style="COLOR: #0000ff">(만일, 위 같은
												이유로 예약이 되지 않을시 네이처풀빌라측은 책임지지 않으니 반드시 유의해주시기 바랍니다.)</FONT></STRONG>
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
											style="COLOR: #aa0000">취소수수료 80% <FONT
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
					<td height="30"><input type="checkbox" name="dongui" value="Y">
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
							<input type="button" width="133" height="51" border="0"
								value="다음단계" onclick="location='make_reservation_2.jsp'"><input
								type="button" width="133" height="51" value="취소하기" border="0"
								onclick="if(confirm('예약을 취소 하시겠습니까?')){self.close();}else{return false;}">&nbsp;
						</p>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<p align="center">&nbsp;</p>
	<script language="javascript">
		function count_sum(room_num, max) {
			var man0 = eval("document.all.m" + room_num + "[0]");
			var man1 = eval("document.all.m" + room_num + "[1]");
			var man2 = eval("document.all.m" + room_num + "[2]");
			var man3 = eval("document.all.m" + room_num + "[3]");
			var num0 = man0.value * 1;
			var num1 = man1.value * 1;
			var num2 = man2.value * 1;
			var num3 = man3.value * 1;

			var total = num0 + num1 + num2 + num3;
			if (total > max) {
				alert("최대/추가 인원을 초과했습니다.");
				man1.selectedIndex = 0;
				man2.selectedIndex = 0;
				man3.selectedIndex = 0;
			}

		}

		function count_sum2(room_num, max) {
			var man1 = eval("document.all.m" + room_num + "[0]");
			var man2 = eval("document.all.m" + room_num + "[1]");
			var man3 = eval("document.all.m" + room_num + "[2]");
			var num1 = man1.value * 1;
			var num2 = man2.value * 1;
			var num3 = man3.value * 1;

			var total = num1 + num2 + num3;
			if (total > max) {
				alert("최대/추가 인원을 초과했습니다.");
				man2.selectedIndex = 0;
				man3.selectedIndex = 0;
			}

		}
	</script>

	<jsp:include page="../../footer.jsp" />
</body>
</html>
