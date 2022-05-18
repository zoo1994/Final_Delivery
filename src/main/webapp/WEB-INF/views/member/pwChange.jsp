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
			<form:form modelAttribute="memberVO" id="pwChangeForm" method="post" >
			<div class="mb-3">
				<label for="id" class="form-label">기존 비밀번호</label> 
				<input type="password" name="password" class="form-control" >
			</div>
			<div class="mb-3">
						<label for="pw" class="form-label">변경할 비밀번호 </label>
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
					<div class="row justify-content-end">
					<button type="button" id="pwChangeBtn" class="col-2 btn btn-outline-success">변경</button>
					</div>
		</form:form>
	</div>

<c:import url="../temp/footer.jsp"></c:import>
	<script type="text/javascript" src="../js/pwChange.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>