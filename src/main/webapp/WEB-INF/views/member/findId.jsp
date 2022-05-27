<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<div class="row mt-4"  style="width: 55rem; margin:0 auto;">
	<h6>가입시 등록하신 이름과 핸드폰번호를 입력해주세요.</h6>
	<div class="row mt-4">
		<form action="./findId" id="findIdFrom"method="post">
			<div class="mb-3">
				<label for="name" class="form-label">이름</label> 
				<input type="text" name="name" id="name"  class="form-control" >
			</div>
			<div class="mb-3">
				<label for="phone" class="form-label">전화번호</label>
				<input type="text" name="phone" class="form-control" id="phone" placeholder="01000000000" />
			</div>
			<button type="button" id="findIdBtn" class="btn btn-outline-success">아이디 찾기</button>
		</form>
	</div>
</div>

<c:import url="../temp/footer.jsp"></c:import>
	<script type="text/javascript" src="../js/find.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>