<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"> 
	
</head>
<body>
	<c:import url="./temp/header.jsp"></c:import>
	<div id="wrap">
	

		<div class="container">

	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  	<div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1">
    </button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
   <!--  <div class="carousel-item active">
      <a href="#">
      <img src="https://www.mcdonalds.co.kr/upload/main/banner/1646731135357.png" class="d-block w-100" alt="...">
      </a> 
    </div>
    <div class="carousel-item">
      <a href="#">
      <img src="https://www.mcdonalds.co.kr/upload/main/banner/1651049844415.png" class="d-block w-100" alt="...">
      </a> 
    </div>
    <div class="carousel-item">
      <a href="#">
      <img src="https://www.mcdonalds.co.kr/upload/main/banner/1645007676428.png" class="d-block w-100" alt="...">
      </a> 
    </div>  -->
    
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
	<iframe width="100%" height="600px" src="https://www.youtube.com/embed/8IkkXQZeKeU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

	</div>

		<c:import url="./temp/footer.jsp"></c:import>

	</div>
	<c:import url="./temp/header_script.jsp"></c:import>
</body>
</html>
