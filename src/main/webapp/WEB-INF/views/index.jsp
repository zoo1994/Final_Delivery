<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    pageContext.setAttribute("page", 10);
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/200px-McDonald%27s_Golden_Arches.svg.png"
	rel="shortcut icon" type="image/x-icon">
	<title>Home</title>
</head>
<body>
	<c:import url="./temp/header.jsp"></c:import>
	<div id="wrap">


		<div class="container">

	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  	<div class="carousel-indicators">
  		<c:forEach items="${list}" var="v" varStatus="i">
  			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${i.index}" aria-label="Slide ${i.index+1}" <c:if test="${i.index eq 0}">class="active"</c:if>></button>
  		</c:forEach>
 	 </div>
  <div class="carousel-inner">
    <!-- 배너 테이블에 이미지가 하나도 없을 경우 프리뷰 이미지 띄우기 -->
    <c:choose>
    	<c:when test="${fn:length(list) eq 0}">
    	     <div class="carousel-item active">
		      <a href="#">
		      <img src="https://dummyimage.com/800x400/ffffff/000000.png&text=preview+image" class="d-block w-100" alt="...">
		      </a> 
		    </div>
		    <div class="carousel-item">
		      <a href="#">
		      <img src="https://dummyimage.com/800x400/ffffff/000000.png&text=preview+image" class="d-block w-100" alt="...">
		      </a> 
		    </div>
		    <div class="carousel-item">
		      <a href="#">
		      <img src="https://dummyimage.com/800x400/ffffff/000000.png&text=preview+image" class="d-block w-100" alt="...">
		      </a> 
		    </div>  
    	</c:when>
    	<c:otherwise>
		     <c:forEach items="${list}" var="vo" varStatus="i">
		    	 <div class="carousel-item <c:if test="${i.index eq 0}">active</c:if>">
		      <a href="#">
		      <img src="../resources/upload/banner/${vo.fileName}" class="d-block w-100" alt="...">
		      </a> 
		    </div>
		    </c:forEach> 
    	</c:otherwise>
    </c:choose>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
	</div>
	<iframe width="100%" height="600px" class="mt-4" src="https://www.youtube.com/embed/8IkkXQZeKeU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

	<div class="row">
		<h1 class="fw-bolder">New Event!</h1>
	</div>
	<div class="row mt-4" id="eventListResult" style="">

	</div>
	
	</div>

		<c:import url="./temp/footer.jsp"></c:import>

	</div>
	<c:import url="./temp/header_script.jsp"></c:import>
<script src="../resources/js/homeEvent.js"></script>
<script type="text/javascript">


</script>
</body>
</html>
