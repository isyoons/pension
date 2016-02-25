<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>	
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
<script src="../script/gallery.js"></script>	
<link rel="stylesheet" href="../style/init.css">
<link rel="stylesheet" href="../style/gallery.css">
</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="container-fluid text-center">
		<div class="row content">
			<!-- Sub Menu -->
			<div class="col-sm-2 sidenav">
				<h3>Gallery</h3>
			</div>
			
			<!-- Contents -->
			<div class="col-sm-10 text-center sidecontents">

				<div class="row gallery">
					<div class="col-sm-3">
						<div class="well view-detail">
							<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
							<span>이미지 타이틀<br><small>2016-01-20</small></span>
						</div>
					</div>				
					<div class="col-sm-3">
						<div class="well">
							<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
							<span>이미지 타이틀<br><small>2016-01-20</small></span>
						</div>
					</div>				
					<div class="col-sm-3">
						<div class="well">
							<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
							<span>이미지 타이틀<br><small>2016-01-20</small></span>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="well">
							<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
							<span>이미지 타이틀<br><small>2016-01-20</small></span>
						</div>
					</div>
				</div>
				
				<div class="row gallery">
					<div class="col-sm-3">
						<div class="well">
							<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
							<span>이미지 타이틀<br><small>2016-01-20</small></span>
						</div>
					</div>				
					<div class="col-sm-3">
						<div class="well">
							<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
							<span>이미지 타이틀<br><small>2016-01-20</small></span>
						</div>
					</div>				
					<div class="col-sm-3">
						<div class="well">
							<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
							<span>이미지 타이틀<br><small>2016-01-20</small></span>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="well">
							<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
							<span>이미지 타이틀<br><small>2016-01-20</small></span>
						</div>
					</div>
				</div>
				
				<div class="row gallery">
					<div class="col-sm-3">
						<div class="well">
							<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
							<span>이미지 타이틀<br><small>2016-01-20</small></span>
						</div>					</div>				
					<div class="col-sm-3">
						<div class="well">
							<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
							<span>이미지 타이틀<br><small>2016-01-20</small></span>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="well">
							<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
							<span>이미지 타이틀<br><small>2016-01-20</small></span>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="well">
							<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
							<span>이미지 타이틀<br><small>2016-01-20</small></span>
						</div>
					</div>				
				</div>
			</div>
			
			<!-- paging -->
			<ul class="pagination">
				<!-- <li><a href="#">Previous</a></li> for 1page -->
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
				<li><a href="#">Next</a></li>
			</ul>

			<div class="row">
				<c:forEach var="gal" items="${requestScope.galList }">
					<p>${gal.title }</p>
				</c:forEach>
			</div>

		</div>
	</div>

	<!-- Gallery Deatil Modal for webb-->
	<div class="modal" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4>
						<span class="glyphicon glyphicon-picture"></span> 이미지 타이틀
					</h4>
				</div>
				<div class="modal-body">
					<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
					<p>
						사진 내용을 여기에 작성하자.
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$(document).ready(function(){
	    $(".view-detail").click(function(){
    		$("#myModal").modal({backdrop: "static"});	
	    });
	});	
	</script>
	
	<jsp:include page="../footer.jsp" />

</body>
</html>
