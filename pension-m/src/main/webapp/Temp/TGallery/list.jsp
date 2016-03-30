<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>	
<c:choose>
<c:when test="${sessionScope.login eq null }">
	<c:redirect url="../loginForm.temp"/>
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
<script src="../../script/gallery.js"></script>
<link rel="stylesheet" href="../../style/init.css">
<link rel="stylesheet" href="../../style/gallery.css">	
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

				<c:choose>
					<c:when test="${!empty requestScope.galList }">
					
					<div id="galDiv">
					<c:forEach var="gal" items="${requestScope.galList }" varStatus="status">
						
						<div class="col-sm-3">
							<div class="well view-detail2">
								<img src="../../uploadFiles/${gal.uploadImg }" alt="${gal.title }" class="img-responsive" id="${gal.no}">
								<p><span>${gal.title }<br><small>${gal.uploadDate }</small></span></p>
							</div>
						</div>				
										
					</c:forEach>
					</div>
					
					</c:when>
					<c:otherwise>
						<p class="text-center">사진 목록이 없습니다.</p>
					</c:otherwise>
				</c:choose>

				<!-- more button -->
				<c:if test="${requestScope.currentPage lt requestScope.totalPage }">
				<div class="col-sm-12">
					<button 
					type="button" class="btn btn-primary" id="moreBt"><span class="glyphicon glyphicon-refresh"></span> 더보기</button>
					<span id="currentPage" class="hide">${requestScope.currentPage }</span>			
				</div>
				</c:if>
				<!-- end more button -->
				
				<div class="col-sm-12 text-right margin-top-20">
					<button type="button" class="btn btn-primary" id="inputBt">추가</button>
				</div>
				
			</div>
			<!-- end contents -->
		</div>
	
	</div>
	<!-- end container -->

	<!-- Modal content-->
	<div class="modal" role="dialog" id="galleryModal">
	<div class="modal-dialog">	
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4>
				<span class="glyphicon glyphicon-picture"></span> 갤러리
			</h4>
		</div>
		<div class="modal-body">
			<form role="form" id="galleryForm" name="galleryForm" method="post" action="add.temp" enctype="multipart/form-data">
		
				<div class="well existImg">
					<!-- 상세보기, 수정, 삭제시 원본 이미지, 날짜, 카운트 등 표시 -->
					<img src="" alt="이미지타이틀" class="img-responsive" id="oneImg">
					<p><span id="imgDate">2015-12-30</span> (조회:<span id="imgCount">312</span>)</p>
					<input type="hidden" name="no" id="existNo" value="0">
					<input type="hidden" name="currentPage" value="${requestScope.currentPage }">
				</div>
			
				<div class="form-group">
					<label for="inputImg">사진 선택</label>
					<input type="file" class="form-control" id="img" name="img" placeholder="select picture" accept="image/*" required>
				</div>
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text" class="form-control" id="title" name="title" placeholder="제목" value="" required autofocus>
				</div>
				<div class="form-group">
					<label for="contents">내용</label>
					<textarea class="form-control" id="contents" name="contents" rows="3" placeholder="내용"></textarea>
				</div>

			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">
				Close
			</button>
			<button type="button" class="btn btn-success btn-default hide" id="addBt">
				<span class="glyphicon glyphicon-upload"></span> Add
			</button>
			<button type="button" class="btn btn-success btn-default hide" id="modBt">
				<span class="glyphicon glyphicon-refresh"></span> Update
			</button>
			<button type="button" class="btn btn-danger btn-default hide" id="delBt">
				<span class="glyphicon glyphicon-remove"></span> delete
			</button>
		</div>
	</div>
	</div>
	</div>

	<script>
	$(document).ready(function() {
		initHide();
		$("#moreBt").click(function(event) {
			event.preventDefault();
			loadGalListAjax($("#currentPage").text());
		});
	});
	</script>
	
	<jsp:include page="../footer.jsp" />

</body>
</html>
</c:otherwise>
</c:choose>
