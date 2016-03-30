var code;
$(document).ready(
		function() {
			var roomCode = $("#roomCode").text();
			var roomImg;
			$(".detail").click(function() {
				code = this.id;
				$(location).attr('href', 'detail.temp?roomCode=' + code);
			});
			$("#list").click(function() {
				$(location).attr('href', 'list.temp');
			});
			$("#add").click(function() {
				$("#addModal").modal();
			});
			$("#addBt").click(function(event) {
				event.preventDefault();
				$("#detailForm").submit();
			});
			$(".detail-img").click(
					function() {
						roomImg = $(this).data("img");
						$("#detailModalImg").attr("src",
								"../../uploadFiles/" + $(this).data("img"));
						$("#detailModal").modal();
					});
			$("#del").click(
					function() {
						$("#data").attr("action","del.temp");
						formAddParam("data","roomImg",roomImg);
						$("#data").submit();
					});
			$("#delRoom").click(function() {
				$("#data").attr("action","delRoom.temp");				
				$("#data").submit();
			});
			$("#addRoom").click(function() {
				$("#addRoomModal").modal();
			});
		});
$(document).on("click", "#saveRoom", function(event) {
	event.preventDefault();
	if ($("input[name='coupleRoom']:checked").val() == "true") {
		formAddParam("data", "coupleRoom", true);
	} else {
		formAddParam("data", "coupleRoom", false);
	}
	if ($("input[name='doubleLayer']:checked").val() == "true") {
		formAddParam("data", "doubleLayer", true);
	} else {
		formAddParam("data", "doubleLayer", false);
	}
	if ($("input[name='spa']:checked").val() == "true") {
		formAddParam("data", "spa", true);
	} else {
		formAddParam("data", "spa", false);
	}
	$("#addRoomForm").submit();
});

$(document).on("click", "#save", function(event) {
	event.preventDefault();
	if ($("input[name='coupleRoom']:checked").val() == "true") {
		formAddParam("data", "coupleRoom", true);
	} else {
		formAddParam("data", "coupleRoom", false);
	}
	if ($("input[name='doubleLayer']:checked").val() == "true") {
		formAddParam("data", "doubleLayer", true);
	} else {
		formAddParam("data", "doubleLayer", false);
	}
	if ($("input[name='spa']:checked").val() == "true") {
		formAddParam("data", "spa", true);
	} else {
		formAddParam("data", "spa", false);
	}	

	$("#data").submit();

});
function formAddParam(Id, name, value) {
	$("#" + Id).append(
			"<Input type='hidden' name='" + name + "' value='" + value + "'>");
}