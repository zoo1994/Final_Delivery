<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	<h1>Question List</h1>

	<div class="container">

		<table class="table">
			<thead>
				<tr>
					<th scope="col" width="10%">Num</th>
					<th scope="col" width="60%">Title</th>
					<th scope="col" width="20%">ID</th>
					<th scope="col">Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="vo">
					<tr>
						<th scope="row">${vo.num}</th>
						<td> <a href="./detail?num=${vo.num}"> ${vo.title} </a></td>
						<td>${vo.id}</td>
						<td>${vo.regDate}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
			<nav aria-label="Page navigation example">
				<ul class="pagination">
						<li class="page-item"><a class="page-link"
							href="./list?pn=${pager.pre?pager.startNum-1:1}&kind=${kind}&search=${search}">&lt;</a></li>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li class="page-item"><a class="page-link"
							href="./list?pn=${i}&kind=${kind}&search=${search}">${i}</a></li>
					</c:forEach>
					<li class="page-item"><a class="page-link"
						href="./list?pn=${pager.next? pager.lastNum+1:pager.lastNum}&kind=${kind}&search=${search}">&gt;</a></li>
				</ul>
			</nav>
		
		<a href="./add" class="btn btn-primary">ADD</a>

	</div>
		<c:import url="../../temp/footer.jsp"></c:import>
	<c:import url="../../temp/header_script.jsp"></c:import>
</body>
</html>
