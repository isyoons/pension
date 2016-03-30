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

	$("#asdf").click(function() {
		$("#asdf").text("ddd");
	});

	$(".mOver1").hover(function() {
		$("img#myimg").attr("src", "http://i.imgur.com/2PBLK.jpg");
	}).click(function(){
		$(location).attr('href', '../../Gallery/list.jsp');
	});
	
	$(".mOver2").hover(function() {
		$("img#myimg").attr("src", "http://cfile10.uf.tistory.com/image/2019F9354D9D2A000D5301");
	}).click(function(){
		$(location).attr('href', '../../Gallery/list.jsp');
	});
	
	$(".mOver3").hover(function() {
		$("img#myimg").attr("src", "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSXtUvAu9NoQiJBPCcqoEY13w2GEseDsQuOtmhNFZZ7eT7Nw_ce6A");
	}).click(function(){
		$(location).attr('href', '../../Gallery/list.jsp');
	});
	
	$(".mOver4").hover(function() {
		$("img#myimg").attr("src", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBpIrHgy3-JR-FkfwX6aiOp9lav7IqR69jLFeKJQpF9PER_WkGCg");
	}).click(function(){
		$(location).attr('href', '../../Gallery/list.jsp');
	});
	
	$(".mOver5").hover(function() {
		$("img#myimg").attr("src", "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTyQLgfpaNC1e0nk43qJAdPTJa6Ea-x43lNHGXq5rZbH_MjCXSi");
	}).click(function(){
		$(location).attr('href', '../../Gallery/list.jsp');
	});

});