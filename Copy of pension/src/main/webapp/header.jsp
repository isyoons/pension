<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="${pageContext.servletContext.contextPath}">Temp.pe.kr</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">

				<!-- menu active setting start -->
				<c:set var="room" value="" />
				<c:set var="reserv" value="" />
				<c:set var="gal" value="" />
				<c:set var="board" value="" />
				<c:set var="us" value="" />
				<c:if test="${fn:contains(pageContext.request.requestURI, 'Room')}">
					<c:set var="room" value="active" />
				</c:if>
				<c:if
					test="${fn:contains(pageContext.request.requestURI, 'Reservation')}">
					<c:set var="reserv" value="active" />
				</c:if>
				<c:if
					test="${fn:contains(pageContext.request.requestURI, 'Gallery')}">
					<c:set var="gal" value="active" />
				</c:if>
				<c:if test="${fn:contains(pageContext.request.requestURI, 'Board')}">
					<c:set var="board" value="active" />
				</c:if>
				<c:if test="${fn:contains(pageContext.request.requestURI, 'Us')}">
					<c:set var="us" value="active" />
				</c:if>
				<!-- menu active setting end -->
				<%-- url="${pageContext.servletContext.contextPath}/room/roomcode.temp" --%>
				
				<li class="${room } dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">about room<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<c:forEach var="roomCode" items="${applicationScope.roomCodeList }">
							<li><a
								href="${pageContext.servletContext.contextPath}/room/rooms.temp?roomCode=${roomCode[0]}">${roomCode[1]}</a></li>
						</c:forEach>
					</ul></li>
				<li class="dropdown ${reserv }"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Reservation<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.servletContext.contextPath}/reservation/guide/guide.temp">예약안내</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/reservation/realtime/status_reservation.temp">실시간예약</a></li>

					</ul></li>
				<li class="${gal }"><a
					href="${pageContext.servletContext.contextPath}/Gallery/list.temp">Gallery</a></li>
				<li class="dropdown ${board }"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Board<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.servletContext.contextPath}/Board/list.temp?type=N">Notice</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/Board/list.temp?type=Q">FAQ</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/Board/list.temp?type=E">Reviews</a></li>
					</ul></li>
				<li class="dropdown ${us }"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">About Us<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.servletContext.contextPath}/Us/introduce.temp">Introduce</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/Us/contactus.temp">Contact
								Us</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>