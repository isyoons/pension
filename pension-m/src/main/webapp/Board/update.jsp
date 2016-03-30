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
 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<!-- <script
	src="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.js"></script>
 -->
<link rel="stylesheet" href="../style/init.css">
<link rel="stylesheet" href="../style/board.css">

</head>

<body>
	<jsp:include page="../header.jsp" />
	<div class="row content">
		<div class="container-fluid text-center">
			<jsp:include page="../submenu.jsp" />
			<div class="container">
				<div class="col-sm-10 text-center sidecontents">
					<form class="form-horizontal" id="galleryForm" name="boardForm" role="form" method="post" action="updateSuc.temp" enctype="multipart/form-data">
						<div class="form-group" style="margin-top: 20px">

							<div class="form-group">
								<label class="col-sm-2 control-label">제목:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="title" name="title"
										value="${board.title}">
								</div>
								<label class="col-sm-2 control-label">글쓴이:
									${board.bname}</label>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">내용:</label>
								<div class="col-sm-10">
									<textarea rows="20" class="form-control" id="content" name="content">${board.content}</textarea>
									<script>
										CKEDITOR.replace('content');
									</script>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-10" style="float: right;">
									<input type="file" class="form-control" id="img" name="img" placeholder="select picture" accept="image/*">
								</div>
							</div>
							
							<input type="hidden" value="${board.num}" name="num">
							<input type="hidden" value="${type}" name="bsection">
							<input type="text" name="currentPage" value="${currentPage}">
							
							<div class="btn-right">
								<input type="submit" class="btn-primary" value="저장"
									onclick="alert('등록 되었습니다.')">
								<input type="button" class="btn-primary" value="취소"
									onclick="location.href='list.jsp'">
							</div>
						</div>
					</form>
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
