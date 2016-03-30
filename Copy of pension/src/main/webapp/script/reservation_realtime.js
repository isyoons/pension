$(document).ready(function() {
	$(".room_detail").click(function() {
		var myId = this.id;
		var roomCode = myId.substring(3, 7);
		getModalBody(roomCode);
		$("#room_modal").modal({
			backdrop : "static"
		});
	});
	$("select[name='addService']").change(function() {
		
		$("#addNum").text($("select[name='addService']").val());
		$("#addMoney").text($("select[name='addService']").val()*15000);
	});
	$("#btn_resve1").click(function() {
		var checked = false;
		$("input#checkRoom:checked").each(function() {
			checked = true;
		});
		if (checked == true) {
			if ($('.dongui').is(':checked') == true) {
				formSubmit2();
			} else {
				alert('약관에 동의를 해주셔야 합니다.');
			}
		} else {
			alert('선택된 방이 없습니다.');
		}
	});

	$("#period").change(function() {
		formSubmit1();
	});

	$("#check").click(function() {
		formSubmit1();
	});

	$(".dayRoomCode.mOver").click(function() {
		var id = this.id;
		var roomCode = id.slice(-4);
		var day = id.substr(0, (id.length - 4));
		$("#statusCalendar").attr("action", "make_reservation_1.temp");
		$("#statusCalendar").attr("method", "post");
		formAddParam("statusCalendar", "sDay", day);
		formAddParam("statusCalendar", "sRoomCode", roomCode);
		$("#statusCalendar").submit();
	});
	
	$("#resveComfirm").click(function() {
		location.replace('status_reservation.temp');
	});
});

function formAddParam(Id, name, value) {
	$("#" + Id).append(
			"<Input type='hidden' name='" + name + "' value='" + value + "'>");
}

function formSubmit1() {
	$("#make1").attr("action", "make_reservation_1.temp");
	$("#make1").submit();
}

function formSubmit2() {
	$("#make1").attr("action", "make_reservation_2.temp");
	$("#make1").submit();
}
function getModalBody(roomCode) {
	_data = JSON.stringify({
		"roomCode" : roomCode
	});
	_url = "oneRoomImgList.temp";
	$.ajax({
		type : "POST",
		url : _url,
		data : _data,
		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
		},
		success : function(data, status) {
			$(".modalbody").append(data);

		},
		error : function(request, status, error, url, data) {

		}
	});
}