<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
	<h1>faq List</h1>

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
<div id="container">

				

			<div class="content">

				
				
				
				
				<!-- //visualArea -->
				<div class="contArea">
					<div class="inner">
					<div class="my-4" style="text-align: center; position: relative;">
							<img alt="" src="../resources/upload/notice/공지 이미지.png" style="width: 90%; margin-right: 50px;" >
							<div class="inner">
								<h1 class="titDep1" style="text-align: start; 	position: absolute; top: 50%; left: 20%; color: white; font-size: 40px; font-weight: 700;">자주 묻는 질문</h1>
							</div>
						</div>
						<div class="container">
							<form class="d-flex mb-3" action="./list" method="get">
								<legend class="col-9" style="font-weight: 500; line-height: 50px; font-size: 18px;">총 <span style="font-weight:bold; color: #da0000!important;">${count}건의</span> 게시물이 있습니다.</legend>
								<input class="form-control me-2 col-2" style="width: 240px;" type="search" name="search" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit}" placeholder="Search" aria-label="Search">
								<button class="btn btn-outline-success col-1"  style="width: 80px;" type="submit">검색</button>
							</form>

							 
							<table class="table">
							  <thead class="table-light">
							    <tr></tr>
							  </thead>
							  <tbody class="table-light">
									<c:forEach items="${list}" var="vo">
										<tr class="row" style="height: 80px; line-height: 60px;">
									    	<td class="col-2 text-center" style="">${vo.num}</td>
									    	<td class="col-8"  style="padding: 0 45px;"><a href="./detail?num=${vo.num}"> ${vo.title} </a></td>
									    	<td class="col-2 text-center"  style="">${vo.regDate}</td>							    	
									    </tr>
									</c:forEach>
							  </tbody>				  
							  <tfoot class="table-light">
							    <tr></tr>
							  </tfoot>
							</table>

							<nav aria-label="Page navigation example mt-5 bs-warning">
							  <ul class="pagination justify-content-center">
				<%-- 			  	<li class="page-item"><a class="page-link" href="./list?pn=${pager.startNum-1}"><<</a></li> --%>
							  	<c:if test="${pager.pre}">
							    	<li class="page-item"><a class="page-link" href="./list?pn=${pager.startNum-1}">prev</a></li>
							    </c:if>
							   	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							   		<li class="page-item"><a class="page-link" href="./list?pn=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
							   	</c:forEach>
							    <c:if test="${pager.next}">
							   		<li class="page-item"><a class="page-link" href="./list?pn=${pager.lastNum+1}">next</a></li>
							    </c:if>
				<%-- 			    <li class="page-item"><a class="page-link" href="./list?pn=${pager.lastNum+1}">>></a></li> --%>
							  </ul>
							</nav>	
							<a href="./add" class="btn btn-primary">ADD</a>							
						</div>																				
					</div>
				</div>
				<!-- //contArea -->
			</div>			
</div>


</body>
</html>
