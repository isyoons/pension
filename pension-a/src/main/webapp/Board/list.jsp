<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Welcome Temp.pe.kr</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.css">	
 -->
<link rel="stylesheet"
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
			<jsp:include page="../submenu.jsp" />

			<!-- Contents -->
			<div class="col-sm-10 text-center sidecontents">

				<div class="row board" id="no-more-tables">
					<table class="table">
						<colgroup>
							<col width="10%" />
							<col width="*" />
							<col width="10%" />
							<col width="20%" />
							<col width="10%" />
						</colgroup>
						<thead>
							<tr>
								<th class="text-center">번호</th>
								<th class="text-center">제목</th>
								<th class="text-center">글쓴이</th>
								<th class="text-center">날짜</th>
								<th class="text-center">조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach begin="0" end="9" varStatus="no" items="${boardlist}"
								var="board">
								<tr>
									<td data-title="번호">${board.num}</td>
									<td data-title="제목" class="text-left"><a
										href="read.temp?num=${board.num}&type=${type}&currentPage=${currentPage}">${board.title}</a></td>
									<td data-title="글쓴이">${board.bname}</td>
									<td data-title="날짜"><fmt:formatDate value="${board.dob}"
											pattern="yyyy-MM-dd" /></td>
									<td data-title="조회">${board.bcount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class='btn-right'>
					<a href="add.temp?type=${type}&currentPage=${currentPage}"
						type="button" class="btn btn-primary">글쓰기</a> <input type="hidden"
						name="type" value="${type}">
				</div>

			</div>

			<!-- paging -->
			<ul class="pagination">

				<c:if test="${currentPage != 1}">
					<li><a
						href="list.temp?type=${type}&currentPage=${currentPage - 1}">Previous</a></li>
				</c:if>


				<c:choose>
					<c:when test="${current == total }">
						<c:forEach begin="${current*10 +1 }" end="${totalPage}" var="i">
							<c:choose>
								<c:when test="${currentPage eq i}">
									<li class="active"><a href="#">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="list.temp?type=${type}&currentPage=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:when test="${current < total }">
						<c:forEach begin="${current*10 +1 }" end="${current*10 +10}"
							var="i">
							<c:choose>
								<c:when test="${currentPage eq i}">
									<li class="active"><a href="#">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="list.temp?type=${type}&currentPage=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
				</c:choose>
				<c:if test="${currentPage lt totalPage}">
					<li><a
						href="list.temp?type=${type}&currentPage=${currentPage + 1}">Next</a></li>
				</c:if>
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
					<img
						src="http://thepensions.kr/data/files/2013/11/13/1384333754078c54c40930ba1.jpg"
						alt="이미지타이틀" class="img-responsive">
					<p>사진 내용을 여기에 작성하자.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-right btn-right"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> 닫기
					</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".view-detail").click(function() {
				$("#myModal").modal({
					backdrop : "static"
				});
			});
		});
	</script>

	<jsp:include page="../footer.jsp" />

</body>
</html>
