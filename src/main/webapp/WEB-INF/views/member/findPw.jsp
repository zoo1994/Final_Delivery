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
<title>비밀번호 찾기</title>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<div class="row mt-4"  style="width: 55rem; margin:0 auto;">
	<h6>가입시 등록하신 아이디와 핸드폰번호를 입력해주세요.</h6>
	<div class="row mt-4"id="divv">
		<form action="./findPw" id="findPwForm"method="post">
			<div class="mb-3">
				<label for="id" class="form-label">아이디</label> 
				<input type="text" name="id" id="id"  class="form-control" >
			</div>
			<div class="mb-3">
				<label for="phone" class="form-label">전화번호</label>
				<div class="input-group mb-3">
				<input type="text" name="phone" class="form-control" id="phone"/>
				<button type="button" id="messageBtn" class="col-2 btn btn-outline-success">인증번호 발송</button>
				</div>
				<div id="phoneDiv"></div>
				<div id="numBox" data-find="find"></div>
			</div>
			<button type="button" id="findPwBtn" class="btn btn-outline-success">비밀번호 찾기</button>
		</form>
	</div>
</div>

<c:import url="../temp/footer.jsp"></c:import>
	<script type="text/javascript" src="../js/pwChange2.js"></script>
	<script type="text/javascript" src="../js/join.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>