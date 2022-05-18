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
<c:import url="../../temp/header.jsp"></c:import>
	<div class="row mt-4">
		<c:forEach items="${list}" var="vo">
			<div class="card detail" style="width: 18rem;">
				<c:if test="${not empty vo.filesVO[0]}"><img src="/resources/upload/board/event/${vo.filesVO[0].fileName}" class="card-img-top" alt="..."></c:if>
				<div class="card-body">
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><a href="./detail?eventNum=${vo.eventNum}">num : ${vo.eventNum}</a></li>
						<li class="list-group-item">id : ${vo.id}</li>
					</ul>
				</div>
			</div>
		</c:forEach>
	</div>
	<div>
		<a href="./list?pn=${pager.pre?pager.startNum-1:pager.startNum}">pre</a>
		<c:forEach  begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<a href="./list?pn=${i}">${i}</a>
		</c:forEach>
		<a href="./list?pn=${pager.next?pager.lastNum+1:pager.lastNum}">next</a>
	</div>
	<div>
		<form action="./list" method="get">
			<select name="kind">
				<option value="0" selected="selected">검색조건</option>
				<option value="0">제목</option>
				<option value="1">내용</option>
			</select>
			<input type="text" value="${pager.search}" name="search">
			<button type="submit">검색</button>
		</form>
	</div>
	<div class="row2 mt-4">
		<a href="./add" type="button" class="btn btn-warning">Add</a>
	</div>
<c:import url="../../temp/footer.jsp"></c:import>
</body>
</html>