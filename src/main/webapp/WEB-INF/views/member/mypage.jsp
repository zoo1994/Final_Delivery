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

<title>Insert title here</title>
</head>
<body>

		<input name="id" type="hidden" value="${vo.id}">
		<div class="card" style="width: 18rem;">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">이름</li>
				<li class="list-group-item">${vo.name}</li>
				<li class="list-group-item">전화번호</li>
				<li class="list-group-item">${vo.phone}</li>
				<li class="list-group-item">이메일</li>
				<li class="list-group-item">${vo.email}</li>
				<li class="list-group-item">주소</li>
				<li class="list-group-item">${vo.roadAddress}</li>
				<li class="list-group-item">상세주소</li>
				<li class="list-group-item">${vo.detailAddress}</li>
				<li class="list-group-item">포인트</li>
				<li class="list-group-item">${vo.point}</li>
				<li class="list-group-item">생일</li>
				<li class="list-group-item">${vo.birth}</li>
			</ul>
		</div>
		<a href="./updateCheck" class="btn btn-outline-success">수정</a>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>