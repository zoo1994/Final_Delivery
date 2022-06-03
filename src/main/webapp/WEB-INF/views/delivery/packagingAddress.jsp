<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<c:import url="../temp/deli_header.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<div class="row mt-3" style="width: 700px; margin: 0 auto;">
		<div class="form row mt-4">
			<form class="d-flex" action="./packagingAddress" method="get">
				<div class="col-sm-10">
					<input type="search" placeholder="매장명, 동명, 도로명을 검색해 주세요." title="검색어 입력" name="search" class="form-control">
				</div>
				<div class="col-sm-2" style="margin-left: 15px;">
					<button type="submit" class="searchBtn btn btn-warning">검색하기</button>
				</div>
			</form>
		</div>
	</div>

	
	<div class="row mt-4" style="width: 80rem; margin: 0 auto;">
		<div id="map" style="width: 1300px; height: 600px;"></div>
			<div class="row mt-3" style="width: 700px; margin: 0 auto;">
		</div>
		<div class="row mt-4">
			<table class="table">
				<thead class="table-light">
					<tr>
						<th class="col text-center align-items-center" style="">매장이름</th>
						<th class="col text-center align-items-center" style="">매장위치</th>
						<th class="col text-center align-items-center" style="">전화번호</th>
						<th class="col text-center align-items-center" style="">오픈시간</th>
						<th class="col text-center align-items-center" style="">마감시간</th>
						<th class="col text-center align-items-center" style="">운영여부</th>
					</tr>
				</thead>
				<tbody class="table-light">
					<c:forEach items="${list}" var="vo">
						<tr style="height: 60px;" class="selectShop" data-shopName="${vo.shopName}">
							<td class="col text-center align-items-center fw-bolder shopList"
								data-x="${vo.x_axis}" data-y="${vo.y_axis}" data-search="${pager.search}" style="">${vo.shopName}</td>
							<td class="col text-center align-items-center " style="">${vo.location}</td>
							<td class="col text-center align-items-center" style="">${vo.shopPhone}</td>
							<td class="col text-center align-items-center" style="">${vo.openTime}시</td>
							<td class="col text-center align-items-center" style="">${vo.closeTime}시</td>
							<td class="col text-center align-items-center" style="">
							<c:choose>
									<c:when test="${vo.open eq 0}">
							    				운영중
							    	</c:when>
									<c:otherwise>
							    				운영중지
							    	</c:otherwise>
							</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<nav aria-label="Page navigation example mt-5 bs-warning"
			style="margin-top: 10px;">
			<ul class="pagination justify-content-center"
				style="display: flex; width: 90%; margin: 0 auto;">
				<c:if test="${pager.pre}">
					<li class="page-item"><a href="./packagingAddress?search=${pager.search}&pn=${pager.startNum-1}" class="page-link">prev</a></li>
				</c:if>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<c:choose>
						<c:when test="${pager.pn eq i}">
							<li class="page-item"><a href="./packagingAddress?search=${pager.search}&pn=${i}" class="page-link" style="color:red">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a href="./packagingAddress?search=${pager.search}&pn=${i}" class="page-link" >${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pager.next}">
					<li class="page-item"><a href="./packagingAddress?search=${pager.search}&pn=${pager.lastNum+1}" class="page-link">next</a></li>
				</c:if>
			</ul>
			<span class="col-2"
				style="display: inline-block; text-align: end; width: 15%;">
			</span>
		</nav>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a58574ac7b94ffdb63ca1f5c17c22c7&libraries=services"></script>
	<script type="text/javascript" src="../js/packagingMap.js"></script>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>
