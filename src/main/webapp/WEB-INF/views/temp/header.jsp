 	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet"
	href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 100px; background-color: orange!important;">
		<div class="container-fluid">
			<a class="navbar-brand" href="/" style="color: white;font-size: 30px;">Home</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse nav" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item mx-3">
						<a class="nav-link active" aria-current="page" href="#" style="font-size: 20px">매장소개</a>
					</li>
					<li class="nav-item mx-3">
						<a class="nav-link active" href="/menu/list" id="navbarDropdown" role="button" style="font-size: 20px">MENU</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/menu/list?category=1">버거</a></li>
							<li><a class="dropdown-item" href="/menu/list?category=2">맥런치</a></li>
							<li><a class="dropdown-item" href="/menu/list?category=3">맥모닝</a></li>
							<li><a class="dropdown-item" href="/menu/list?category=4">해피스낵</a></li>
							<li><a class="dropdown-item" href="/menu/list?category=5">사이드&디저트</a></li>
							<li><a class="dropdown-item" href="/menu/list?category=6">맥카페&음료</a></li>
							<li><a class="dropdown-item" href="/menu/list?category=7">해피밀</a></li>
						</ul>
					</li>
					<li class="nav-item mx-3">
						<a class="nav-link active" href="/notice/list" id="navbarDropdown" role="button" style="font-size: 20px">고객센터</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/notice/list">공지사항</a></li>
							<li><a class="dropdown-item" href="/faq/list">FAQ</a></li>
							<li><a class="dropdown-item" href="/qna/list">1:1문의</a></li>
						</ul>
					</li>
					<li class="nav-item mx-3">
					<a class="nav-link active" aria-current="page" href="/event/list" style="font-size: 20px">이벤트</a>
					</li>

				</ul>
				<div class="d-flex">
					<c:choose>
						<c:when test="${empty member}">
							<li class="nav-item">
								
								<a class="nav-link btn btn-primary" href="/member/login" style="color: white; font-size: 20px; background-color: #FF8233!important; border:#FF8233!important">login</a>
							</li>
							<li class="nav-item">
								
								<a class="nav-link btn btn-primary mx-3" href="/member/join" style="color: white; font-size: 20px; background-color: #FF8233!important; border:#FF8233!important">Sign-Up</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item">
								
								<a class="nav-link btn btn-primary" href="${member.userType != 0 ? '/member/mypage' : '/admin/manager' }" style="color: white; font-size: 20px; background-color: #FF8233!important; border:#FF8233!important">MyPage</a>
							</li>
							<li class="nav-item">
								
								<a class="nav-link btn btn-primary mx-3" href="/member/logout" style="color: white; font-size: 20px; background-color: #FF8233!important; border:#FF8233!important">logout</a></li>
						</c:otherwise>
					</c:choose>
				</div>

					<a class="btn btn-success d-flex align-items-center justify-content-center" style="width: 150px; height:60px; font-size: 24px;" href="#">주문하기</a>

			</div>
		</div>
	</nav>
</header>