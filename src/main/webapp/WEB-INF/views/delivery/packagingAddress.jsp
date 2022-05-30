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
	<div class="container mt-4" style="width: 70rem; margin: 0 auto;">
		<div class="row mt-4">
			<div class="row mt-4">
				<input type="hidden" id="jibunAddress"> <input type="hidden"
					id="extraAddress"> <input type="hidden" id="postcode"
					class="form-control my-1" readonly style="width: 200px">
				<div class="input-group mb-2 my-1"
					style="padding-left: 0; padding-right: 0;">

					<input type="hidden" id="jibunAddress"> <input
						type="hidden" id="extraAddress"> <input type="hidden"
						id="roadAddress" class="form-control" readonly="readonly">
					<div class="input-group mb-3 my-1"
						style="padding-left: 0; padding-right: 0;">
						<input type="hidden" id="detailAddress" class="form-control">
						<div class="col-1"></div>
					</div>
					<span id="guide" style="color: #999; display: none"></span>
				</div>
				<div id="map" style="width: 1200px; height: 600px;"></div>
				<div class="row mt-4 justify-content-end">
					<input class="col-2 btn btn-outline-success dropdown-toggle"
						type="button" id="addBtn" data-bs-toggle="dropdown"
						aria-expanded="false" onclick="showPostcode()" value="주소검색">
					<button type="button" id="goBtn"
						class="col-2 btn btn-outline-success">포장하기</button>
				</div>
			</div>
			
			
		<div class="row mt-4">
			<table class="table" >
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
					<c:forEach items="${list}" var="vo" >
						<tr style="height: 60px;">
							<td class="col text-center align-items-center fw-bolder shopList" data-x="${vo.x_axis}" data-y="${vo.y_axis}"  style="">${vo.shopName}</td>
							<td class="col text-center align-items-center" style="">${vo.location}</td>
							<td class="col text-center align-items-center" style="">${vo.location}</td>
							<td class="col text-center align-items-center" style="">${vo.shopPhone}</td>
							<td class="col text-center align-items-center" style="">${vo.openTime}시</td>
							<td class="col text-center align-items-center" style="">${vo.closeTime}시</td>
							<td class="col text-center align-items-center" style=""><c:choose>
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
			
			<nav aria-label="Page navigation example mt-5 bs-warning" style="margin-top: 10px;">
				<ul class="pagination justify-content-center"
					style="display: flex; width: 90%; margin: 0 auto;">
					<c:if test="${pager.pre}">
						<li class="page-item"><button class="page-link" data-page="${pager.startNum-1}" data-search="${pager.search}">prev</button></li>
					</c:if>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li class="page-item"><button class="page-link" data-page="${i}">${i}</button></li>
					</c:forEach>
					<c:if test="${pager.next}">
						<li class="page-item"><button class="page-link"
								data-page="${pager.lastNum+1}" data-search="${pager.search}">next</button></li>
					</c:if>
				</ul>
			<span class="col-2"
				style="display: inline-block; text-align: end; width: 15%;">
			</span>
		</nav>
		</div>
		<form action="./goDeli" method="post" id="goDeli">
			<input type="hidden" id="x" name="x"> <input type="hidden"
				id="y" name="y"> <input type="hidden" id="input_postcode"
				name="postcode"> <input type="hidden" id="location"
				name="location"> <input type="hidden" id="detailLocation"
				name="detailLocation">
		</form>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a58574ac7b94ffdb63ca1f5c17c22c7&libraries=services"></script>
	<script type="text/javascript" src="../js/packagingMap.js"></script>
	<script type="text/javascript" src="../js/addAddress.js"></script>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>
