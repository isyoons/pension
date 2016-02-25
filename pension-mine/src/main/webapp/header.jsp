<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- menuType에 따라 active 설정 달라지도록 -->
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
				<li class="active"><a
					href="${pageContext.servletContext.contextPath}">Home</a></li>
				<li><a
					href="${pageContext.servletContext.contextPath}/Room/list.temp">About
						Room</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Reservation<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.servletContext.contextPath}/reservation/guide/guide.temp">예약안내</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/reservation/realtime/status_reservation.jsp">실시간예약</a></li>
					</ul></li>
				<li><a
					href="${pageContext.servletContext.contextPath}/Gallery/list.jsp">Gallery</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Board<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.servletContext.contextPath}/Board/list.jsp?type=notice">Notice</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/Board/list.jsp?type=faq">FAQ</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/Board/list.jsp?type=reviews">Reviews</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">About Us<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.servletContext.contextPath}/Us/introduce.jsp">Introduce</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath}/Us/contactus.jsp">Contact
								Us</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>