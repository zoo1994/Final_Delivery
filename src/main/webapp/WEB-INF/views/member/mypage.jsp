<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<div class="row mt-4" style="width: 50rem; margin: 0 auto;">
		<div class="card text-center">
			<div class="card-header">이름</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
					<p>${vo.name}</p>
				</blockquote>
			</div>
		</div>
		<div class="card text-center">
			<div class="card-header">전화번호</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
					<p>${vo.phone}</p>
				</blockquote>
			</div>
		</div>
		<div class="card text-center">
			<div class="card-header">이메일</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
					<p>${vo.email}</p>
				</blockquote>
			</div>
		</div>
		<div class="card text-center">
			<div class="card-header">주소</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
					<p>${vo.roadAddress}</p>
				</blockquote>
			</div>
		</div>
		<div class="card text-center">
			<div class="card-header">상세주소</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
					<p>${vo.detailAddress}</p>
				</blockquote>
			</div>
		</div>
		<div class="card text-center">
			<div class="card-header">포인트</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
					<p>${vo.point}</p>
				</blockquote>
			</div>
		</div>
		<div class="card text-center">
			<div class="card-header">생일</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
					<p>${vo.birth}</p>
				</blockquote>
			</div>
		</div>
		<div class="row justify-content-end">
			<a href="./cpRegister" class="col-2 btn btn-outline-success">쿠폰함</a>
			<a href="./pwChange" class="col-2 btn btn-outline-success">비밀번호 변경</a> 
			<a href="./updateCheck" class="col-2  btn btn-outline-success">개인정보 변경</a>
			<c:if test="${member.userType eq 1}">
				<a href="../shop/shopMenu" class="col-2  btn btn-outline-success">매장 관리</a>		
			</c:if>
		</div>
	</div>
	<c:import url="../temp/footer.jsp"></c:import>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script type="text/javascript" src="../js/update.js"></script>

</body>
</html>