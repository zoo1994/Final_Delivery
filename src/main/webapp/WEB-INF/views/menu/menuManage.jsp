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
	<div class="container">
	<div class="row mt-4"> 
	
		<p class="fs-3 fw-bolder">메뉴 관리</p>
	</div>
	<div class="row">

<table class="table table-hover">
	<thead>
		<tr class="table-warning">
			<th>Num</th>
			<th>메뉴이름</th>
			<th>가격</th>
			<th>판매상태</th>
			<th>변경</th>
		</tr>	
	</thead>
	<tbody>
 		 <c:forEach items="${list}" var="vo" varStatus="i">
			<tr>
				<td>${vo.menuNum}</td>
				<td class="detail" data-num="${vo.menuNum}">${vo.menuName}</td>
				<td>${vo.price}원</td>	

				<td>
					<div>
						<div class="form-check">
							  <input class="form-check-input menuSale${vo.menuNum}" type="radio" name="menuSale${vo.menuNum}" value="1" id="flexRadioDefault1" <c:if test="${vo.menuSale eq 1}">checked</c:if>>
							  <label class="form-check-label" for="flexRadioDefault1">
							    판매중
							  </label>
						</div>
						<div class="form-check">
							  <input class="form-check-input menuSale${vo.menuNum}" type="radio" name="menuSale${vo.menuNum}" value="0" id="flexRadioDefault2" <c:if test="${vo.menuSale eq 0}">checked</c:if>>
							  <label class="form-check-label" for="flexRadioDefault2">
							    판매중지
							  </label>
						</div>
						<div class="form-check">
							  <input class="form-check-input menuSale${vo.menuNum}" type="radio" name="menuSale${vo.menuNum}" value="2" id="flexRadioDefault3" <c:if test="${vo.menuSale eq 2}">checked</c:if>>
							  <label class="form-check-label" for="flexRadioDefault2">
							    단종
							  </label>
						</div>
						</div>
				</td>
				<td>
					<button type="button" class="btn btn-outline-success updateBtn" data-num="${vo.menuNum}">변경</button>
				</td>
			</tr>
		</c:forEach>  
	</tbody>
</table>

	
		<div class="col-2">
			<a href="./add" type="button" class="btn btn-outline-primary">메뉴 추가</a>
		</div>

	</div>
</div>
<script type="text/javascript" src="../js/menu.js"></script>
</body>
</html>