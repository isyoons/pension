<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Welcome Temp.pe.kr</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../style/init.css">
</head>
<body>
	<div class="container">
		
		<div class="well text-center">
		<form class="form-inline" id="tForm">
			<div class="form-group">
				<label class="sr-only" for="tel">Tel</label>
				<input type="text" class="form-control" id="tel" placeholder="휴대폰번호(ex:01012345678)" name="tel" maxlength="11" required autofocus>
			</div>
			<div class="form-group">
				<label class="sr-only" for="password">Password</label>
				<input type="password" class="form-control" id="password" placeholder="비밀번호(최소10글자)" name="password" min="10" required>
			</div>
			<div class="form-group">
				<label class="sr-only" for="name">Name</label>
				<input type="text" class="form-control" id="name" placeholder="아이디(최소6글자)" name="name" required>
			</div>
			<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-lock"></span> Log in</button>
		</form>
		</div>
		
	</div>
	<script>
 	$("#tForm").submit(function(event) {
 		event.preventDefault();
 		if( checkLoginValid() ) {
			_data = JSON.stringify({
				"name":$("#name").val().replace(" ", ""),
				"tel":$("#tel").val().replace(" ", ""),
				"password":$("#password").val().replace(" ", "")});
			_url = "loginValidAjax.temp";
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
	 				if(data == '0') {
						alert("해당 관리자가 없으요.");
						$("#name").val("");
						$("#password").val("");
						$("#tel").val("").focus();
						return;
					} else {
						location.href = "TGallery/list.temp";
					}
				},
				error : function(request, status, error) {
					alert("code : " + request.statusText
							+ "\r\nmessage : " + request.responseText);
				}
			});
 		} else {
 			return false;
 		}
 			
 	});
 		
 	function checkLoginValid() {
 		var tel = $("#tel").val().replace(" ", "");
 		var pwd = $("#password").val().replace(" ", "");
 		var nmn = $("#name").val().replace(" ", "");
 		var telPattern = /^0[\d]{9,10}/gi;
 		var pwdPattern = /[\da-z]{10,}/gi;
 		var nmnPattern = /[\da-z]{6,}/gi;
 		if( !telPattern.test(tel) ) {
 			alert("정확한 휴대폰번호를 입력하세요.");
 			$("#tel").val("").focus();
 			return false;
 		}
 		if( !pwdPattern.test(pwd) ) {
 			alert("숫자/영어로 된 최소 10자리의 비밀번호를 입력하세요.");
 			$("#password").val("").focus();
 			return false;
 		} 
 		if( !nmnPattern.test(nmn) ) {
 			alert("숫자/영어로 된 최소 6자리의 아이디를 입력하세요.");
 			$("#name").val("").focus();
 			return false;
 		}
 		return true;
 	}
	</script>
</body>
</html>
