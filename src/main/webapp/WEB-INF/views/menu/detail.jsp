<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
#menuImg {
	width:750px;
	height:550px;
	margin:0 auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
	<c:import url="../common/categoryBenner.jsp"></c:import>
	<div class="container">
		<div class="row mt-4">
			<h2 class="text-center fw-bolder">${vo.menuName}</h2>
			<h5 class="text-center text-muted">${vo.menuEng}</h5>
			<c:if test="${vo.menuFileVO.fileName ne null}">
				<img alt="" src="../resources/upload/menu/${vo.menuFileVO.fileName}" id="menuImg">
			
			</c:if>
			<h5 class="text-center text-muted">${vo.menuDetail}</h5>
		</div>
		
		<div class="row">
			<h3>영양정보</h3>
			<table class="table">
				  <thead>
				    <tr>
				    	<th scope="col">영양소</th>
				    	<th scope="col">중량(g)</th>
				    	<th scope="col">중량(ml)</th>
				    	<th scope="col">열량</th>
				    	<th scope="col">당</th>
				    	<th scope="col">단백질</th>
				    	<th scope="col">포화지방</th>
				    	<th scope="col">나트륨</th>
				    	<th scope="col">카페인</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">함량</th>
				      <td>${vo.ingredientVO.weight_g}</td>
				      <td>${vo.ingredientVO.weight_ml}</td>
				      <td>${vo.ingredientVO.calory}</td>
				      <td>${vo.ingredientVO.sugar}</td>
				      <td>${vo.ingredientVO.protein}</td>
				      <td>${vo.ingredientVO.fat}</td>
				      <td>${vo.ingredientVO.sodium}</td>
				      <td>${vo.ingredientVO.caffeine}</td>
				    </tr>
				  </tbody>
				</table>
		</div>

	</div>
	<!-- bootStrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>