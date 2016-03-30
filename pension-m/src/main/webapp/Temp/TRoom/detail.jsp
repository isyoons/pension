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
		<span id="title"><h2>${room.roomName }  정보</h2></span>
	</div>
	<div class="container">
		<form id="data" action="save.temp" method="post" class="form-inline">
			<div class="table-left form-group">
				<span>방 기본 정보</span>
				<p>
				<table class="table-bordered table table-responsive">
					<tbody>
						<tr>
							<td>방이름</td>
							<td><input type="text" class="form-control" name="roomName"
								value="${room.roomName }"></td>
							<td>방코드</td>
							<td id="roomCode">${room.roomCode }<input type="hidden"
								name="roomCode" value="${room.roomCode }"></td>
						</tr>
						<tr>
							<td>기준인원</td>
							<td><input type="number" class="form-control" name="stdNum"
								value="${room.stdNum }"></td>
							<td>최대인원</td>
							<td><input type="number" class="form-control" name="maxNum"
								value="${room.maxNum }"></td>
						</tr>
						<tr>
							<td>커플룸</td>
							<td>yes <input type="radio" name="coupleRoom" value="true"
								checked> no <c:choose>
									<c:when test="${room.coupleRoom==false }">
										<input type="radio" name="coupleRoom" value="false" checked>
									</c:when>
									<c:otherwise>
										<input type="radio" name="coupleRoom" value="false">
									</c:otherwise>
								</c:choose></td>
							<td>복층형</td>
							<td>yes <input type="radio" name="doubleLayer" value="true"
								checked> no <c:choose>
									<c:when test="${room.doubleLayer==false }">
										<input type="radio" name="doubleLayer" value="false" checked>
									</c:when>
									<c:otherwise>
										<input type="radio" name="doubleLayer" value="false">
									</c:otherwise>
								</c:choose></td>
						</tr>
						<tr>
							<td>스파</td>
							<td>yes <input type="radio" name="spa" value="true" checked>
								no <c:choose>
									<c:when test="${room.spa==false }">
										<input type="radio" name="spa" value="false" checked>
									</c:when>
									<c:otherwise>
										<input type="radio" name="spa" value="false">
									</c:otherwise>
								</c:choose></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td>구비물품</td>
							<td colspan="3"><textarea class="form-control"
									name="equipment" rows="3" placeholder="내용">${room.equipment }</textarea></td>
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
								class="form-control" value="${room.lowSeasonWeekdayPrice }">원</td>
							<td><input type="number" name="middleSeasonWeekdayPrice"
								class="form-control" value="${room.middleSeasonWeekdayPrice }">원</td>
							<td><input type="number" name="highSeasonWeekdayPrice"
								class="form-control" value="${room.highSeasonWeekdayPrice }">원</td>
						</tr>
						<tr>
							<td>주말</td>
							<td><input type="number" name="lowSeasonWeekendPrice"
								class="form-control" value="${room.lowSeasonWeekendPrice }">원</td>
							<td><input type="number" name="middleSeasonWeekendPrice"
								class="form-control" value="${room.middleSeasonWeekendPrice }">원</td>
							<td><input type="number" name="highSeasonWeekendPrice"
								class="form-control" value="${room.highSeasonWeekendPrice }">원</td>
						</tr>
						<tr>
							<td>금요</td>
							<td><input type="number" name="lowSeasonFridayPrice"
								class="form-control" value="${room.lowSeasonFridayPrice }">원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<p>방 사진
			<p>
			<div class="col-sm-12">
				<c:forEach items="${roomImgs}" var="roomImg">
					<div class="col-sm-3">
						<img src="../../uploadFiles/${roomImg }"
							class="img-responsive detail-img" data-img="${roomImg }">
					</div>
				</c:forEach>
			</div>
		</form>
	</div>
	<p>
	<div class="container">
		<button type="button" class="btn btn-warning btn-default right" id="add">
			<span class="glyphicon glyphicon-plus"></span> 사진추가
		</button>	
	</div>
	<p></p>
	<div class="container">
		<button type="button" class="btn btn-success btn-info right" id="list">
			<span class="glyphicon glyphicon-th-list"></span> 목록으로
		</button>
		
		<button type="button" class="btn btn-success btn-default right" id="save">
			<span class="glyphicon glyphicon-refresh"></span> Update
		</button>
		
		<button type="button" class="btn btn-danger btn-default right"
			id="delRoom">
			<span class="glyphicon glyphicon-thumbs-down"></span> 삭제하기
		</button>
	</div>
	
	<p></p>
	<!-- 사진 추가 모달 -->
	<div class="modal" role="dialog" id="addModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-picture"></span> 사진추가
					</h4>
				</div>
				<div class="modal-body">
					<form role="form" id="detailForm" method="post" action="add.temp"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="inputImg">사진 선택</label> <input type="file"
								class="form-control" id="img" name="img"
								placeholder="select picture" accept="image/*" required>
						</div>
						<input type="hidden" name="roomCode" value="${room.roomCode }">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						Close</button>
					<button type="button" class="btn btn-success btn-default "
						id="addBt">
						<span class="glyphicon glyphicon-upload"></span> 추가하기
					</button>

				</div>
			</div>
		</div>
	</div>
	<div class="modal" role="dialog" id="detailModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-picture"></span> 사진
					</h4>
				</div>
				<div class="modal-body">
					<img id="detailModalImg" src="" class="col-sm-12">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						Close</button>
					<button type="button" class="btn btn-success btn-default " id="del">
						<span class="glyphicon glyphicon-upload"></span> 삭제하기
					</button>

				</div>
			</div>
		</div>
	</div>
	

	<jsp:include page="../footer.jsp" />
</body>
</html>