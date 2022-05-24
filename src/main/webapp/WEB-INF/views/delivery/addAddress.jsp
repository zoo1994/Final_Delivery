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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<div class="container mt-4" style="width: 50rem; margin: 0 auto;">
		<div class="row mt-4">
			<h3>입력하신 주소로 배달하시겠습니까?</h3>
			<div class="row mt-4">
				<input type="hidden" id="jibunAddress"> 
				<input type="hidden"id="extraAddress">
				<input type="hidden" id="input_postcode" class="form-control my-1" style="width: 200px"  readonly="readonly" value="${vo.postcode}">
				<input type="text" id="roadAddress" class="form-control"  readonly="readonly" value="${vo.roadAddress}">
				<div class="input-group mb-3 my-1" style="padding-left: 0; padding-right: 0;">
					<input type="text" id="detailAddress" class="form-control" value="${vo.detailAddress}">
					<div class="col-1"></div>
					<input class="col-2 btn btn-outline-success dropdown-toggle" type="button" id="addBtn" data-bs-toggle="dropdown" aria-expanded="false" onclick="showPostcode()" value="주소변경">
				</div>
				<span id="guide" style="color: #999; display: none"></span>
			</div>
			<div class="row justify-content-end">
				<button type="button" id="goBtn" class="col-2 btn btn-outline-success">주문하기</button>
			</div>
		</div>
	</div>
	<form action="./goDeli" method="post" id="goDeli">
		<input type="hidden" id="x" name="x">
		<input type="hidden" id="y" name="y">
		<input type="hidden" id="postcode" name="postcode">
		<input type="hidden" id="location" name="location">
		<input type="hidden" id="detailLocation" name="detailLocation">
	</form>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a58574ac7b94ffdb63ca1f5c17c22c7&libraries=services"></script>
	<script type="text/javascript" src="../js/map.js"></script>
	<script type="text/javascript" src="../js/addAddress.js"></script>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>
