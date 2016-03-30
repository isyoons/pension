<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:choose>
<c:when test="${sessionScope.login eq null }">
	<c:redirect url="/Temp/loginForm.temp"/>
</c:when>
<c:otherwise>    
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
<link rel="stylesheet" href="../../style/init.css">
<link rel="stylesheet" href="../../style/gallery.css">
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="container-fluid text-center">
		<div class="row content">
			<!-- Sub Menu -->
			<div class="col-sm-2 sidenav">
				<h3>Login Info</h3>
			</div>

			<!-- Contents -->
			<div class="col-sm-10 text-center sidecontents">
		
				<div class="well">
				<form class="form" id="tForm">
					<div class="form-group">
						<label for="tel">Tel</label>
						<input type="text" class="form-control" id="tel" placeholder="휴대폰번호(ex:01012345678)" name="tel" maxlength="11" required autofocus value="${sessionScope.member.tel }">
					</div>
					<div class="form-group">
						<label for="password">Password</label>
						<input type="password" class="form-control" id="password" placeholder="비밀번호(최소10글자)" name="password" min="10" required>
					</div>
					<div class="form-group">
						<label for="name">Name</label>
						<input type="text" class="form-control" id="name" placeholder="아이디(최소6글자)" name="name" required value="${sessionScope.member.name }">
					</div>
					<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-lock"></span> Info Update</button>
					<button type="button" class="btn btn-default" id="pwModBt"><span class="glyphicon glyphicon-edit"></span> Password Update</button>
				</form>
				</div>
		
			</div>
			<!-- end Contents -->
			
		</div>
	</div>
				
	<!-- Password Modal content start -->
	<div class="modal" role="dialog" id="pwModal">
	<div class="modal-dialog">	
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4>
				<span class="glyphicon glyphicon-edit"></span> 비밀번호 수정
			</h4>
		</div>
		<div class="modal-body">
			<form role="form" id="pwForm" name="pwForm">
		
				<div class="form-group">
					<label for="pw">현재 비밀번호</label>
					<input type="password" class="form-control" id="pw" name="password" placeholder="현재 비밀번호" value="" required autofocus>
				</div>
				<div class="form-group">
					<label for="pw1">수정할 비밀번호</label>
					<input type="password" class="form-control" id="pw1" name="password1" placeholder="수정할 비밀번호" required />
				</div>
				<div class="form-group">
					<label for="pw2">비밀번호 확인</label>
					<input type="password" class="form-control" id="pw2" name="password2" placeholder="비밀번호 확인" required />
				</div>

			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">
				Close
			</button>
			<button type="button" class="btn btn-success" id="modBt">
				<span class="glyphicon glyphicon-refresh"></span> Update
			</button>
		</div>
	</div>
	</div>
	</div>
	<!-- Password Modal content end -->
	
	<script>
	$("#pwModBt").click(function() {
		$("#pwModal").modal({
			backdrop : "static"
		});
	});	
	$("#modBt").click(function(event) {
		event.preventDefault();
		if( checkPw() ) {
			_data = JSON.stringify({
				"password":$("#pw").val().replace(" ", ""),
				"password1":$("#pw1").val().replace(" ", "")});
			_url = "updatePwValidAjax.temp";
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
					if(data == 'pw') {
						alert("현재 비밀번호가 틀립니다.");
						return false;
					} else if(data == '1') {
						alert("비밀번호 수정을 완료했습니다.\n수정된 정보로 다시 로그인 하세요.");
						location.href = "/Temp/logout.Temp";
					} else {
						alert("비밀번호 수정에 실패했습니다.");
						return false;
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
 	$("#tForm").submit(function(event) {
 		event.preventDefault();
 		if( checkLoginValid() ) {
			_data = JSON.stringify({
				"name":$("#name").val().replace(" ", ""),
				"tel":$("#tel").val().replace(" ", ""),
				"password":$("#password").val().replace(" ", "")});
			_url = "updateValidAjax.temp";
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
					if(data == 'pw') {
						alert("비밀번호가 틀립니다.");
						return false;
					} else if(data == '1') {
						alert("정보 수정을 완료했습니다.\n수정된 정보로 다시 로그인 하세요.");
						location.href = "/Temp/logout.Temp";
					} else {
						alert("정보 수정에 실패했습니다.");
						return false;
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
 		pwdPattern = /[\da-z]{10,}/gi;
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
 	
 	function checkPw() {
 		var pw = $("#pw").val().replace(" ", "");
 		var pw1 = $("#pw1").val().replace(" ", "");
 		var pw2 = $("#pw2").val().replace(" ", "");
 		if( !pwdPattern.test(pw) ) {
 			alert("숫자/영어로 된 최소 10자리의 비밀번호를 입력하세요.");
 			$("#pw").val("").focus();
 			return false;
 		} 
 		if( !pwdPattern.test(pw1) ) {
 			alert("숫자/영어로 된 최소 10자리의 비밀번호를 입력하세요.");
 			$("#pw1").val("").focus();
 			return false;
 		} 
 		if( !pwdPattern.test(pw2) ) {
 			alert("숫자/영어로 된 최소 10자리의 비밀번호를 입력하세요.");
 			$("#pw2").val("").focus();
 			return false;
 		}
 		if(pw1 != pw2) {
 			alert("두 개의 비밀번호가 일치해야 합니다.");
 			$("#pw2").val("").focus();
 			return false;
 		}
 		return true;
 	}
	</script>
	
	<jsp:include page="../footer.jsp" />
	
</body>
</html>
</c:otherwise>
</c:choose>
