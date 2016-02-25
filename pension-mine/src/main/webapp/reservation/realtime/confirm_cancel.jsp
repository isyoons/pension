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
<body>
	<jsp:include page="../../header.jsp" />
	<jsp:include page="../submenu.jsp" />

	<br>
	<h2>예약하기</h2>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">예약확인</h4>
				</div>
				<div class="modal-body">
					<form action="complete.jsp">
						<div class="form-group">
							<label for="name">예약자명</label> <input type="text"
								class="form-control" id="name" placeholder="예약자 이름을 입력해 주세요.">
						</div>
						<div class="form-group">
							<label for="phone">연락처</label> <input type="tel"
								class="form-control" id="phone"
								placeholder=" - 을 제외한 연락처를 입력해 주세요.">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default">예약확인</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../../footer.jsp" />

</body>
</html>
