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

<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
	<div class="weblogin_ui">
		<fieldset class="login">
			<h3 class="tit01 tit_ico key02">로그인</h3>
			<div class="cont">
				<div class="inpbox">
					<label>
						<span class="hide">ID</span>
						<input type="text" placeholder="아이디">
					</label>
				</div>
			</div>
		</fieldset>
	</div>
<c:import url="../temp/footer.jsp"></c:import>
<script type="text/javascript" src="../css/login.css"></script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>

<%-- 			<form action="./login" method="post">
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
			</form> --%>