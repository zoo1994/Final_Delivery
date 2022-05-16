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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-4">
		<div class="row mt-4">
			<form:form modelAttribute="memberVO" id="joinForm" method="post"
				enctype="multipart/form-data">
					<div class="mb-3">
						<label for="pw" class="form-label">비밀번호 </label>
						<form:password path="pw" cssClass="form-control" id="pw" />
						<div>
							<form:errors path="pw"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="checkPw" class="form-label">비밀번호 재확인 </label>
						<form:password path="checkPw" cssClass="form-control" id="checkPw" />
						<div>
							<form:errors path="checkPw"></form:errors>
						</div>
					</div>
					<div class="mb-3">
					<div class="mb-3">
						<label for="email" class="form-label">이메일 </label>
						<form:input path="email" cssClass="form-control" id="email" value="${vo.email}"/>
						<div>
							<form:errors path="email"></form:errors>
						</div>
					</div>
					<div class="mb-3" id="divv">
						<label for="phone" class="form-label">전화번호 </label>
						<form:input path="phone" cssClass="form-control" id="phone" value="${vo.phone}"/>
						<div  id="phoneDiv">
							<form:errors path="phone"></form:errors>
						</div>
						<button type="button" id="messageBtn" class="col-1 btn btn-outline-success">번호인증</button>
						<div id="numBox"></div>
					</div>
				</div>
				<label for="phone" class="form-label">주소 </label>
				<input type="text" class="form-control" value="${vo.roadAddress}">
				<label for="phone" class="form-label">상세주소 </label>
				<input type="text" class="form-control" value="${vo.detailAddress}">
				<div class="input-group mb-3">
					<input type="text" readonly="readonly"  id="postcode" placeholder="우편번호" class="form-control">
					<input class="btn btn-outline-secondary dropdown-toggle"
						type="button" data-bs-toggle="dropdown" aria-expanded="false"
						onclick="showPostcode()" value="우편번호 찾기"><br>
				</div>
				<div class="row">
					<div class="col">
						<form:input path="roadAddress"  id="roadAddress" placeholder="도로명주소" cssClass="form-control" readonly="true"/>
					</div>
					<div class="col">
						<input type="text" readonly="readonly" id="jibunAddress" placeholder="지번주소" class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<form:input path="detailAddress" id="detailAddress" placeholder="상세주소" cssClass="form-control"/>
					</div>
					<div class="col">
						<input type="text" readonly="readonly"  id="extraAddress" placeholder="참고항목" class="form-control">
					</div>
				</div>
				<div>
					<form:errors path="roadAddress"></form:errors>
				</div>

				<div class="row justify-content-end">
					<button type="button" id="joinBtn" class="col-1 btn btn-outline-success">join</button>
				</div>
			</form:form>
		</div>
	</div>
	<script type="text/javascript" src="../js/memberCheck.js"></script>
	<script type="text/javascript" src="../js/map.js"></script>
	<script type="text/javascript" src="../js/join.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>