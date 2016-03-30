<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div class="col-sm-2 sidenav">
				<h3>Board</h3>
				<c:choose>
					<c:when test="${type=='N'}">
						<p><a href="${pageContext.servletContext.contextPath}/Board/list.temp?type=N" class="btn btn-primary btn-lg active">Notice</a></p>
					</c:when>
					<c:otherwise>
						<p><a href="${pageContext.servletContext.contextPath}/Board/list.temp?type=N" role="button">Notice</a></p>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${type=='Q'}">
						<p><a href="${pageContext.servletContext.contextPath}/Board/list.temp?type=Q" class="btn btn-primary btn-lg active">FAQ</a></p>
					</c:when>
					<c:otherwise>
						<p><a href="${pageContext.servletContext.contextPath}/Board/list.temp?type=Q" role="button">FAQ</a></p>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${type=='E'}">
						<p><a href="${pageContext.servletContext.contextPath}/Board/list.temp?type=E" class="btn btn-primary btn-lg active">Reviews</a></p>
					</c:when>
					<c:otherwise>
						<p><a href="${pageContext.servletContext.contextPath}/Board/list.temp?type=E" role="button">Reviews</a></p>
					</c:otherwise>
				</c:choose>
		</div>