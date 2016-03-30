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
<script src="../../script/troom.js"></script>
<link rel="stylesheet" href="../../style/init.css">
<link rel="stylesheet" href="../../style/rooms.css">

</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="container">
		<h3>Room</h3>
		<table class="table table-responsive table-hover">

			<c:forEach var="no" begin="0" end="${roomsize}">
				<tr>
					<td>${roomlist[no].roomName }</td>
					<td><c:if test="${roomImgs[no][0]!=null }">
							<img class="img-responsive listimg"
								src="../../uploadFiles/${roomImgs[no][0] }">
						</c:if></td>
					<td><button class="btn btn-default detail"
							id="${roomlist[no].roomCode }">상세보기</button></td>
				</tr>
			</c:forEach>
		</table>


		<button class="btn btn-success right" id="addRoom">방 추가하기</button>

		
	</div>
	<p></p>
	<div class="modal" role="dialog" id="addRoomModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-picture"></span> 방 추가하기
					</h4>
				</div>
				<div class="modal-body">
					<form role="form" id="addRoomForm" method="post"
						action="addRoom.temp">
						<div class="table-left form-group">
							<span>방 기본 정보</span>
							<p>
							<table class="table-bordered table table-responsive">
								<tbody>
									<tr>
										<td>방이름</td>
										<td><input type="text" class="form-control"
											name="roomName" placeholder="방이름을 입력해주세요"></td>
										<td>방코드</td>
										<td><input type="text" class="form-control"
											name="roomCode" placeholder="방코드를 입력해주세요"></td>
									</tr>
									<tr>
										<td>기준인원</td>
										<td><input type="number" class="form-control"
											name="stdNum" placeholder="기준인원을 입력해주세요"></td>
										<td>최대인원</td>
										<td><input type="number" class="form-control"
											name="maxNum" placeholder="최대인원을 입력해주세요"></td>
									</tr>
									<tr>
										<td>커플룸</td>
										<td>yes <input type="radio" name="coupleRoom"
											value="true"> no <input type="radio"
											name="coupleRoom" value="false" checked></td>
										<td>복층형</td>
										<td>yes <input type="radio" name="doubleLayer"
											value="true"> no <input type="radio"
											name="doubleLayer" value="false" checked>
										</td>
									</tr>
									<tr>
										<td>스파</td>
										<td>yes <input type="radio" name="spa" value="true">
											no <input type="radio" name="spa" value="false" checked>
										</td>
										<td colspan="2"></td>
									</tr>
									<tr>
										<td>구비물품</td>
										<td colspan="3"><textarea class="form-control"
												name="equipment" rows="3" placeholder="구비물품을 입력해주세요"></textarea></td>
									</tr>
								</tbody>
							</table>

						</div>
						<p>
							<span>방 가격 정보</span>
						<p>
						<div class="table-left form-group">
							<table class="table-bordered table table-responsive">
								<tbody>
									<tr>
										<th></th>
										<th>비성수기</th>
										<th>준성수기</th>
										<th>성수기</th>
									</tr>
									<tr>
										<td>주중</td>
										<td><input type="number" name="lowSeasonWeekdayPrice"
											class="form-control" placeholder="비수기 주중금액를 입력해주세요">원</td>
										<td><input type="number" name="middleSeasonWeekdayPrice"
											class="form-control" placeholder="준성수기 주중금액를 입력해주세요">원</td>
										<td><input type="number" name="highSeasonWeekdayPrice"
											class="form-control" placeholder="성수기 주중금액를 입력해주세요">원</td>
									</tr>
									<tr>
										<td>주말</td>
										<td><input type="number" name="lowSeasonWeekendPrice"
											class="form-control" placeholder="비수기 주말금액를 입력해주세요">원</td>
										<td><input type="number" name="middleSeasonWeekendPrice"
											class="form-control" placeholder="준성수기 주말금액를 입력해주세요">원</td>
										<td><input type="number" name="highSeasonWeekendPrice"
											class="form-control" placeholder="성수기 주말금액를 입력해주세요">원</td>
									</tr>
									<tr>
										<td>금요</td>
										<td><input type="number" name="lowSeasonFridayPrice"
											class="form-control" placeholder="비수기 금요금액를 입력해주세요">원</td>
									</tr>
								</tbody>
							</table>
						</div>


					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						Close</button>
					<button type="button" class="btn btn-success btn-default"
						id="saveRoom">
						<span class="glyphicon glyphicon-upload"></span> save
					</button>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>