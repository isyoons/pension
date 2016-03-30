$(document).ready(function() {

	// 빈칸 체크
	$("#btn_resve3").click(function() {
		if ($("#pay_user").val() == "") {
			alert("빈칸이 존재합니다");
		} else {
			formSubmit();
		}
	});
	
	$("#cancel").click(function() {
		var result = confirm('예약을 취소 하시겠습니까?');

		if (result) {
			// yes
			location.replace('status_reservation.temp');
		} else {
			// no
		}
	});
});

function formSubmit() {
	$("#make3").attr("action", "make_reservation_4.temp");
	$("#make3").submit();
}