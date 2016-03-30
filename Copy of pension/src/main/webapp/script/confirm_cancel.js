$(document).ready(function() {
	$("#cancel").click(function() {
		var result = confirm('예약을 취소 하시겠습니까?');

		if (result) {
			// yes
			$("#delete").submit();
			alert('예약이 취소 되었습니다 !');
		} else {
			// no
		}
	});
});