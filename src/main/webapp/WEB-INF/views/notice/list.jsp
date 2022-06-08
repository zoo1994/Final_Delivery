<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
 a {
	text-decoration: none;
	color: black;
	font-weight: bold;
}
</style>
<link rel="stylesheet" href="../css/tableRadius_board.css"/>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>

<div id="container">
	<div class="content">			

		<div class="contArea">
			<div class="inner">
				<div class="my-4" style="text-align: center; position: relative;">
					<img alt="" src="../resources/upload/notice/공지 이미지.png" style="width: 90%; margin-right: 50px;" >
					<div class="inner">
						<h1 class="titDep1" style="text-align: start; 	position: absolute; top: 50%; left: 20%; color: white; font-size: 40px; font-weight: 700;">공지사항</h1>
					</div>
				</div>
				<div class="container">
					<form class="d-flex mb-3" action="./list" method="get">
						<span class="col-9">
							<legend  style="font-weight: 500; line-height: 38px; font-size: 18px;">총 <span style="font-weight:bold; color: #da0000!important;">${count}건의</span> 게시물이 있습니다.</legend>
						</span>
						<span class="col-2"  style="margin-right:10px;">
							<input class="form-control me-2 rounded-pill" type="search" name="search" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit}" placeholder="Search" aria-label="Search">
						</span>
						<span class="col-1">
							<button class="btn btn-outline-success rounded-pill"  style="width: 80px;" type="submit">검색</button>
						</span>
					</form>

					 
					<table class="table">
					  <thead class="table-light">
					    <tr></tr>
					  </thead>
					  <tbody class="table-light">
							<c:forEach items="${list}" var="vo">
								<tr class="row" style="height: 80px; ">
							    	<td class="col-2 text-center d-flex align-items-center" style="padding: 0 auto;"><a class="" href="./detail?num=${vo.num}"  style="margin: 0 auto;">${vo.num}</a></td>
							    	<td class="col-8 d-flex align-items-center"  style="padding: 0 60px;"><a href="./detail?num=${vo.num}"> ${vo.title} </a></td>
							    	<td class="col-2 text-center d-flex align-items-center"  style="">${vo.regDate}</td>							    	
							    </tr>
							</c:forEach>
					  </tbody>				  
					  <tfoot class="table-light">
					    <tr></tr>
					  </tfoot>
					</table>

							<nav aria-label="Page navigation example mt-5 bs-warning">
							<span class="col-2" style="display: inline-block;"></span>
							<span class="col-8" style="display: inline-block;">
							  <ul class="pagination justify-content-center" style="display: flex; width: 90%; margin: 0 auto;">
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
							  </span> 
							  <span class="col-2" style="display: inline-block; text-align: end; width: 15%;">
							  	<c:if test="${member.userType == 0}">
							  		<a href="./add" class="btn btn-primary" style="display: inline-block; ">글쓰기</a>
							  	</c:if>
							  </span>
							</nav>
				</div>																				
			</div>
		</div>
		<!-- //contArea -->
	</div>			
</div>
<div style="margin-bottom: 200px;"></div>
<c:import url="../temp/footer.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
</body>
</html>
