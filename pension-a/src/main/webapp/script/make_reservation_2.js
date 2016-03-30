$(document).ready(function() {

	// 빈칸 체크
	$("#btn_resve2").click(function() {
		if ($("#i_name").val() == "" || $("#i_phone").val() == "") {
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
	$("#make2").attr("action", "make_reservation_3.temp");
	$("#make2").submit();
}