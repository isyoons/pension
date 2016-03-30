$(document).ready(function() {

	$(".mOver").mouseover(function(event) {	
		var roomCode = this.id;
		showImg(roomCode);
	}).click(function() {
		var roomCode = this.id;
		$(location).attr('href', '../../room/rooms.temp?roomCode=' + roomCode);
	});
});

function showImg(roomCode) {
	_data = JSON.stringify({
		"roomCode" : roomCode
	});
	_url = "oneImg.temp";
	$.ajax({
		type : "POST",
		url : _url,
		data : _data,
		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
		},
		success : function(data, status) {			
			$("#myimg").attr("src", "../../uploadFiles/"+data.roomImg);
		},
		error : function(request, status, error, url, data) {

		}
	});
}