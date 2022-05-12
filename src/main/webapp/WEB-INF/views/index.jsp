<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

<div class="container">

	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/e844f140-54dc-4a80-9bfc-a1ce88873365.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/a07b5c27-e0de-417b-b1d9-262207957e6c.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://d1cua0vf0mkpiy.cloudfront.net/images/web/banner/18fba3a8-1e24-48fa-82b0-b0d66831b28d.png" class="d-block w-100" alt="...">
    </div>
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
		<iframe width="100%" height="600px" src="https://www.youtube.com/embed/nmx2OiWEJBs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>

	<c:import url="./temp/header_script.jsp"></c:import>
</body>
</html>
