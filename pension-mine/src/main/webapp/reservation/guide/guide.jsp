<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Welcome Temp.pe.kr</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.css">	
 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="../../script/guide.js"></script>
<link rel="stylesheet" href="../../style/init.css">
<link rel="stylesheet" href="../../style/reservation.css">
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
	<jsp:include page="../../header.jsp" />
	<div class="container-fluid">
		<br>
		<h1 align="center">
			<b>RESERVATION</b>
		</h1>
		<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="197">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myGuideNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"></a>
			</div>

			<div>
				<div class="collapse navbar-collapse" id="myGuideNavbar">
					<ul class="nav navbar-nav nav-pills">
						<li><a href="#section1">요금안내</a></li>
						<li><a href="#section2">이용안내</a></li>
						<li><a href="#section3">유의사항</a></li>
						<li><a href="#section4">환불규정</a></li>
						<li><a href="../realtime/status_reservation.jsp"
							style="color: red;">실시간예약</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div id="section1" class="container-fluid">
			<h1>요금안내</h1>
			<br>
			<div class="row container-fluid">
				<div class="col-md-4">
					<img id="myimg" class="col-md-12"
						src="http://i.imgur.com/2PBLK.jpg"></img>
				</div>
				<div class="col-md-8">
					<table class="table table-hover" style="text-align: center;">
						<thead>
							<tr>
								<td rowspan="2">객실명</td>
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
						</thead>
						<tbody>
							<tr class="mOver1" id="mOver">
								<td>John</td>
								<td>Doe</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
							</tr>
							<tr class="mOver2" id="mOver">
								<td>John</td>
								<td>Doe</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
							</tr>
							<tr class="mOver3" id="mOver">
								<td>John</td>
								<td>Doe</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
							</tr>
							<tr class="mOver4" id="mOver">
								<td>John</td>
								<td>Doe</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
								<td>John</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<div id="section2" class="container-fluid">
		<h1>이용안내</h1>
		<br>
		<p>* 예약 후 3시간 이내 입금하셔야 예약이 완료되며, 입금 확인이 안될 시 자동취소 됩니다.</p>
		<p>* 입실은 오후 3시 이후부터 입실이 가능합니다.</p>
		<p>* 퇴실은 오전 11시까지 퇴실해 주시기 바랍니다.</p>
		<p>* 예약변경은 취소 후 다시 재예약으로 간주됩니다.(취소환불규정적용)</p>
		<p>* 예약방법 : 실시간예약과 전화로만 가능합니다.</p>
		<p>* 예약금은 100% 입금해 주셔야 예약이 이루어집니다.</p>
		<p>* 성수기 : 7월 18일 ~ 8월 16일</p>
		<p>* 준성수기 : 7월 12일 ~ 7월 17일 / 8월 17일 ~ 8월 21일</p>
		<p>* 법정 공휴일 전날은 주말요금이 적용됩니다.</p>
		<p>* 예약된 인원외에 다른 인원 입실 시 취소로 간주되어 환불없는 퇴실조치 합니다.</p>
		<p>* 펜션이용정원 : 숙박기준이 아니라 입실기준 입니다.</p>
		<p>입실만 하셔도 추가인원으로 적용되어 요금이 발생합니다.</p>
		<p>* 예약전화 : 010 - 6700 - 1200</p>
		<p>* 예약계좌 : 111 - 1111 - 1111 - 11 (농협 / 예금주 : 최순자)</p>
		<h1>이용요금</h1>
		<p>* 수영장 미온수 시스템(30℃ 내외) 사용시 추가 10만원</p>
		<p>※ 여름(7월, 8월) 겨울(12월, 1월, 2월, 3월)에는 미온수 시스템 사용이 불가합니다.</p>
		<p>* 바베큐 그릴 세트 (숯, 그릴 포함) 이용료 2만원</p>
		<p>* 기준인원 추가요금 : 성인, 아동 - 1만원 / 유아 - 5천원 (유아는 만 36개월 미만을 기준으로
			합니다.)</p>
	</div>

	<div id="section3" class="container-fluid">
		<h1>유의사항</h1>
		<br>
		<p>* 스파이용시 거품목욕제, 기타입욕제를 사용하실 수 없습니다.</p>
		<p>(고장의 원인이며 사용불가 상태가 됩니다.)</p>
		<p>* 객실내에서 화재의 위험이 있는 양초를 사용하실 수 없으며, 풍선부착을 삼가해 주세요.</p>
		<p>* 아이들의 풀장 이용을 금지합니다. (위험방지)</p>
		<p>* 다음 객실을 이용하시는 손님분들에게 피해를 주므로 생선, 해물 등 냄새가 심한 음식은 객실내에서 조리하실 수
			없습니다.</p>
		<p>* led 티라이트 이외의 인화성 초 사용금지</p>
		<p>* 애완동물은 고객님들의 편안한 휴식을 위하여 입실 할 수 없습니다.</p>
		<p>* 미성년자는 보호자 없이 투숙이 불가합니다.</p>
		<p>* 객실 내에서는 금연이며, 기름을 많이 요하는 음식의 조리를 피해주시기 바랍니다.</p>
		<p>* 타 고객님들을 배려하여 고성방가를 자제해 주시기 바랍니다.</p>
		<p>* 최대 수용인원을 초과할 수 없습니다.</p>
		<p>* 주말이나 성수기, 연휴기간에는 미리 예약을 해주세요.</p>
	</div>

	<div id="section4" class="container-fluid">
		<h1>환불규정</h1>
		<br>
		<p>* 올바른 예약문화 정착을 위하여 저희 펜션에서는 예약취소시 환불기준을 아래와 같이 운영하고 있사오니 꼭 확인을
			하시고 예약해 주시기 바랍니다.</p>
		<p>* 예약 후 취소시에는 기본 10%의 위약금이 있습니다.</p>
		<p>* 환불은 입금자와 동일인에게만 가능합니다.</p>
		<p>* 예약변경은 취소 후 다시 재예약으로 간주됩니다. (취소환불규정적용)</p>
		<br>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th></th>
					<th>기본수수료</th>
					<th>숙박 6일전</th>
					<th>숙박 5일전</th>
					<th>숙박 4일전</th>
					<th>숙박 3일전</th>
					<th>숙박 2일전</th>
					<th>숙박 1일전</th>
					<th>숙박 당일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>공제금</th>
					<td>10%</td>
					<td>20%</td>
					<td>30%</td>
					<td>40%</td>
					<td>50%</td>
					<td>60%</td>
					<td>80%</td>
					<td>100%</td>
				</tr>
				<tr>

				</tr>
				<tr>
					<th>환급금</th>
					<td>100%</td>
					<td>80%</td>
					<td>60%</td>
					<td>50%</td>
					<td>40%</td>
					<td>30%</td>
					<td>20%</td>
					<td>10%</td>
				</tr>
			</tbody>
		</table>
	</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".view-detail").click(function() {
				$("#myModal").modal({
					backdrop : "static"
				});
			});
		});
	</script>
	<jsp:include page="../../footer.jsp" />
</body>
</html>
