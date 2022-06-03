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
<title>개인정보 수정</title>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<div class="row mt-4"  style="width: 55rem; margin:0 auto;">
	<div class="container mt-4">
		<div class="row mt-4">
			<form:form modelAttribute="memberVO" id="updateForm" method="post">
				<form:hidden path="id" value="${vo.id}"/>
				<div class="mb-3">
					<div class="mb-3">
						<label for="email" class="form-label">이메일 </label>
						<form:input path="email" cssClass="form-control" id="email" 
							value="${vo.email}" />
						<div id="emailError">
						</div>
						<div>
							<form:errors path="email" ></form:errors>
						</div>
					</div>
					<div class="mb-3" id="divv">
						<label for="phone" class="form-label">전화번호 </label>
						<div class="input-group mb-3">
						<form:input path="phone" cssClass="form-control" id="phone" 
							value="${vo.phone}" />
							<button type="button" id="messageBtn"
							class="col-2 btn btn-outline-success">번호인증</button>
						</div>
						<div id="phoneDiv">
							<form:errors path="phone"></form:errors>
						</div>
						
						<div id="numBox" data-find="find"></div>
					</div>
				</div>
				<div class="input-group mb-3">
					<form:input path="postcode" readonly="readonly" id="postcode" value="${vo.postcode}" cssClass="form-control"/>
					<input class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" onclick="showPostcode()" value="우편번호 찾기"><br>
				</div>

					<div class="col">
						<form:input path="roadAddress" id="roadAddress"
							 cssClass="form-control" readonly="true" value="${vo.roadAddress}" />
					</div>
					<input type="hidden" readonly="readonly" id="jibunAddress" placeholder="지번주소" class="form-control">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="hidden" readonly="readonly"  id="extraAddress" placeholder="참고항목" class="form-control">
					<div class="col">
						<form:input path="detailAddress" id="detailAddress"
							 value="${vo.detailAddress}"  cssClass="form-control" />
					</div>
				<div id="addressError"></div>
				<div>
					<form:errors path="roadAddress"></form:errors>
				</div>

				<div class="row justify-content-end">
					<button type="button" id="delMemBtn" class="col-2 btn btn-outline-success">회원탈퇴</button>
					<button type="button" id="updateBtn" class="col-2 btn btn-outline-success">수정</button>
				</div>
			</form:form>
		</div>
	</div>
	</div>
	<form action="./delMem" method="post" id="delForm">
		<input type="hidden" name="id" value="${vo.id}">
	</form>
	<c:import url="../temp/footer.jsp"></c:import>

	<script type="text/javascript" src="../js/update.js"></script>
	<script type="text/javascript" src="../js/map.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>