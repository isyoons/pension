$(document).ready(function() {

	

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