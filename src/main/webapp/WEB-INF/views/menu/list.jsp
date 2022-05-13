<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<c:import url="../temp/header_script.jsp"></c:import>
<title>Insert title here</title>
<style type="text/css">
	.detail {
		cursor:pointer;
	}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
	<div class="row mt-4">
		<c:choose>
			<c:when test="${category eq 1}">
				<img alt="" src="../resources/image/burger.PNG">
			</c:when>
			<c:when test="${category eq 2}">
				<img alt="" src="../resources/image/macLunch.PNG">
			</c:when>
			<c:when test="${category eq 3}">
				<img alt="" src="../resources/image/macMorning.PNG">
			</c:when>
			<c:when test="${category eq 4}">
				<img alt="" src="../resources/image/happySnack.PNG">
			</c:when>
			<c:when test="${category eq 5}">
				<img alt="" src="../resources/image/side.PNG">
			</c:when>
			<c:when test="${category eq 6}">
				<img alt="" src="../resources/image/macCafe.PNG">
			</c:when>
			<c:when test="${category eq 7}">
				<img alt="" src="../resources/image/happyMeal.PNG">
			</c:when>
			<c:otherwise>
				<img alt="" src="../resources/image/burger.PNG">
			</c:otherwise>
		</c:choose>
	</div>
	<div class="container mt-4">
	
	
	
	<div class="row">
		<p>∘ ${list.size()} Products</p>
	</div>
	<div class="row menuResult">
	  	<div class="row mt-4 justify-content-left">
			<c:forEach items="${list}" var="vo">
		
				<div class="card col-3 detail mx-5 mb-3" data-num="${vo.menuNum}">
				  <img src="../resources/upload/menu/${vo.menuFileVO.fileName}" class="card-img-top" alt="...">
				  <div class="card-body">
				    <p class="card-text">${vo.menuName}</p>
				    <p class="card-text">${vo.menuEng}</p>
				  </div>
				</div>
			
			</c:forEach>
			 
			
		</div> 
		
	</div>
	
	
		<div class="col-1">
			<a href="./add" type="button" class="btn btn-outline-primary">WRITE</a>
		</div>

</div>


<script type="text/javascript">
	$(".detail").click(function() {
		console.log("click");
		let num = $(this).attr("data-num");
		location.href="./detail?menuNum="+num;
	});
	

</script>
</body>
</html>