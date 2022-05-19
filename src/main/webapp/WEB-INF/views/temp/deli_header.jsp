<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/deli_header.css" />
<header>
	<div class="head_menuWrap ">
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
						<a href="../member/mypage"><span>MyPage</span></a>
					</c:when>
					<c:otherwise>
						<a href="../member/login"><span>로그인</span></a>
						<a href="../member/join"><span>회원가입</span></a>
					</c:otherwise>
				</c:choose>
				<a href="../notice/list"><span>고객센터</span></a>
			</div>

			<div class="user d-flex justify-content-center">
				<c:choose>
					<c:when test="${not empty location}">
					<div>
				배달 매장 :
					</div>
				<div class="mx-3" style="display: inline; bottom: 0;">
				 ${shop.shopName}
				</div>
					<div>
				현재 주소지 :
					</div>
				<div class="mx-3" style="display: inline; bottom: 0;">
				 ${location}
				</div>
				<a class="btn btn-warning m-2" href="./cart" style="height: 40px;color:green;">장바구니</a>				
			</c:when>
					<c:otherwise>
						<a href="../member/login"> 로그인을 해주세요. </a>
					</c:otherwise>
				</c:choose>
			</div>


		</div>
	</div>
</header>