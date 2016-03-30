$(document).ready(function() {
	// 갤러리 상세보기
	/*$("#openinfo").click(function() {
		$("#myModal").modal();	
	});*/
	$("#openinfo").click(function() {
		$("#info").css("display", "inline-block");
		$("#openinfo").css("display", "none");
		$(".carousel-indicators").css("display", "none");
	});
	
	$("#infoclose").click(function() {
		$("#info").css("display", "none");
		$("#openinfo").css("display", "inline-block");
		$(".carousel-indicators").css("display", "inline-block");
	});
});
