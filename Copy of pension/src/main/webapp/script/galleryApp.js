$(document).ready(function() {
	// 추가 버튼 클릭
	$("#inputBt").click(function() {
		initAdd();
		$("#galleryModal").modal({
			backdrop : "static"
		});
	});
	// Add click
	$("#addBt").click(function(event) {
		event.preventDefault();
		$("#galleryForm").submit();
	});	
	// Update click
	$("#modBt").click(function(event) {
		event.preventDefault();
		$("#galleryForm").attr("action", "modForApp.temp").submit();
	});
	// Delete click
	$("#delBt").click(function(event) {
		event.preventDefault();
		$("#galleryForm").attr("action", "del.temp").submit();
	});
	
});
// 갤러리 상세보기
$(document).on("click", ".view-detail img", function(event) {
	event.preventDefault();	
	showModal(this.id);
	$("#myModal").modal({backdrop: "static"});
});
$(document).on("click", ".view-detail2 img", function(event) {
	event.preventDefault();
	initDetail(this.id);
	$("#galleryModal").modal({backdrop : "static"});
});
function showModal(no) {
	_data = JSON.stringify({"no":no});
	_url = "oneAjax.temp";
	$.ajax({
		type : "POST",
		url : _url,
		data : _data,
			beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json");
        },			
		success : function(data, status) {
			console.log("status:" + status + "," + "data:" + data);
			$("#imgTitle").html(data.title);
			$("#imgContents").html(data.contents);
			setExistImg(data, "../uploadFiles/");
		},
		error : function(request, status, error) {
			alert("code : " + request.statusText
					+ "\r\nmessage : " + request.responseText);
		}
	});	
	
}

function setExistImg(data, path) {
	$("#imgDate").html(data.uploadDate);
	$("#imgCount").html(data.clickCount);
	$("#oneImg").attr("src", path+data.uploadImg).attr("alt", data.title);	
}

// 더보기 버튼 클릭
function loadGalListAjax(currentPage) {
	_data = JSON.stringify({"currentPage":currentPage});
	_url = "listAjax.temp";
	$.ajax({
		type : "POST",
		url : _url,
		data : _data,
			beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json");
        },			
		success : function(data, status) {
			console.log("status:" + status + "," + "data:" + data);
			$("#galDiv").append(data);
			setCurrentPage();
			if( $("#galDiv:has(.no)").length > 0 ) {
				$("#moreBt").hide();
			}
		},
		error : function(request, status, error) {
			alert("code : " + request.statusText
					+ "\r\nmessage : " + request.responseText);
		}
	});
	
}
function setCurrentPage() {
	var currentPage = ($("#currentPage").text()*1)+1;
	$("#currentPage").text(currentPage);
}
function initDetail(no) {
	_data = JSON.stringify({"no":no});
	_url = "oneAjax.temp";
	$.ajax({
		type : "POST",
		url : _url,
		data : _data,
			beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json");
        },			
		success : function(data, status) {
			console.log("status:" + status + "," + "data:" + data);
			$(".existImg").removeClass("hide");
			$("#title").val(data.title);
			$("#contents").val(data.contents);
			$("#existNo").val(data.no);
			setExistImg(data, "../../uploadFiles/");
			initModHide();
		},
		error : function(request, status, error) {
			alert("code : " + request.statusText
					+ "\r\nmessage : " + request.responseText);
		}
	});
	

}	
function initHide() {
	if(!$(".existImg").hasClass("hide")) {
		$(".existImg").addClass("hide");	
	}
	if(!$("#addBt").hasClass("hide")) {
		$("#addBt").addClass("hide");
	}
	if(!$("#modBt").hasClass("hide")) {
		$("#modBt").addClass("hide");
	}
	if(!$("#delBt").hasClass("hide")) {
		$("#delBt").addClass("hide");
	}
}
function initModHide() {
	if($(".existImg").hasClass("hide")) {
		$(".existImg").removeClass("hide");	
	}
	if(!$("#addBt").hasClass("hide")) {
		$("#addBt").addClass("hide");
		alert("add hide");

	} else {
		alert("add show");
	}
	if($("#modBt").hasClass("hide")) {
		$("#modBt").removeClass("hide");
	}
	if($("#delBt").hasClass("hide")) {
		$("#delBt").removeClass("hide");
	}
	
}
function initAdd() {
	initHide();
	$("#addBt").removeClass("hide");
}