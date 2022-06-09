<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이벤트 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<c:import url="../../temp/header.jsp"></c:import>
	<c:import url="../../temp/header_script.jsp"></c:import>
	

<div id="container">
	<div class="content">			
		<div class="contArea">
			<div class="inner">
				<div class="my-4" style="text-align: center; position: relative;">
					<img alt="" src="../resources/upload/notice/공지 이미지.png" style="width: 90%; margin-right: 50px;" >
					<div class="inner">
						<h1 class="titDep1" style="text-align: start; 	position: absolute; top: 50%; left: 20%; color: white; font-size: 40px; font-weight: 700;">프로모션</h1>
					</div>
				</div>
				<div class="container">
					
					<div class="d-flex mb-3">
						<input hidden name="category" type="text" id="categoryResult" value="1">
						<span class="col-9  mt-5">
							<legend  style="font-weight: 500; line-height: 38px; font-size: 18px;">총 <span style="font-weight:bold; color: #da0000!important;"><span class="category_count" id="category_count"></span> 개의</span> 이벤트가 검색되었습니다.</legend>
						</span>
						<span class="col-2 mt-5"  style="margin-right:10px;">
							<input id="event_search" class="form-control me-2 rounded-pill" type="search" name="search" autocomplete="off" onKeypress="javascript:if(event.keyCode==13) {removeResult(); pageMore=1; getList();}" placeholder="Search" aria-label="Search">
						</span>
						<span class="col-1 mt-5">
							<button class="btn btn-outline-success rounded-pill" id="event_search_btn"  style="width: 80px;" type="submit">검색</button>
						</span>
					</div>

					 <div class="" style="width: 1168px; margin: 0 auto;">
					<div class="row mt-4" id="eventListResult" style="">

					</div>
					</div>	
					<nav aria-label="Page navigation example mt-5 bs-warning" style="width: 1168px; margin: 0 auto;">
						<span class="col-2" style="display: inline-block;"></span>
						<span class="col-8" style="display: inline-block;"></span> 
						<span class="col-2" style="display: inline-block; text-align: end; width: 15%;">
							<c:if test="${member.userType == 0}">
								<a href="./add" class="btn btn-primary" style="display: inline-block; ">글쓰기</a>
							</c:if>
						</span>
					</nav>
				</div>																				
			</div>
		</div>
	</div>			
</div>
<div style="margin-bottom: 200px;"></div>

	
	<c:import url="../../temp/footer.jsp"></c:import>
	<script src="../resources/js/eventList.js"></script>
</body>
</html>
