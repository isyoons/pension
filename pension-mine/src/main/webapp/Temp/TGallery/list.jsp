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

				
				<div class="row">
					<div class="col-sm-10 text-left">
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
					</div>
					<div class="col-sm-2 text-right margin-top-20">
						<button type="button" class="btn btn-primary" id="inputBt">추가</button>
					</div>
				</div>

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
			<div class="well existData">
				<!-- 상세보기, 수정, 삭제시 원본 이미지, 날짜, 카운트 등 표시 -->
				<img src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg" alt="이미지타이틀" class="img-responsive">
				<p>등록일 : 2015-12-30 <span>( 조회:312 )</span></p>
			</div>
			
			<form role="form" name="galleryForm" method="post" action="/Gallery/insert.temp" enctype="multipart/form-data">
				<div class="form-group">
					<label for="inputImg">사진 선택</label>
					<input type="file" class="form-control" id="inputImg" placeholder="select picture" accept="image/*" required>
				</div>
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text" class="form-control" id="title" placeholder="제목" value="수정 전 제목은 여기다 적는다." required autofocus>
				</div>
				<div class="form-group">
					<label for="contents">내용</label>
					<textarea class="form-control" id="contents" rows="3" placeholder="내용">내용은 여기다 적는다. 수정전</textarea>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">
				Close
			</button>
			<button type="submit" class="btn btn-success btn-default" id="insertBt">
				<span class="glyphicon glyphicon-upload"></span> Add
			</button>
			<button type="button" class="btn btn-success btn-default hide" id="updateBt">
				<span class="glyphicon glyphicon-refresh"></span> Update
			</button>
			<button type="button" class="btn btn-danger btn-default" id="deleteBt">
				<span class="glyphicon glyphicon-remove"></span> delete
			</button>
		</div>
	</div>
	</div>
	</div>

	<script>
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
	</script>
	
	<jsp:include page="../footer.jsp" />

</body>
</html>
