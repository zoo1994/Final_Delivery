<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

	<h1>Notice List</h1>

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
		<a href="./add" class="btn btn-primary">ADD</a>
		
		<div>
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  	<c:if test="${pager.pre}">
			    	<li class="page-item"><a class="page-link" href="./list?pn=${pager.startNum-1}">Previous</a></li>
			    </c:if>
			   	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			   		<li class="page-item"><a class="page-link" href="./list?pn=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			   	</c:forEach>
			    <c:if test="${pager.next}">
			   		<li class="page-item"><a class="page-link" href="./list?pn=${pager.lastNum+1}">Next</a></li>
			    </c:if>
			  </ul>
			</nav>		
		</div>
	</div>

	<c:import url="../temp/header_script.jsp"></c:import>
</body>
</html>
