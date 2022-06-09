<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/deli_header.css" />
<header>
	<div class="head_menuWrap mb-1" style="display: block; position: static;">
		<div class="web_container">
			<a href="./home"> <img alt=""
				src="https://www.mcdonalds.co.kr/kor/images/common/logo.png">
			</a>
			<h1>딜리버리</h1>
			<div class="WEB utilWrap">
				<a href="../"><span>브랜드홈</span></a>

				<c:choose>
					<c:when test="${not empty member}">
						<a href="../member/logout"><span>로그아웃</span></a>
						<a href="../delivery/orderList"><span>주문내역</span></a>
					</c:when>
					<c:otherwise>
						<a href="../member/login"><span>로그인</span></a>
						<a href="../member/join"><span>회원가입</span></a>
					</c:otherwise>
				</c:choose>
				<a href="../qna/list"><span>고객센터</span></a>
			</div>

			<div class="user d-flex justify-content-center">
				<c:choose>
					<c:when test="${not empty pickup}">
						<div>포장 매장 :</div>
						<div class="mx-3" style="display: inline; bottom: 0;">${shop.shopName}</div>
						<a class="btn btn-warning m-2" href="./cart" style="height: 40px; color: green;">장바구니</a>
					</c:when>
					<c:when test="${not empty location && not empty member}">
						<div>배달 매장 :</div>
						<div class="mx-3" style="display: inline; bottom: 0;"
							id="shopName">${shop.shopName}</div>
						<div>현재 주소지 :</div>
						<div class="mx-3" style="display: inline; bottom: 0;">
							<p>${location}</p>
							<div class="d-flex justify-content-between">
								<div style="display: inline;">${detailLocation}</div>
								<div style="display: inline;">${postcode}</div>
							</div>
						</div>
						<a class="btn btn-success m-2" href="./addAddress"
							style="height: 40px; color: white;">주소변경</a>
						<a class="btn btn-warning m-2" href="./cart"
							style="height: 40px; color: green;">장바구니</a>
					</c:when>

					<c:when test="${not empty member && empty location}">
						<div>주소를 입력해주세요</div>
						<a class="btn btn-warning m-2" href="./addAddress"
							style="height: 40px; color: green;">주소입력</a>
					</c:when>
					<c:otherwise>
						<a href="../member/login"> 로그인을 해주세요. </a>
					</c:otherwise>
				</c:choose>
			</div>


		</div>
	</div>
</header>