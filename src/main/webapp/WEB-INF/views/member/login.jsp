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
<link rel="stylesheet" href="../css/login.css" />
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>

<c:import url="../temp/header.jsp"></c:import>
	<div style="height:70px"></div>
	<div class="loginOuter">
		<div class="loginDiv">
			<div class="titDiv">
				<p class="tit">로그인</p>
			</div>	
			<div class="loginForm" style="top:0px;">
			<form action="./login" method="post">
				<div>
					<div class="topDiv">
						<div class="inputDiv type2">
							<div class="topDiv">
								<input type="text" name="id" placeholder="아이디" id="id" >
							</div>
						</div>
						<div class="inputDiv type2">
							<div class="topDiv">
								<input type="password" name="pw" placeholder="비밀번호" id="pw">
							</div>
						</div>
					</div>
					<div class="bottomDiv">
						<button type="submit" class="yellowBtn">login</button>
						<div class="btnDiv">
							<a href="./findId">아이디 찾기</a>
							<a href="./findPw">비밀번호 찾기</a>
							<a href="./join">회원가입</a>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
<c:import url="../temp/footer.jsp"></c:import>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
<%-- 	<div class="container mt-4" >
		<div class="row mt-4">
			<form action="./login" method="post">
				<div class="row mt-4">
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">id</label>
						<input type="text" name="id" class="form-control"
							id="exampleFormControlInput1">
					</div>
					<div class="mb-3">
						<label for="exampleFormControlInput2" class="form-label">pw</label>
						<input type="password" name="pw" class="form-control"
							id="exampleFormControlInput2">

					</div>
					<div class="row justify-content-end">
						<button type="submit" class="col-1 btn btn-outline-success">login</button>
					</div>
				</div>
			</form>
		</div>
	</div> --%>