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
			
				<div id="galDiv">
					<c:forEach var="gal" items="${requestScope.galList }">
				
					<div class="col-sm-3">
						<div class="well view-detail">
							<img src="../uploadFiles/${gal.uploadImg }" alt="${gal.title }" class="img-responsive" id="${gal.no}">
							<p><span>${gal.title }<br><small>${gal.uploadDate }</small></span></p>
						</div>
					</div>				
				
					</c:forEach>
				</div>
				
				<!-- more button -->
				<c:if test="${requestScope.currentPage lt requestScope.totalPage }">
				<div class="col-sm-12">
					<button type="button" class="btn btn-primary" id="moreBt"><span class="glyphicon glyphicon-refresh"></span> 더보기</button>
					<span id="currentPage" class="hide">${requestScope.currentPage }</span>					
				</div>
				</c:if>
				<!-- end more button -->
				
			</div>
			<!-- end contents -->

		</div>
	</div>

	<!-- Gallery Deatil Modal for webb-->
	<div class="modal" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4>
						<span class="glyphicon glyphicon-picture"></span> <span id="imgTitle">갤러리</span>
					</h4>
				</div>
				<div class="modal-body">
					<img src="" alt="이미지타이틀" class="img-responsive" id="oneImg">
					<p id="imgContents"></p>
					<p>
						<span id="imgDate"></span> (조회수 : <span id="imgCount"></span>)
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
			$("#moreBt").click(function(event) {
				event.preventDefault();
				loadGalListAjax($("#currentPage").text());
			});
		});
	</script>	
	<jsp:include page="../footer.jsp" />

</body>
</html>
