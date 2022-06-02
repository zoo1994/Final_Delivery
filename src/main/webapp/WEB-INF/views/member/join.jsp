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
<c:import url="../temp/header.jsp"></c:import>
	<div class="container mt-4" style ="width:40%">
		<div class="row mt-4">
			<form:form modelAttribute="memberVO" id="joinForm" method="post">
				<div class="row mt-4">
					<div class="mb-3">
						<label for="id" class="form-label">아이디</label>
						<div class="input-group mb-3">
						<form:input path="id" cssClass="form-control" id="id" />
						<button type="button" id="idCheckBtn" class="col-3 btn btn-outline-success">아이디 중복검사</button>
						</div>
						<div id="idError"></div>
						<div>
							<form:errors path="id"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="pw" class="form-label">비밀번호 </label>
						<form:password path="pw" cssClass="form-control" id="pw" />
						<div id="pwError"></div>
						<div>
							<form:errors path="pw"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="checkPw" class="form-label">비밀번호 재확인 </label>
						<form:password path="checkPw" cssClass="form-control" id="checkPw" />
						<div id="checkPwError"></div>
						<div>
							<form:errors path="checkPw"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="name" class="form-label">이름</label>
						<form:input path="name" cssClass="form-control" id="name" />
						<div id="nameError"></div>
						<div>
							<form:errors path="name"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="gender" class="form-label">성별</label>
						<form:select path="gender" cssClass="form-select" id="gender">
							<form:option value="2" selected="selected">성별</form:option>
							<form:option value="0">남성</form:option>
							<form:option value="1">여성</form:option>
						</form:select>
						<div id="genderError"></div>
						<div>
							<form:errors path="gender"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="year" class="form-label">생년월일</label>
						<div class="input-group mb-3">
							<form:input path="year" cssClass="form-control" id="year"
								placeholder="년(4자)" />
							<form:select path="month" cssClass="form-select" id="month">
								<form:option value="0" selected="selected">월</form:option>
								<form:option value="01">1월</form:option>
								<form:option value="02">2월</form:option>
								<form:option value="03">3월</form:option>
								<form:option value="04">4월</form:option>
								<form:option value="05">5월</form:option>
								<form:option value="06">6월</form:option>
								<form:option value="07">7월</form:option>
								<form:option value="08">8월</form:option>
								<form:option value="09">9월</form:option>
								<form:option value="10">10월</form:option>
								<form:option value="11">11월</form:option>
								<form:option value="12">12월</form:option>
							</form:select>
							<form:input path="day" cssClass="form-control" id="day" placeholder="일" />
						</div>
						<div id="birthError"></div>
						<div>
							<form:errors path="year"></form:errors>
						</div>
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">이메일 </label>
						<form:input path="email" cssClass="form-control" id="email"/>
						<div id="emailError"></div>
						<div>
							<form:errors path="email"></form:errors>
						</div>
					</div>
					<div class="mb-3" id="divv">
						<label for="phone" class="form-label">전화번호 </label>
						<div class="input-group mb-3">
						<form:input path="phone" cssClass="form-control" id="phone" />
						<button type="button" id="messageBtn" class="col-2 btn btn-outline-success">번호인증</button>
						</div>
						<div  id="phoneDiv">
							<form:errors path="phone"></form:errors>
						</div>
						<div id="numBox" data-find=""></div>
					</div>
				</div>
				<div class="input-group mb-3">
					<form:input path="postcode" readonly="readonly"  id="postcode" placeholder="우편번호" cssClass="form-control"/>
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
				<span id="guide" style="color:#999;display:none"></span>
				<div class="row">
					<div class="col">
						<form:input path="detailAddress" id="detailAddress" placeholder="상세주소" cssClass="form-control"/>
					</div>
					<div class="col">
						<input type="text" readonly="readonly"  id="extraAddress" placeholder="참고항목" class="form-control">
					</div>
				</div>
				<div>
					<div id="addressError"></div>
					<form:errors path="roadAddress"></form:errors>
				</div>
				<div class="row justify-content-end">
					<button type="button" id="joinBtn" class="col-1 btn btn-outline-success">join</button>
				</div>
			</form:form>
		</div>
	</div>
	<c:import url="../temp/footer.jsp"></c:import>
	<script type="text/javascript" src="../js/memberCheck.js"></script>
	<script type="text/javascript" src="../js/map.js"></script>
	<script type="text/javascript" src="../js/join.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>