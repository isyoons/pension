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
		<form class="form-inline">
			<div class="form-group">
				<label class="sr-only" for="email">Email address</label>
				<input type="email" class="form-control" id="email" placeholder="Email">
			</div>
			<div class="form-group">
				<label class="sr-only" for="pass">Password</label>
				<input type="password" class="form-control" id="pass" placeholder="Password">
			</div>
			<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-lock"></span> Log in</button>
		</form>
		</div>

	</div>
	<script>
	$("button").click(function(){
		alert( $("#email").val() );
	});
	</script>
</body>
</html>
