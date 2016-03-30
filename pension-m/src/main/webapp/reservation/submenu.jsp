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
			<a href="status_reservation.temp"><button type="button"
					class="btn btn-primary">예약현황</button></a> <a
				href="make_reservation_1.temp"><button type="button"
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

				<div class="form-group">
					<label for="name">예약자명</label> <input type="text"
						class="form-control" id="name" placeholder="예약자 이름을 입력해 주세요.">
				</div>
				<div class="form-group">
					<label for="phone">연락처</label> <input type="tel"
						class="form-control" id="phone"
						placeholder=" - 을 제외한 연락처를 입력해 주세요.">
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-toggle="modal"
					data-target="#myModal2" data-dismiss="modal" id="confirm">예약확인</button>
			</div>
		</div>
	</div>
</div>


<form action="confirm_cancel2.temp" method="post" id="confirmForm">
	<!-- Modal -->
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">예약확인</h4>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<tbody id="resvebody">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</form>

<script>
	$("#confirm")
			.click(
					function() {

						var phoneNumber = $("#phone").val();
						_data = JSON.stringify({
							"phoneNumber" : phoneNumber
						});
						_url = "confirm_cancel.temp";
						$
								.ajax({
									type : "POST",
									url : _url,
									data : _data,
									beforeSend : function(xhr) {
										xhr.setRequestHeader("Accept",
												"application/json");
										xhr.setRequestHeader("Content-Type",
												"application/json");
									},
									success : function(data, status) {
										console.log("status:" + status + ","
												+ "data:" + data);
										$(".bodytr").remove();
										if (data.length != 0) {
											for (var i = 0; i < data.length; i++) {

												var isDeposit = "입금대기";

												if (data[i].isDeposit == 0) {
													isDeposit = "입금대기";
												} else {
													isDeposit = "입금완료";
												}

												$("#resvebody")
														.append(
																"<tr class='bodytr' id="+data[i].resveCode+"><td>"
																		+ data[i].resveCtm
																		+ "</td><td>"
																		+ data[i].resveDay
																		+ "</td><td>"
																		+ isDeposit
																		+ "</td></tr>");
												$(".bodytr")
														.click(
																function() {

																	var resveCode = this.id;
																	formAddParam(
																			"confirmForm",
																			"resveCode",
																			resveCode);
																	$(
																			"#confirmForm")
																			.submit();
																});
											}
										} else {
											$("#resvebody")
													.append(
															"<tr class='bodytr'><td>예약정보 없음</td></tr>");
										}
									},
									error : function(request, status, error) {
										alert("code : " + request.statusText
												+ "\r\nmessage : "
												+ request.responseText);
									}
								});
						$("#modal2").modal();
					});
</script>
<script>
	function formAddParam(Id, name, value) {
		$("#" + Id)
				.append(
						"<Input type='hidden' name='" + name + "' value='" + value + "'>");
	}
</script>
