$(document).ready(function() {
	// 갤러리 상세보기
	$(".view-detail").click(function() {
		$("#myModal").modal({
			backdrop : "static"
		});
	});
	// 추가 버튼 클릭
	$("#inputBt").click(function() {
		$("#galleryModal").modal({
			backdrop : "static"
		});
	});

});
