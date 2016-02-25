<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
    <!-- menuType에 따라 active 설정 달라지도록 -->
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
					<li><a href="${pageContext.servletContext.contextPath}/Temp/TRoom/list.temp">About Room</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/Temp/TReservation/list.temp">Reservation</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/Temp/TGallery/list.jsp">Gallery</a></li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Board<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.servletContext.contextPath}/Temp/TBoard/list.temp?type=notice">Notice</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/Temp/TBoard/list.temp?type=faq">FAQ</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/Temp/TBoard/list.temp?type=reviews">Reviews</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">About Us<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.servletContext.contextPath}/Temp/TUs/introduce.jsp">Introduce</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/Temp/TUs/contactus.jsp">Contact Us</a></li>
						</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>Log out</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>