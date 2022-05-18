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
	<h3>비밀번호 재확인</h3>
	<h6>회원의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</h6>
	<div class="row mt-4">
		<form action="./updateCheck" method="post">
			<div class="mb-3">
				<label for="id" class="form-label">아이디</label> 
				<input type="text" name="id" id="id" readonly="readonly" class="form-control" value="${vo.id}">
			</div>
			<div class="mb-3">
				<label for="pw" class="form-label">비밀번호 </label>
				<input type="password" name="pw" class="form-control" id="pw" />
			</div>
			<button type="submit" class="btn btn-outline-success">확인</button>
		</form>
	</div>
</div>

<c:import url="../temp/footer.jsp"></c:import>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>