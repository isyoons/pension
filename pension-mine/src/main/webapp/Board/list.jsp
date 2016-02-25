<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Welcome Temp.pe.kr</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.css">	
 --><link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- <script
	src="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.js"></script>
 -->		
<script src="../script/gallery.js"></script>	
<link rel="stylesheet" href="../style/init.css">
<link rel="stylesheet" href="../style/board.css">

</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="container-fluid text-center">
		<div class="row content">
			<!-- Sub Menu -->
			<div class="col-sm-2 sidenav">
				<h3>Board</h3>
				<p><a href="board.jsp?type=notice" class="btn btn-primary btn-lg active" role="button">Notice</a></p>
				<p><a href="board.jsp?type=faq" role="button">FAQ</a></p>
				<p><a href="board.jsp?type=reviews" role="button">Reviews</a></p>
			</div>

			<!-- Contents -->
			<div class="col-sm-10 text-center sidecontents">

				<div class="row board" id="no-more-tables">
					<table class="table">
						<colgroup>
							<col width="10%"/>
							<col width="*"/>
							<col width="20%"/>
							<col width="10%"/>
						</colgroup>
						<thead>
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">제목</th>
							<th class="text-center">날짜</th>
							<th class="text-center">조회</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td data-title="번호">9</td>
							<td data-title="제목" class="text-left">새 공지사항새 공지사항새 공지사항새 공지사항새 공지사항새 공지사항</td>
							<td data-title="날짜">2016-01-20</td>
							<td data-title="조회">100</td>
						</tr>
						<tr>
							<td data-title="번호">9</td>
							<td data-title="제목" class="text-left">새 공지사항새 공지사항새 공지사항새 공지사항새 공지사항새 공지사항</td>
							<td data-title="날짜">2016-01-20</td>
							<td data-title="조회">100</td>
						</tr>
						</tbody>
					</table>
				</div>
				
			</div>
			
			<!-- paging -->
			<ul class="pagination">
				<!-- <li><a href="#">Previous</a></li> for 1page -->
				<!-- mobile은 5page만 가져오게 -->
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
