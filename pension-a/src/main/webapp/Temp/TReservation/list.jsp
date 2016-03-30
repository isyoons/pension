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
											xhr.setRequestHeader(
													"Content-Type",
													"application/json");
										},
										success : function(data, status) {
											console.log("status:" + status
													+ "," + "data:" + data);
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
											alert("code : "
													+ request.statusText
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

	<jsp:include page="../footer.jsp" />
</body>
</html>