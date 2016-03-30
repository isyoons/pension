<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <!-- admin session check -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Temp.pe.kr 관리자</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
				
					<!-- menu active setting start -->
					<c:set var="room" value=""/>
					<c:set var="reserv" value=""/>
					<c:set var="gal" value=""/>
					<c:set var="board" value=""/>
					<c:set var="us" value=""/>
					<c:if test="${fn:contains(pageContext.request.requestURI, 'TRoom')}">
						<c:set var="room" value="active"/>
					</c:if>
					<c:if test="${fn:contains(pageContext.request.requestURI, 'TReservation')}">
						<c:set var="reserv" value="active"/>
					</c:if>
					<c:if test="${fn:contains(pageContext.request.requestURI, 'TGallery')}">
						<c:set var="gal" value="active"/>
					</c:if>
					<c:if test="${fn:contains(pageContext.request.requestURI, 'TBoard')}">
						<c:set var="board" value="active"/>
					</c:if>
					<c:if test="${fn:contains(pageContext.request.requestURI, 'TUs')}">
						<c:set var="us" value="active"/>
					</c:if>
					<!-- menu active setting end -->
									
					<li class="${room }"><a href="${pageContext.servletContext.contextPath}/Temp/TRoom/list.temp">About Room</a></li>
					<li class="${reserv }"><a href="${pageContext.servletContext.contextPath}/Temp/TReservation/list.temp">Reservation</a></li>
					<li class="${gal }"><a href="${pageContext.servletContext.contextPath}/Temp/TGallery/list.temp">Gallery</a></li>
					<li class="dropdown ${board }">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Board<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.servletContext.contextPath}/Temp/TBoard/list.temp?type=notice">Notice</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/Temp/TBoard/list.temp?type=faq">FAQ</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/Temp/TBoard/list.temp?type=reviews">Reviews</a></li>
						</ul>
					</li>
					<li class="dropdown ${us }"> 
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">About Us<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.servletContext.contextPath}/Temp/TUs/introduce.temp">Introduce</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/Temp/TUs/contactus.temp">Contact Us</a></li>
						</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.servletContext.contextPath}/Temp/logout.temp"><span class="glyphicon glyphicon-log-out"></span>Log out</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>