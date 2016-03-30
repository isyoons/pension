<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table" border="1" cellpadding="15" cellspacing="1"
	align="center">
	<tr>
		<td align="center" colspan="5"><img id="centerImg" src=""></td>
	</tr>
	<c:set var="newLine" value="0"></c:set>
	<tr>
		<c:forEach items="${roomImgs}" var="rImg">
			<td><img id="${rImg}"
				src="../../uploadFiles/${rImg }" width="100%" class="mOver"></td>
			<c:set var="newLine" value="${newLine + 1 }"></c:set>
			<c:if test="${newLine == 5 }">
				</tr>
				<tr>
			</c:if>
		</c:forEach>
	</tr>
</table>