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
<form action="./saleUpdate" method="post">
<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th>Num</th>
			<th>메뉴이름</th>
			<th>가격</th>
			<th>판매상태</th>
			<th>판매상태</th>
			<th>변경</th>
		</tr>	
	</thead>
	<tbody>
 		 <c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.menuNum}</td>
				<td class="detail" data-num="${vo.menuNum}">${vo.menuName}</td>
				<td>${vo.price}</td>	
			 	 <td class="menuSale">${vo.menuSale eq 1?'판매중':'판매중지'}</td>  
				<td>
					<div class="row mb-3">
						<div class="form-check">
							  <input class="form-check-input saleTrue" type="radio" name="menuSale" value="1" id="flexRadioDefault1" checked="checked"<c:if test="${vo.menuSale eq 1}">checked="checked"</c:if>>
							  <label class="form-check-label" for="flexRadioDefault1">
							    판매중
							  </label>
						</div>
						<div class="form-check">
							  <input class="form-check-input saleFalse" type="radio" name="menuSale" value="0" id="flexRadioDefault2" <c:if test="${vo.menuSale eq 0}">checked="checked"</c:if>>
							  <label class="form-check-label" for="flexRadioDefault2">
							    판매중지
							  </label>
						</div>
						</div>
				</td>
				<td>
					<button type="button" class="btn btn-outline-info updateBtn" data-num="${vo.menuNum}">변경</button>
				</td>
			</tr>
		</c:forEach>  
	</tbody>
</table>
</form>
	
		<div class="col-2">
			<a href="./add" type="button" class="btn btn-outline-primary">메뉴 추가</a>
		</div>

	</div>
</div>
<script type="text/javascript">
	$(".detail").click(function() {
		console.log("click");
		let num = $(this).attr("data-num");
		location.href="./manageDetail?menuNum="+num;
	});
	
	$(".updateBtn").click(function() {
		let num=$(this).attr("data-num");
		location.href="./update?menuNum="+num;
	});
	
/* 		let menuSale = null;
	$(".menuSale").each(function(idx,item) {
		let check = $(item).text();
		if(check == '판매중') {
			menuSale=1;
			$('.saleTrue').attr('checked', 'checked')
		}else {
			menuSale=0;
			
		}
		console.log(menuSale);
		
	}); */

	
</script>
</body>
</html>