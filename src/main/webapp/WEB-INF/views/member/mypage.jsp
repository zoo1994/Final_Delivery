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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
</head>
<body>

	<input name="id" type="hidden" value="${vo.id}">
	<div class="card" style="width: 18rem;">
		<ul class="list-group list-group-flush">
			<li class="list-group-item">이름</li>
			<li class="list-group-item">${vo.name}</li>
			<li class="list-group-item">전화번호</li>
			<li class="list-group-item">${vo.phone}
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#exampleModal">수정</button> 
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">이메일주소</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<input type="text" id="emailBox" class="form-control">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">변경</button>
							</div>
						</div>
					</div>
				</div>
			</li>
			<li class="list-group-item">이메일</li>
			<li class="list-group-item">${vo.email}<button id="emailUpdate"
					class="btn btn-outline-success">수정</button></li>
			<li class="list-group-item">주소</li>
			<li class="list-group-item">${vo.roadAddress}</li>
			<li class="list-group-item">상세주소</li>
			<li class="list-group-item">${vo.detailAddress}<button
					id="emailUpdate" class="btn btn-outline-success">수정</button></li>
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

	<script type="text/javascript" src="../js/update.js"></script>

</body>
</html>