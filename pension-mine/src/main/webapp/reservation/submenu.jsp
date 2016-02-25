<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="container">
	<div class="container-fluid text-center">
		<br>
		<h1>
			<b>RESERVATION</b>
		</h1>
		<br>
		<div align="right">
			<a href="status_reservation.jsp"><button type="button"
					class="btn btn-primary">예약현황</button></a> <a
				href="make_reservation_1.jsp"><button type="button"
					class="btn btn-primary">예약하기</button></a>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#myModal">예약확인/취소</button>
			<a href="../guide/guide.jsp"><button type="button"
					class="btn btn-danger">예약안내</button></a>
		</div>
	</div>
</div>

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