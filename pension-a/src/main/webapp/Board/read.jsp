<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="../style/init.css">
<link rel="stylesheet" href="../style/board.css">

</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="container-fluid text-center">
		<div class="row content">
			<jsp:include page="../submenu.jsp" />

			<div class="container ol-sm-10 text-center sidecontents">
				<table class="table table-bordered">
					<colgroup>
						<col width="10%" />
						<col width="20%" />
						<col width="10%" />
						<col width="*%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<tr>
						<th>제목 :</th>
						<td colspan="3">${board.title}</td>
						<th>글번호 :</th>
						<td>${board.num}</td>
					</tr>
					<tr>
						<th>글쓴이 :</th>
						<td>${board.bname}</td>
						<th>날짜 :</th>
						<td><fmt:formatDate value="${board.dob}" pattern="yyyy-MM-dd" /></td>
						<th>조회수 :</th>
						<td>${board.bcount}</td>
					</tr>
					<tr>
						<div>
							<td colspan="6" align="left"><c:if test="${board.pic!=null}">
									<img src="../uploadFiles/${board.pic}">
									<br>
								</c:if>${board.content}</td>
					</tr>
				</table>

				<!-- 댓글 -->

				<form id="commantForm" action="coAdd.temp" method="post" role="form">
					<c:if test="${type == 'E' || type == 'Q'}">
						<table class="table">
							<colgroup>
								<col width="10%" />
								<col width="20%" />
								<col width="10%" />
								<col width="20%" />
								<col width="*%" />
								<col width="10%" />
							</colgroup>
							<tr>
								<td colspan="6">
									<table class="table table-striped">
										<colgroup>
											<col width="10%" />
											<col width="*%" />
											<col width="10%" />
											<col width="10%" />
										</colgroup>
										<c:forEach begin="0" end="9" varStatus="no"
											items="${commantList}" var="board">
											<tr>
												<td>${board.cname}</td>
												<td align="left">${board.commant}</td>
												<td><fmt:formatDate value="${board.cdob}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td><a href="#" data-toggle="modal"
													data-target="#coUdtSelectModal" data-cnum="${board.cnum }"
													class="udt">수정</a> | <a href="#" data-toggle="modal"
													data-target="#coDeleteModal" data-cnum="${board.cnum }"
													class="del">삭제</a></td>
											</tr>
										</c:forEach>
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<!-- paging -->
									<ul class="pagination">

										<c:if test="${coCurrentPage != 1}">
											<li><a
												href="read.temp?num=${board.num}&type=${type}&currentPage=${currentPage}&coCurrentPage=${coCurrentPage - 1}">Previous</a></li>
										</c:if>


										<c:choose>
											<c:when test="${current == total }">
												<c:forEach begin="${current*10 +1 }" end="${coTotalPage}"
													var="i">
													<c:choose>
														<c:when test="${coCurrentPage eq i}">
															<li class="active"><a href="#">${i}</a></li>
														</c:when>
														<c:otherwise>
															<li><a
																href="read.temp?num=${board.num}&type=${type}&currentPage=${currentPage}&coCurrentPage=${i}">${i}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:when>
											<c:when test="${current < total }">
												<c:forEach begin="${current*10 +1 }" end="${current*10 +10}"
													var="i">
													<c:choose>
														<c:when test="${coCurrentPage eq i}">
															<li class="active"><a href="#">${i}</a></li>
														</c:when>
														<c:otherwise>
															<li><a
																href="read.temp?num=${board.num}&type=${type}&currentPage=${currentPage}&coCurrentPage=${i}">${i}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:when>
										</c:choose>
										<c:if test="${coCurrentPage lt coTotalPage}">
											<li><a
												href="read.temp?num=${board.num}&type=${type}&currentPage=${currentPage}&coCurrentPage=${coCurrentPage + 1}">Next</a></li>
										</c:if>
									</ul>
								</td>
							</tr>

							<tr>
								<th>이름:</th>
								<td><input type="hidden" name="num" value="${board.num}">
									<input type="hidden" name="type" value="${type}"> <input
									type="hidden" name="currentPage" value="${currentPage}">
									<input type="text" name="cname" class="form-control"></td>
								<th>비밀번호:</th>
								<td><input type="password" name="cpassword"
									class="form-control"></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="5"><textarea name="commant"
										class="form-control" id="commant"></textarea></td>
								<td><a type="button" class="btn btn-primary" id="okCommant">등록</a></td>
							</tr>

						</table>
					</c:if>
				</form>

				<!-- 댓글 끝 -->

				<div class="btn-right">
					<input type="text" name="cdob" value="${board.cdob}"> <input
						type="button" class="btn-primary" value="수정" data-toggle="modal"
						data-target="#myModalup"> <input type="button"
						class="btn-primary" data-toggle="modal" data-target="#myModal"
						value="삭제"> <input type="button" class="btn-primary"
						value="돌아가기"
						onclick="location.href='list.temp?type=${type}&currentPage=${currentPage}'">
				</div>
				<div class="btn" style="float: left;">
					<input type="button" class="btn-primary" value="다음글"> <input
						type="button" class="btn-primary" value="이전글"
						onclick="location.href='read.temp?num=${board.num-1}&type=${type}&currentPage=${currentPage}'">
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<form id="boardForm" method="post" action="delete.temp">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">비밀번호를 입력하세요.</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="num" value="${board.num}"> <input
							type="hidden" name="bsection" value="${type}">
						<div class="form-group">
							<label for="pwd">비밀번호:</label> <input type="password"
								class="form-control" id="pwd" name="dpwd">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							value="확인" id="ok">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="myModalup" role="dialog">
		<div class="modal-dialog">
			<form id="boardFormUdt" method="post" action="update.temp">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">비밀번호를 입력하세요.</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="num" value="${board.num}"> <input
							type="hidden" name="bsection" value="${type}"> <input
							type="hidden" name="currentPage" value="${currentPage}">
						<div class="form-group">
							<label for="pwd">비밀번호:</label> <input type="password"
								class="form-control" id="pwd" name="dpwd">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							value="확인" id="okUdt">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Comment Modal -->
	<div class="modal fade" id="coDeleteModal" role="dialog">
		<div class="modal-dialog">
			<form id="coDelForm" method="post" action="coDel.temp">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">비밀번호를 입력하세요.</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="num" value="${board.num}"> <input
							type="hidden" name="type" value="${type}"> <input
							type="hidden" name="currentPage" value="${currentPage}">
						<input type="hidden" name="cnum" value="">

						<div class="form-group">
							<label for="cpwd">비밀번호:</label> <input type="password"
								class="form-control" id="cpwd" name="cpwd">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							value="확인" id="okCoDel">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="coUdtSelectModal" role="dialog">
		<div class="modal-dialog">
			<form id="coUdtSelectForm" method=post action="coUdtSelect.temp">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">비밀번호를 입력하세요.</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="num" value="${board.num}"> <input
							type="hidden" name="type" value="${type}"> <input
							type="hidden" name="currentPage" value="${currentPage}">
						<input type="hidden" name="cnum" id="upcnum" value="">

						<div class="form-group">
							<label for="cpwd">비밀번호:</label> <input type="password"
								class="form-control" id="upcpwd" name="cpwd">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							value="확인" id="okCoSelectUdt" data-toggle="modal"
							data-target="#coUdtModal">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="coUdtModal" role="dialog">
		<div class="modal-dialog">
			<form id="coUdtForm" method="post" action="coUdt.temp">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="num" value="${board.num}"> <input
							type="hidden" name="type" value="${type}"> <input
							type="hidden" name="currentPage" value="${currentPage}">
						<input type="hidden" name="cnum" id="cnum" value="">

						<div class="form-group">
							<textarea name="commant" class="form-control" id="upcontent"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							value="확인" id="okCoUdt">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".view-detail").click(function() {
				$("#myModal").modal({
					backdrop : "static"
				});
			});
			$("#ok").click(function() {
				$("#boardForm").submit();
			});
			$("#okUdt").click(function() {
				$("#boardFormUdt").submit();
			});
			$("#okCommant").click(function() {
				$("#commantForm").submit();
			});
			$("#okCoDel").click(function() {
				$("#coDelForm").submit();
			});
			$("#okCoSelectUdt").click(function() {
				var cpwd=$("#upcpwd").val();
				var cnum=$("#upcnum").val();
				_data = JSON.stringify({"cpwd":cpwd,"cnum":cnum});
				_url = "coUdtSelect.temp";
				$.ajax({
					type : "POST",
					url : _url,
					data : _data,
						beforeSend: function(xhr) {
			            xhr.setRequestHeader("Accept", "application/json");
			            xhr.setRequestHeader("Content-Type", "application/json");
			        },			
					success : function(data, status) {
						
						$("#upcontent").text(data.commant);
						$("#cnum").int(data.cnum);
						
					},
					error : function(request, status, error) {
						alert("code : " + request.statusText
								+ "\r\nmessage : " + request.responseText);
					}
				});
			});
			$("#okCoUdt").click(function() {
				$("#coUdtForm").submit();
			});
			$(".del").click(function() {
				$("input[name='cnum']").val($(this).data("cnum"));
			});
			$(".udt").click(function() {
				$("input[name='cnum']").val($(this).data("cnum"));
			});
		});
	</script>

	<jsp:include page="../footer.jsp" />

</body>
</html>
